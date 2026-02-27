# AI Ideation Expert Agent — Plan

## Overview

When a new idea is submitted (issue created), trigger a Claude-powered AI agent via `anthropics/claude-code-action@v1` that acts as a **SaaS Ideation Expert**. The agent reads the issue body, evaluates it against the SaaS Factory Validation Engine criteria, performs web research on competitors and market landscape, and posts a 200–300 word expert assessment as an issue comment.

---

## Architecture

```
New Issue Created (issues.opened)
       │
       ▼
GitHub Actions Workflow (ideation-expert.yml)
       │
       ├── 1. Checkout repo (to access CLAUDE.md and docs/)
       ├── 2. Run claude-code-action with expert prompt
       │        ├── Reads issue body (problem, ICP, value hypothesis, etc.)
       │        ├── Reads docs/stage-criteria.md for evaluation rules
       │        ├── Performs web search on competitors/market
       │        └── Posts assessment as issue comment
       │
       └── 3. Adds label: `status:ai-reviewed`
```

---

## How It Works

### Trigger
- `issues.opened` — only when the issue title starts with `[IDEA]` (to avoid triggering on non-idea issues)

### Agent Behavior
The agent receives a detailed system prompt (stored in `CLAUDE.md`) that instructs it to:

1. **Parse the idea** — Extract key fields from the issue body (problem statement, ICP, value hypothesis, differentiation, market, SaaS readiness, etc.)

2. **Evaluate against criteria** — Check the 5 submission completeness items and assess quality signals:
   - Is the problem statement clear and specific (not generic)?
   - Is the ICP well-defined with specific personas?
   - Is the value hypothesis quantified (not vague)?
   - Are success metrics measurable?
   - Is differentiation specific to G42/Azure?
   - Is SaaS readiness assessed (flag "Unknown")?
   - Are named owners real people (not TBD)?

3. **Research** — Use web search to:
   - Identify 2–3 existing competitors or similar solutions in the market
   - Validate market claims (is this a real problem space?)
   - Check if Azure/cloud solutions already exist in this space

4. **Assess red-flag risks** — Flag early warnings for the 4 auto-HOLD conditions:
   - No viable tenancy/data isolation approach
   - No design partner or pilot path
   - No accountable product owner
   - Unit economics structurally negative

5. **Post assessment** — Write a 200–300 word expert summary as an issue comment with:
   - **Verdict**: Strong / Promising / Needs Work / Concerns
   - **Strengths**: What's well-articulated
   - **Gaps**: What's missing or vague
   - **Competitive Landscape**: 2–3 competitors found via research
   - **Recommendations**: Specific actions to strengthen the idea before Validate stage

---

## Files to Create/Modify

### 1. `CLAUDE.md` (Create)

Repository-level instructions file that Claude Code Action automatically reads. Contains the ideation expert persona, evaluation criteria, and output format.

```markdown
# G42 SaaS Factory — AI Ideation Expert

You are a senior SaaS strategy expert evaluating product ideas for the G42 SaaS Factory Board.

## Your Role
When a new idea is submitted (GitHub issue with [IDEA] prefix), analyze it and provide
a structured 200-300 word expert assessment.

## Evaluation Criteria
[Full criteria from stage-criteria.md — problem clarity, ICP specificity, value quantification,
differentiation, SaaS readiness, red-flag conditions, etc.]

## Output Format
Post your assessment as an issue comment using this structure:
### 🔍 AI Ideation Expert Assessment
**Verdict:** [Strong / Promising / Needs Work / Concerns]
#### Strengths
- ...
#### Gaps & Recommendations
- ...
#### Competitive Landscape
- ...
#### Red-Flag Check
- ...
```

### 2. `.github/workflows/ideation-expert.yml` (Create)

New workflow that triggers on issue creation and runs the Claude agent.

```yaml
name: AI Ideation Expert

on:
  issues:
    types: [opened]

permissions:
  contents: read
  issues: write

jobs:
  analyze-idea:
    runs-on: ubuntu-latest
    if: startsWith(github.event.issue.title, '[IDEA]')
    steps:
      - uses: actions/checkout@v4

      - uses: anthropics/claude-code-action@v1
        with:
          api_key: ${{ secrets.COMPASS_API_KEY }}
          prompt: |
            Analyze the idea in this GitHub issue. You are a senior SaaS strategy expert.

            Read the file docs/stage-criteria.md for the full evaluation framework.

            Evaluate this idea against the Ideate stage criteria and post your assessment
            as an issue comment. Your assessment must be 200-300 words and include:

            1. A verdict: Strong / Promising / Needs Work / Concerns
            2. Strengths of the submission
            3. Gaps and specific recommendations
            4. Competitive landscape (research 2-3 competitors)
            5. Red-flag risk check (the 4 auto-HOLD conditions)

            Be constructive and specific. Reference the actual content of the submission.
            Do NOT be generic. If a field is vague, explain exactly what's missing.

      - uses: actions/github-script@v7
        with:
          script: |
            await github.rest.issues.addLabels({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              labels: ['status:ai-reviewed']
            });
```

### 3. `scripts/setup-labels.sh` (Modify)

Add the new label:
```
status:ai-reviewed  - "AI expert assessment completed"  - #7057FF (purple)
```

### 4. New Repository Secret

| Secret | Purpose |
|--------|---------|
| `COMPASS_API_KEY` | Core42 Compass API key for AI Ideation Expert |

---

## Example Output (Posted as Issue Comment)

```markdown
### 🔍 AI Ideation Expert Assessment

**Verdict: Promising**

#### Strengths
- Clear problem statement targeting healthcare data fragmentation across G42 affiliates
- Well-defined ICP: mid-size hospitals (200-500 beds) in UAE/KSA with NABIDH/NPHIES compliance needs
- Quantified value hypothesis: 40% reduction in data reconciliation time, est. $2M annual savings per facility
- Named owners assigned with clear accountability

#### Gaps & Recommendations
- **Differentiation is vague** — "Why G42" section mentions "AI capabilities" but doesn't specify which models or why Azure over AWS HealthLake. Recommend articulating the specific G42/Azure advantage (e.g., sovereign cloud, M42 clinical AI models)
- **Success metrics lack leading indicators** — North-star metric (ARR) is defined but no leading indicators (pilot conversion rate, time-to-value, etc.)
- **SaaS readiness marked "Unknown"** — This should be assessed before advancing. Given existing on-prem deployment, likely Track B (Modernize-first)

#### Competitive Landscape
- **InterSystems HealthShare** — Established healthcare interoperability platform, strong in MENA
- **Cerner (Oracle Health)** — Cloud-based EHR with data exchange capabilities
- **Innovaccer** — Healthcare data platform with Azure partnership, growing in Gulf markets

#### Red-Flag Check
- ✅ Tenancy approach: Not yet assessed — recommend clarifying multi-tenant vs single-tenant for healthcare data
- ⚠️ Design partner: No pilot customer mentioned — recommend identifying 1-2 hospitals
- ✅ Product owner: Named (Dr. Sarah K., M42)
- ✅ Unit economics: Not yet modeled but $2M value hypothesis suggests viable path
```

---

## Verification

1. Add `COMPASS_API_KEY` secret to the repository
2. Run `scripts/setup-labels.sh` to create the `status:ai-reviewed` label
3. Create a test idea issue
4. Verify the AI Ideation Expert workflow triggers
5. Verify the agent posts a 200-300 word assessment comment
6. Verify the `status:ai-reviewed` label is applied
7. Check that the assessment references actual content from the issue (not generic)
8. Check that competitive landscape includes real companies (web search worked)

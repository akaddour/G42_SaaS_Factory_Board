# Workflow Guide: G42 SaaS Framework Process

This guide explains how to use the G42 SaaS Factory Board to manage ideas through the governance process, including automated stage gates, decision types, and validation templates.

---

## 1. Overview

The SaaS Framework moves every idea through five sequential stages, each with defined outcomes, checklists, and gate criteria enforced by GitHub Actions automation.

```
IDEATE  -->  VALIDATE  -->  BUILD  -->  SELL  -->  REVIEW
```

| Stage | Outcome |
|-------|---------|
| **Ideate** | Long list of ideas with clear outline of expected business value |
| **Validate** | Prioritized ideas based on G42 market potential and effort assessments |
| **Build** | Developed functional SaaS products ready to market |
| **Sell** | Packaged product offering with services and add-ons |
| **Review** | Assessed product performance with iteration plan to improve |

---

## 2. Roles and Responsibilities

### Business Units (BUs)

- **Lead:** Ideate, Build, Sell stages
- **Support:** Validate, Review stages
- Generate and champion ideas
- Execute product development
- Drive sales within their markets

### Group

- **Lead:** Validate, Review stages
- **Support:** Ideate, Build, Sell stages
- Provide templates and evaluation criteria
- Allocate ISE (Industry Solutions Engineering) resources
- Define success KPIs and standardize them across BUs

### Microsoft (MSFT)

- **Support:** All stages
- Facilitate CEO roundtables for ideation
- Provide global vertical knowledge and subject-matter experts (SMEs) for validation
- Co-build with ISE Engineers during the Build stage
- Activate products in Azure Marketplace during Sell

---

## 3. Stage Details

### Stage 1: IDEATE

**Purpose:** Generate a long list of ideas with a clear outline of expected business value.

**Outcome:** Documented idea with problem statement, market sizing, and BU sponsorship.

**Activities:**
- BUs submit ideas via Microsoft Forms nomination form or GitHub Issue template
- BU sponsor identified and committed
- Group template completed with supporting documentation

**Checklist:**
- [ ] Clear problem statement defined
- [ ] Business value articulated
- [ ] Initial market sizing done (TAM, SAM, SOM)
- [ ] BU sponsor identified
- [ ] Group template filled

**Exit Criteria / Gate Requirements:**
- All checklist items complete
- Admin approves transition to Validate

---

### Stage 2: VALIDATE

**Purpose:** Prioritize ideas based on G42 market potential and effort assessments.

**Outcome:** Scored and ranked idea with a GO / HOLD / KILL decision.

**Activities:**
- Group evaluates the idea against the validation engine (14-criterion prioritization scorecard)
- Business value ($) assessment and effort estimation (sales, technical, funding)
- Microsoft provides global vertical knowledge and SME review
- Red-flag check performed (any unresolved red-flag triggers auto HOLD)
- Gate decision issued: GO Fast-track, GO Modernize-first, HOLD, or KILL

**Checklist (Prioritization Scorecard -- 14 criteria, scored 0-5, weighted to 100 pts):**

Market and Strategic Fit:
- [ ] 1. Problem severity and urgency (Score: /5)
- [ ] 2. Repeatability across customers (Score: /5)
- [ ] 3. Design partners / pipeline evidence (Score: /5)
- [ ] 4. Strategic alignment (Score: /5)

Commercial and Economics:
- [ ] 5. Pricing power / willingness to pay (Score: /5)
- [ ] 6. Margin potential (COGS + cost-to-serve) (Score: /5)
- [ ] 7. Sales motion feasibility (Score: /5)

Technical and Delivery Feasibility:
- [ ] 8. SaaS readiness / complexity (Score: /5)
- [ ] 9. Security and compliance feasibility (Score: /5)
- [ ] 10. Operability (SRE readiness) (Score: /5)
- [ ] 11. Integration complexity (Score: /5)

Partnership Leverage (Microsoft/ISE):
- [ ] 12. Microsoft field verification strength (Score: /5)
- [ ] 13. Marketplace readiness path clarity (Score: /5)
- [ ] 14. ISE accelerator fit / engineering leverage (Score: /5)

Validation Templates:
- [ ] Template 2: Market Verification Pack completed
- [ ] Template 3: Technical Evaluation Pack completed
- [ ] Template 4: Business Plan (Lite) completed
- [ ] Template 5: Final Recommendation Memo completed

Red-Flag Check:
- [ ] Viable tenancy / data isolation approach exists
- [ ] Design partner or pilot path confirmed
- [ ] Accountable product owner assigned
- [ ] Unit economics not structurally negative

**Exit Criteria / Gate Requirements:**
- All checklist items complete
- A `decision:go-fast-track` or `decision:go-modernize` label applied (for progression to Build)
- No active `status:red-flag` label
- Prioritization complete and resources allocated

---

### Stage 3: BUILD

**Purpose:** Develop functional SaaS products ready to market.

**Outcome:** Production-ready product with documentation, security clearance, and commercial specifications.

**Activities:**
- BU leads product execution
- Group allocates ISE Engineers
- Microsoft provides co-build support and ensures Product-Led Growth (PLG) execution
- Product Intake Checklist completed across Business, Product Management, Technology, DevOps, Security, Finance, Commercials, and Operations domains

**Checklist (Product Intake Checklist):**

Business:
- [ ] Problem statement and ICP defined
- [ ] Market validation evidence
- [ ] Product positioning and messaging
- [ ] Regulatory constraints identified

Product Management:
- [ ] Product strategy and 12-18 month roadmap
- [ ] PRD / user journeys / backlog
- [ ] Stage-gate plan and launch readiness checklist

Technology:
- [ ] Target architecture for Azure SaaS
- [ ] Tenancy model selected
- [ ] Data partitioning and access controls
- [ ] API strategy and versioning

DevOps:
- [ ] CI/CD pipeline aligned to golden pipeline
- [ ] Infrastructure as Code (IaC) and landing zones
- [ ] Observability implemented
- [ ] DR/BCP and RTO/RPO defined and tested

Security:
- [ ] Security baseline alignment
- [ ] Threat model completed and reviewed
- [ ] Pen test / vulnerability remediation plan
- [ ] Compliance mapping and evidence pack

Finance:
- [ ] Business case and unit economics
- [ ] FinOps controls configured

Commercials:
- [ ] SKU packaging and tiering
- [ ] Metering and billing instrumentation
- [ ] Contract set ready (MSA/DPA/SLA/order form)
- [ ] Support model and SLAs

Operations:
- [ ] Runbooks and operational readiness review
- [ ] Customer onboarding and provisioning workflow

Product Documentation Pack:
- [ ] Product one-pager
- [ ] PRD-lite (MVP scope, journeys, acceptance criteria)
- [ ] Architecture outline + tenancy decision record
- [ ] Security feasibility pack
- [ ] Commercial spec (pricing/packaging v1)
- [ ] Delivery plan (milestones, resourcing, risks)
- [ ] Operational readiness plan
- [ ] Marketplace readiness plan (if applicable)

Product Roadmap (12-18 months):
- [ ] MVP phase (0-90 days)
- [ ] GA phase (90-180 days)
- [ ] Scale phase (6-12 months)

**Exit Criteria / Gate Requirements:**
- All Must items in the Product Intake Checklist complete
- Product is functional and quality standards met
- Documentation ready for market release

---

### Stage 4: SELL

**Purpose:** Package the product offering with services and add-ons and bring it to market.

**Outcome:** Product actively being sold with established customer base and revenue.

**Activities:**
- BU leads product sales in coordination with Group
- Group leads strategic international markets and I3 accounts
- Microsoft activates the product in Azure Marketplace

**Checklist:**

Pricing and Packaging:
- [ ] Pricing tiers established
- [ ] Licensing model confirmed
- [ ] Discount policies set

Sales Enablement:
- [ ] Product datasheets created
- [ ] Demo scripts prepared
- [ ] Case studies documented (if available)

Azure Marketplace (if applicable):
- [ ] Listing created and approved
- [ ] Transact capability enabled
- [ ] Co-sell ready status achieved

Partner Channel:
- [ ] Partner agreements in place
- [ ] Partner enablement completed
- [ ] Joint marketing planned

Customer Acquisition:
- [ ] Pilot customers onboarded
- [ ] Reference customers identified
- [ ] Revenue recognized

**Exit Criteria / Gate Requirements:**
- All checklist items complete
- Product actively being sold
- Revenue being generated and customers onboarded

---

### Stage 5: REVIEW

**Purpose:** Assess product performance and iterate to improve.

**Outcome:** Continuous cycle of review, feedback, and improvement planning.

**Activities:**
- BU tracks Success KPIs and supports feedback loops
- Group defines and standardizes KPIs across BUs
- Microsoft supports through Unified Support contract for similar services

**Checklist:**

KPI Tracking:
- [ ] Metrics dashboard created
- [ ] Baseline measurements taken
- [ ] Targets established

Customer Feedback:
- [ ] NPS surveys conducted
- [ ] Feature requests compiled
- [ ] Support trends analyzed

Performance Review:
- [ ] Quarterly review held
- [ ] Results vs targets analyzed
- [ ] Lessons learned documented

Improvement Planning:
- [ ] Enhancement priorities set
- [ ] Technical debt addressed
- [ ] Innovation opportunities identified

Next Iteration:
- [ ] Version roadmap updated
- [ ] Resource allocation confirmed
- [ ] Timeline established

**Exit Criteria / Gate Requirements:**
- Continuous review cycle established
- Regular review cadence maintained
- Improvement actions tracked and executed

---

## 4. Stage Gate Process

Stage gates are enforced automatically via GitHub Actions. No idea can skip a stage or advance with incomplete work.

### How It Works

1. **Admin adds a new stage label** (e.g., `stage:validate`) to an issue.
2. **The system checks whether the previous stage's checklist is complete.** It inspects checkboxes in the issue body and in stage-specific checklist comments.
3. **If the previous stage is incomplete:**
   - The new stage label is removed (transition blocked).
   - The `status:needs-info` label is added.
   - A comment is posted explaining how many checklist items remain.
4. **If the previous stage is complete:**
   - The old stage label is removed.
   - A new stage checklist is posted as a comment on the issue.
   - The stakeholder label is updated to reflect the new stage lead (`stakeholder:bu` or `stakeholder:group`).
   - The `status:ready-for-review` label is removed (reset for the new stage).

### Special Rule: Validate to Build

The Validate-to-Build gate has additional requirements beyond checklist completion:

- A `decision:go-fast-track` or `decision:go-modernize` label **must** be present. If no GO decision label exists, the transition is blocked.
- The `status:red-flag` label **must not** be present. If any red-flag is active, the transition is blocked until the flag is resolved and the label removed.

### Automatic Ready-for-Review Detection

When an issue is edited and all checkboxes (in the issue body and in stage-specific checklist comments) are checked, the system automatically adds the `status:ready-for-review` label and posts a notification comment. If any checkbox is later unchecked, the label is automatically removed.

---

## 5. Decision Types

At the end of the Validate stage, a gate decision is made. Admins apply one of the following decision labels:

### GO Fast-track (`decision:go-fast-track`)

The idea is SaaS-ready. Proceed directly to Build with a Track A (SaaS-ready) plan. The product can be built as a cloud-native SaaS offering without significant re-architecture.

### GO Modernize-first (`decision:go-modernize`)

The idea needs modernization before it can become a SaaS product. Proceed to Build with a Track B (modernize-first) plan. This typically applies to brownfield ideas that require re-architecture, re-platforming, or significant refactoring before SaaS delivery.

### HOLD (`decision:hold`)

The idea is blocked by a red-flag, missing information, or unresolved dependencies. The idea remains in Validate and is revisited when the blocking conditions are resolved. No progression to Build until the HOLD is lifted and a GO decision is issued.

### KILL (`decision:kill`)

The idea is not viable. The issue is closed. This may be due to fundamental market, technical, or economic issues that cannot be reasonably mitigated.

---

## 6. Red-Flag Overrides

Red-flag overrides represent fundamental blockers that automatically place an idea on HOLD regardless of other scores or evaluations. When any red-flag condition is active, the `status:red-flag` label is applied to the issue.

### Red-Flag Conditions

1. **No viable tenancy or data isolation approach for target segment** -- The product cannot provide adequate data separation or multi-tenancy for its intended customer base.

2. **No design partner or pilot path (no credible customer access)** -- There is no identified design partner, pilot customer, or credible path to early customer engagement.

3. **No accountable product owner (unowned initiative)** -- No named individual has accepted accountability for the product's success. Unowned initiatives do not proceed.

4. **Unit economics structurally negative with no mitigation path** -- The cost structure fundamentally exceeds revenue potential and there is no reasonable plan to achieve positive unit economics.

### Behavior

- When any red-flag is active, the `status:red-flag` label is applied to the issue.
- An idea with `status:red-flag` is automatically held and **cannot transition from Validate to Build**.
- The red-flag must be resolved and the `status:red-flag` label removed before the idea can proceed.
- Red-flag resolution should be documented in issue comments with evidence of mitigation.

---

## 7. Validation Engine Templates

The Validation Engine uses seven templates to structure the evaluation process. Templates are attached as comments or linked documents on the issue.

| Template | Name | When Used |
|----------|------|-----------|
| **Template 1** | Idea Intake Form | Every idea -- captures the initial submission (problem statement, market sizing, BU sponsor, business value). Used at the Ideate stage. |
| **Template 2** | Market Verification Pack | Validation -- covers market size validation, competitive landscape, growth trajectory, and Microsoft field verification. Joint effort between G42 and Microsoft. |
| **Template 3** | Technical Evaluation Pack | Validation -- covers architecture approach, SaaS readiness assessment (Track A vs B), security and compliance feasibility, integration complexity, and operability. |
| **Template 4** | Business Plan Lite | Validation -- covers financial projections, unit economics, pricing power and willingness-to-pay signals, sales motion feasibility, and resource requirements. |
| **Template 5** | Final Recommendation Memo | Gate decision -- consolidates all validation findings into a single recommendation document with the GO / HOLD / KILL decision and supporting rationale. |
| **Template 6** | Product Documentation Pack Checklist | For GO decisions -- defines the documentation deliverables required for Build (one-pager, PRD-lite, architecture outline, security pack, commercial spec, delivery plan, operational readiness plan, marketplace readiness plan). |
| **Template 7** | Product Roadmap 12-18 months | For GO decisions -- structures the product roadmap into MVP (0-90 days), GA (90-180 days), and Scale (6-12 months) phases with outcomes, capabilities, milestones, and dependencies. |

---

## 8. Using the GitHub Project Board

### Viewing Ideas

1. Go to the repository's **Projects** tab.
2. Open the **SaaS Factory Board**.
3. Ideas are organized by stage columns: Ideate, Validate, Build, Sell, Review.

### Filtering

Click **Filter** to narrow down the board view. Supported filter dimensions:

| Filter | Examples |
|--------|----------|
| **Business Unit** | `bu:presight`, `bu:analog`, `bu:core42`, `bu:m42`, etc. |
| **Stage** | `stage:ideate`, `stage:validate`, `stage:build`, `stage:sell`, `stage:review` |
| **Type** | `type:greenfield`, `type:brownfield`, `type:whitelabel` |
| **Priority** | `priority:high`, `priority:medium`, `priority:low` |
| **Vertical** | `vertical:healthcare`, `vertical:government`, etc. |
| **Track** | `track:a-saas-ready`, `track:b-modernize-first` |
| **Decision** | `decision:go-fast-track`, `decision:go-modernize`, `decision:hold`, `decision:kill` |

### Moving Ideas Between Stages (Admins)

1. Ensure all checklist items for the current stage are complete.
2. Confirm the `status:ready-for-review` label is present (auto-applied when all checkboxes are checked).
3. Add the new stage label (e.g., `stage:validate`). The GitHub Action will handle validation, old label removal, stakeholder updates, and checklist posting.
4. If the transition is blocked, review the bot comment for details on what remains incomplete.

---

## 9. Working on an Idea

### Adding Comments

- Use issue comments for discussion, questions, and status updates.
- Tag stakeholders using @mentions to notify specific people.
- Reference related issues with `#issue-number`.

### Uploading Documents

- Drag and drop files into issue comments (PDFs, images, Office documents supported).
- Or use the attach button in the comment editor.
- Attach validation templates, supporting evidence, and deliverables as comments or linked documents.

### Updating Checklists

- Click the checkbox in the issue body or checklist comment to toggle completion.
- When all checkboxes in a stage are checked, the system automatically adds the `status:ready-for-review` label.
- If any checkbox is later unchecked, the `status:ready-for-review` label is automatically removed.

### Notifications

GitHub will notify you when:
- You are mentioned in a comment.
- An issue you are watching is updated.
- You are assigned to an issue.
- A stage transition is blocked or completed (via bot comments).

Configure notification preferences in your GitHub settings.

---

## 10. Label Reference

### Stage Labels

| Label | Description |
|-------|-------------|
| `stage:ideate` | Idea is in the Ideate stage |
| `stage:validate` | Idea is in the Validate stage |
| `stage:build` | Idea is in the Build stage |
| `stage:sell` | Idea is in the Sell stage |
| `stage:review` | Idea is in the Review stage |

### Decision Labels

| Label | Description |
|-------|-------------|
| `decision:go-fast-track` | GO: Idea is SaaS-ready, fast-track to Build (Track A) |
| `decision:go-modernize` | GO: Needs modernization before SaaS, proceed to Build (Track B) |
| `decision:hold` | HOLD: Blocked, revisit when conditions resolved |
| `decision:kill` | KILL: Idea is not viable, close issue |

### Track Labels

| Label | Description |
|-------|-------------|
| `track:a-saas-ready` | Track A: Product is SaaS-ready, cloud-native build path |
| `track:b-modernize-first` | Track B: Product needs modernization before SaaS delivery |

### Status Labels

| Label | Description |
|-------|-------------|
| `status:needs-info` | Additional information or checklist completion required |
| `status:blocked` | Idea is blocked by an external dependency |
| `status:ready-for-review` | All stage checklist items complete, ready for admin review |
| `status:red-flag` | A red-flag override is active (auto HOLD until resolved) |

### Business Unit Labels

| Label | Description |
|-------|-------------|
| `bu:presight` | Presight |
| `bu:analog` | Analog |
| `bu:core42` | Core42 |
| `bu:m42` | M42 |
| `bu:inception` | Inception |
| `bu:astratech` | Astratech |
| `bu:khazna` | Khazna Data Centers |
| `bu:aiq` | AIQ |
| `bu:cpx` | CPX |
| `bu:space42` | Space42 |

### Vertical Labels

| Label | Description |
|-------|-------------|
| `vertical:healthcare` | Healthcare vertical |
| `vertical:government` | Government vertical |
| `vertical:financial-services` | Financial Services vertical |
| `vertical:cybersecurity` | Cybersecurity vertical |
| `vertical:education` | Education vertical |
| `vertical:other` | Other vertical |

### Type Labels

| Label | Description |
|-------|-------------|
| `type:greenfield` | Completely new product idea |
| `type:brownfield` | SaaSify an existing project or solution |
| `type:whitelabel` | Partner white-labeling opportunity |

### Stakeholder Labels

| Label | Description |
|-------|-------------|
| `stakeholder:bu` | Current stage is led by a Business Unit |
| `stakeholder:group` | Current stage is led by Group |
| `stakeholder:msft` | Microsoft is the primary support contact |

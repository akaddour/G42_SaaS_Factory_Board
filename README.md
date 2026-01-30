# G42 SaaS Factory Board

A GitHub-native governance system for triaging, validating, and tracking SaaS product ideas across G42 Business Units.

## Overview

This repository manages the end-to-end lifecycle of SaaS product ideas -- from initial ideation through validation, build, sales, and review. Every idea passes through a structured governance process powered by three core artifacts:

- **Validation Engine** -- Scores each idea against strategic-fit, market-size, technical-feasibility, and competitive-landscape criteria.
- **Prioritization Scorecard** -- Ranks validated ideas by weighted score so leadership can allocate resources to the highest-impact bets.
- **Product Intake Checklist** -- Gate-by-gate checklist that must be completed before an idea can advance to the next stage.

## SaaS Readiness Tracks

Every idea is assigned to one of two tracks after initial scoring:

| Track | Label | Description |
|-------|-------|-------------|
| **Track A -- SaaS-Ready** | `track:a-saas-ready` | Product can be built (or already exists) as a cloud-native SaaS offering. Fast-track to Build. |
| **Track B -- Modernize-First** | `track:b-modernize-first` | Product requires re-architecture, refactoring, or migration before it is SaaS-ready. Enters a modernization workstream before Build. |

## SaaS Framework Stages

| Stage | Gate Enforcement | Outcome |
|-------|-----------------|---------|
| **Backlog** | -- | Newly submitted ideas awaiting triage |
| **Ideate** | Intake Checklist (Section 1) | Long list of ideas with clear outline of expected business value |
| **Validate** | Validation Engine score + Prioritization Scorecard rank | Prioritized ideas based on G42 market potential and effort assessments |
| **Build** | Intake Checklist (Section 2) + track assignment | Developed functional SaaS products ready to market |
| **Sell** | Intake Checklist (Section 3) | Packaged product offering with services and add-ons |
| **Review** | KPI thresholds met | Assess product performance and iterate to improve |

## Decision Types

After validation scoring, each idea receives one of four decisions:

| Decision | Label | Meaning |
|----------|-------|---------|
| **GO Fast-track** | `decision:go-fast-track` | Approved -- proceeds directly to Build (Track A) |
| **GO Modernize-first** | `decision:go-modernize` | Approved -- enters modernization workstream before Build (Track B) |
| **HOLD** | `decision:hold` | Promising but not yet ready; revisit next cycle |
| **KILL** | `decision:kill` | Does not meet strategic or feasibility thresholds; archived |

## Red-Flag Overrides

Certain conditions trigger an automatic HOLD regardless of the scorecard result. When any red flag is active, the issue is labeled `status:red-flag` and cannot progress from Validate to Build until resolved:

- **No viable tenancy or data isolation approach** for the target segment
- **No design partner or pilot path** (no credible customer access)
- **No accountable product owner** (unowned initiative)
- **Unit economics structurally negative** with no mitigation path

## Stakeholders

- **BUs (Business Units)**: Generate and lead ideas, provide information, lead product execution and sales
- **Group**: Provide templates, evaluate ideas, allocate build efforts, lead on KPIs
- **MSFT (Microsoft)**: Support idea generation/validation, co-build, activate in Azure Marketplace

## Participating Business Units

- Presight
- Analog
- Core42
- M42
- Inception
- Astratech
- Khazna Data Centers
- AIQ
- CPX
- Space42

## How to Use

### Submitting a New Idea

1. **Via Microsoft Forms** (Recommended): Submit through the [Idea Nomination Form](https://forms.cloud.microsoft/r/GEFTydzj2V) -- automatically creates a GitHub issue
2. **Via GitHub**: Create a new issue using the "Idea Nomination" template

### Tracking Ideas

- View the [Project Board](../../projects) to see all ideas and their current stage
- Each idea is tracked as a GitHub Issue with stage-specific checklists and gate requirements

### Stage Transitions

1. Complete all checklist items for the current stage
2. Add the `status:ready-for-review` label
3. An admin will verify gate criteria and move the idea to the next stage

## Labels

### Stage Labels

| Label | Purpose |
|-------|---------|
| `stage:ideate` | Idea is in Ideate phase |
| `stage:validate` | Idea is in Validate phase |
| `stage:build` | Idea is in Build phase |
| `stage:sell` | Idea is in Sell phase |
| `stage:review` | Idea is in Review phase |

### Decision Labels

| Label | Purpose |
|-------|---------|
| `decision:go-fast-track` | Approved for fast-track to Build |
| `decision:go-modernize` | Approved with modernization required first |
| `decision:hold` | On hold -- revisit next cycle |
| `decision:kill` | Archived -- does not meet thresholds |

### Track Labels

| Label | Purpose |
|-------|---------|
| `track:a-saas-ready` | Assigned to Track A (SaaS-Ready) |
| `track:b-modernize-first` | Assigned to Track B (Modernize-First) |

### Status Labels

| Label | Purpose |
|-------|---------|
| `status:needs-info` | Waiting for more information |
| `status:blocked` | Blocked by external dependency |
| `status:ready-for-review` | Stage checklist complete; awaiting review |
| `status:red-flag` | Red-flag override active; auto HOLD until resolved |

### Type Labels

| Label | Purpose |
|-------|---------|
| `type:greenfield` | New idea |
| `type:brownfield` | SaaSify existing project |
| `type:whitelabel` | Partner white-labeling |

### Vertical Labels

| Label | Purpose |
|-------|---------|
| `vertical:healthcare` | Healthcare vertical |
| `vertical:government` | Government vertical |
| `vertical:financial-services` | Financial Services vertical |
| `vertical:cybersecurity` | Cybersecurity vertical |
| `vertical:education` | Education vertical |
| `vertical:other` | Other / cross-vertical |

### Business Unit Labels

| Label | Purpose |
|-------|---------|
| `bu:*` | Identifies the submitting Business Unit (e.g. `bu:core42`) |

## Documentation

- [Setup Guide](docs/setup-guide.md) -- How to set up MS Forms integration
- [Workflow Guide](docs/workflow-guide.md) -- Detailed process documentation
- [Stage Criteria](docs/stage-criteria.md) -- Criteria for each stage

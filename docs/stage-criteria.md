# G42 SaaS Factory -- Stage Criteria & Governance Reference

> **Version:** 1.0 | **Source documents:** Idea Prioritization Scorecard, SaaS Factory Product Intake Checklist, SaaS Factory Validation Engine

---

## 1. Overview

The G42 SaaS Factory operates a **five-stage, stage-gate governance system** that takes product ideas from initial nomination through validation, build, commercialisation, and continuous review. Every idea must pass defined entry criteria, complete stage-specific checklists, and clear an exit gate before advancing.

```
IDEATE --> VALIDATE --> BUILD --> SELL --> REVIEW
                                          |
                                          +---> (continuous cycle)
```

Three stakeholder groups share accountability across the lifecycle:

| Stakeholder | Primary role |
|-------------|-------------|
| **Business Units (BUs)** | Generate ideas, lead execution, drive sales |
| **Group (G42 SaaS Factory)** | Provide templates, evaluate via Validation Engine, allocate ISE, define KPIs |
| **Microsoft (MSFT)** | Validate via global vertical knowledge, co-build with ISE, activate Azure Marketplace |

---

## 2. Idea Types

| Type | Description |
|------|-------------|
| **Greenfield** | Completely new product idea |
| **Brownfield** | SaaSify an existing project or solution |
| **White-label** | Partner white-labeling opportunity |

---

## 3. SaaS Readiness Tracks

Every idea is classified into a readiness track during intake. The track determines the delivery path and influences the gate decision.

| Track | Meaning | Implication |
|-------|---------|-------------|
| **Track A -- SaaS-ready** | The solution can be delivered as a cloud-native SaaS offering on Azure with minimal modernisation | Fast-track to Build |
| **Track B -- Modernize-first** | The solution requires significant re-architecture, migration, or platform work before it can operate as SaaS | Additional modernisation epics must be scoped before Build |
| **Unknown** | Readiness has not yet been assessed | Must be resolved during Validate |

---

## 4. Stage 1: IDEATE

### Purpose

Generate a long list of ideas with a clear outline of expected business value.

### Entry Criteria

- Idea submitted via approved channel (Microsoft Forms or GitHub issue template)
- BU sponsor identified

### Template 1 -- Idea Intake Form

Complete for every new idea. Keep responses concise and evidence-based.

| # | Field | Guidance |
|---|-------|----------|
| 1 | Idea name | Short, descriptive name |
| 2 | Affiliate / BU | Submitting business unit (Presight, Analog, Core42, M42, Inception, Astratech, Khazna Data Centers, AIQ, CPX, Space42) |
| 3 | Vertical | Healthcare, Government, Financial Services, Cybersecurity, Education, Other |
| 4 | Problem statement | What problem are we solving? For whom? Why now? |
| 5 | Ideal Customer Profile (ICP) | Sector, size, geography, regulatory profile, buyer personas |
| 6 | Value hypothesis | Quantified outcome: cost reduction, compliance, time saved, revenue, risk reduction |
| 7 | Success metrics (initial) | North-star metric + 3-5 leading indicators |
| 8 | Proposed solution (1-2 sentences) | Solution summary |
| 9 | Differentiation | Why G42? Why Azure? Competitive advantage |
| 10 | SaaS readiness (initial) | Track A: SaaS-ready / Track B: Modernize-first / Unknown |
| 11 | Key constraints | Data residency, regulated requirements, integrations, latency, sovereignty constraints, value add |
| 12 | Customer evidence available | Existing pipeline / existing customers / none |
| 13 | Requested support -- Microsoft | Field validation / Marketplace guidance / Co-sell / ACR mapping |
| 14 | Requested support -- Microsoft ISE | Feasibility / Accelerators / Engineering capacity / Other |
| 15 | Requested support -- G42 SaaS Factory | Identity/tenant mgmt, metering, observability, CI/CD templates, etc. |
| 16 | Proposed timeline | Target MVP date / Target GA date |
| 17 | Named owners | G42 Product Owner, Affiliate Product Owner, Engineering Lead |

### Submission Completeness Check

All five items must be confirmed before the idea is accepted into the pipeline:

| # | Check |
|---|-------|
| 1 | Problem statement is clear |
| 2 | ICP defined |
| 3 | Success metrics proposed |
| 4 | Constraints captured |
| 5 | Named owners assigned |

### Exit Criteria

- All submission completeness check items confirmed
- Admin approval granted to advance to Validate

---

## 5. Stage 2: VALIDATE

### Purpose

Prioritise ideas based on G42 market potential and effort assessments, producing an evidence-based gate decision (GO / HOLD / KILL).

### Stakeholder Responsibilities

| Stakeholder | Role |
|-------------|------|
| **BUs** | Provide information as required |
| **Group** | Evaluate against the Validation Engine |
| **MSFT** | Support information provision and field validation |

### Prioritization Scorecard (100 points)

Each of the 14 criteria is scored **0-5**. The score is converted to weighted points using the formula:

```
Weighted pts = (Score / 5) x Weight
```

Weights are assigned per criterion and **must sum to 100**. All 14 criteria must be scored for a valid result.

#### Category: Market & Strategic Fit

| # | Criterion | Evidence Required (minimum) |
|---|-----------|---------------------------|
| 1 | Problem severity & urgency | Validated pain; urgency drivers; clear buyer |
| 2 | Repeatability across customers | Clear repeatable use case; not bespoke |
| 3 | Design partners / pipeline evidence | 2-3 design partners or credible pipeline |
| 4 | Strategic alignment | Aligned to priority verticals / strategic mandates |

#### Category: Commercial & Economics

| # | Criterion | Evidence Required (minimum) |
|---|-----------|---------------------------|
| 5 | Pricing power / willingness to pay | WTP signal; pricing band tested |
| 6 | Margin potential (COGS + cost-to-serve) | COGS drivers understood; gross margin path |
| 7 | Sales motion feasibility | Direct / partner / co-sell path defined |

#### Category: Technical & Delivery Feasibility

| # | Criterion | Evidence Required (minimum) |
|---|-----------|---------------------------|
| 8 | SaaS readiness / complexity | Track A/B decided; key epics identified |
| 9 | Security & compliance feasibility | Threat model v1; control mapping; evidence plan |
| 10 | Operability (SRE readiness) | SLOs, DR approach, run ownership feasible |
| 11 | Integration complexity | Integration map; known dependencies |

#### Category: Partnership Leverage (Microsoft / ISE)

| # | Criterion | Evidence Required (minimum) |
|---|-----------|---------------------------|
| 12 | Microsoft field verification strength | Field input; account relevance; objections |
| 13 | Marketplace readiness path clarity | Listing requirements and path understood |
| 14 | ISE accelerator fit / engineering leverage | ISE scope / accelerators identified |

#### Scorecard Decision Thresholds

| Total Score | Recommendation |
|-------------|---------------|
| >= 80 | **GO (Fast-track)** |
| 65 - 79 | **GO (Modernize-first / conditional)** |
| 50 - 64 | **HOLD (evidence gaps)** |
| < 50 | **KILL** |
| Any score + red-flag override = Yes | **HOLD (red-flag override)** |

> If fewer than 14 criteria are scored the result is **INCOMPLETE -- score all criteria**.

---

### Validation Templates

#### Template 2 -- Market Verification Pack (G42 + Microsoft)

Objective: confirm demand, urgency, willingness to adopt/pay, and the route-to-market. Attach evidence where possible.

| Section | Contents |
|---------|----------|
| 2.1 Executive summary | What did we learn and what changed based on evidence? Target segments and rationale. Design partners / pilot candidates. Key adoption risks. |
| 2.2 G42 market evidence | Customer pain points (validated). Willingness to pay / adoption signals. Procurement / compliance blockers. Competitive landscape (light). Minimum expected: 5-10 discovery interactions or equivalent account proof points. |
| 2.3 Microsoft market verification | Microsoft field validation (account relevance, co-sell fit, objections, competitive analysis, feature/functionality mapping). Marketplace suitability (listing path, category fit, requirements). Partner ecosystem leverage. ACR mapping inputs (likely Azure services and consumption drivers). |
| 2.4 GTM motion hypothesis | Primary sales motion (Direct / Partner / Marketplace / Co-sell / Hybrid). Buyer, user, champion personas. Time-to-value expectation. Launch scope constraints. |

#### Template 3 -- Technical Evaluation Pack

Objective: confirm SaaS feasibility on Azure, identify delivery approach, and surface major risks and dependencies.

| Section | Contents |
|---------|----------|
| 3.1 Current state | Current architecture summary (deployment model, tech stack, data stores, integrations). Current delivery model (release cadence, CI/CD maturity, environments). Operational maturity (monitoring, incident process, DR posture). |
| 3.2 Target SaaS model and tenancy | SaaS model (multi-tenant / single-tenant managed SaaS / hybrid). Tenancy and data isolation approach (partitioning strategy, isolation boundaries, key management assumptions). Data residency and regulatory needs. |
| 3.3 Security feasibility (threat model v1) | Primary threat scenarios (top 5). Baseline controls required (identity/RBAC, encryption, logging/audit, scanning). Compliance evidence plan (artifacts, cadence). Pen test approach (scope, timing, remediation SLA). |
| 3.4 Operability and reliability | Proposed SLOs/SLA tier (Standard / Premium / Regulated). DR expectations (RTO/RPO targets and approach). Run ownership model (G42 / Affiliate / Shared; on-call coverage). |
| 3.5 SaaS readiness classification and sizing | Track assignment (Track A or Track B). Modernization epics (if Track B). Integration dependencies. Effort class (T-shirt: S / M / L / XL). Critical path risks. ISE contribution (accelerators, squads, deliverables, handover needs). |

#### Template 4 -- Business Plan (Lite)

Objective: quantify value, validate commercial viability, and define the investment ask with assumptions.

| Section | Contents |
|---------|----------|
| 4.1 Executive summary | Product summary (one paragraph). Target customers (ICP and why). Commercial model (subscription / consumption / hybrid; key meters). Strategic alignment (why this matters to G42). |
| 4.2 Market size assumptions (ranges) | TAM, SAM, SOM (12-36 months) with assumption basis, low/high ranges. |
| 4.3 Financial model (lite) | Revenue range (Year 1-3; base/stretch). Cost drivers -- build (people, time, vendor/ISE, platform integration). Cost drivers -- cloud COGS (compute/storage/network). Cost-to-serve (support tiers, CS effort, on-call). Gross margin expectation and sensitivity. |
| 4.4 ACR logic (if applicable) | Azure consumption drivers (services expected to drive ACR). Assumptions (workload sizes, utilization, adoption ramp). Measurement/attribution approach. |
| 4.5 Risks and mitigations | Top risks (market, tech, compliance, delivery capacity). Specific mitigations and owners. |
| 4.6 Investment ask | Resourcing ask (G42/Affiliate/ISE roles and FTEs). Timeline ask (MVP and GA target dates). Decision required (what approval is requested). |

#### Template 5 -- Final Recommendation Memo (Gate Decision Record)

Objective: document a defensible decision and the conditions to proceed. Keep to 1-2 pages.

| Field | Description |
|-------|-------------|
| Decision | GO - Fast-track / GO - Modernize-first / HOLD / KILL |
| Rationale (3-5 bullets) | Evidence-based rationale for the decision |
| Scorecard result | Total score and key score drivers |
| Red-flag check | Any red flags? If yes, specify remediation plan |
| Conditions to proceed | List conditions + owners + due dates |
| Dependencies | Microsoft/ISE dependencies; Affiliate commitments |
| Investment ask | People / time / cost and what is approved |
| Target dates | MVP / GA / Scale milestones |
| Named owners | G42 PO, Affiliate PO, Eng Lead, CS Lead, Security Lead |

---

### Red-Flag Overrides (auto HOLD)

If **any** of the following conditions is true, the recommendation is automatically set to **HOLD** regardless of the total score. The hold persists until the red flag is resolved.

| # | Red-Flag Condition |
|---|--------------------|
| 1 | No viable tenancy or data isolation approach for target segment |
| 2 | No design partner or pilot path (no credible customer access) |
| 3 | No accountable product owner (unowned initiative) |
| 4 | Unit economics structurally negative with no mitigation path |

---

### Gate Decision

| Decision | Meaning |
|----------|---------|
| **GO Fast-track** | Approved to proceed directly to Build (Track A) |
| **GO Modernize-first** | Approved to proceed to Build with mandatory modernisation epics (Track B) |
| **HOLD** | Paused pending resolution of evidence gaps or red flags |
| **KILL** | Idea rejected; no further investment |

### Exit Criteria

- Positive GO decision recorded
- Prioritisation complete (scorecard finalised, rank assigned)
- Resources allocated for Build stage

---

## 6. Stage 3: BUILD

### Purpose

Develop functional SaaS products ready to market.

### Stakeholder Responsibilities

| Stakeholder | Role |
|-------------|------|
| **BUs** | Lead product execution |
| **Group** | Allocate ISE Engineers, enforce governance |
| **MSFT** | Co-build, ensure Product-Led Growth execution |

### Product Intake Checklist (26 items across 8 sections)

Every item has an assigned **Owner** (G42 or Affiliate) and **Priority** (Must or Should).

#### Business (4 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 1 | Problem statement & ICP defined | Clear target industry/segment, buyer/user personas, primary use cases, and differentiation vs alternatives | G42 | Must |
| 2 | Market validation evidence | Customer interviews/pilots, referenceable design partners, quantified pain, and willingness-to-pay signal | Affiliate | Should |
| 3 | Product positioning & messaging | One-page positioning: value prop, key messages, competitor map, and proof points | G42 | Must |
| 4 | Regulatory constraints identified | Data residency, sector regulations, and customer requirements captured with impact on tenancy and deployment model | Affiliate | Must |

#### Product Management (3 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 5 | Product strategy & 12-18 month roadmap | Strategic goals, themes, quarterly OKRs, and measurable outcomes; aligned to group portfolio priorities | G42 | Must |
| 6 | PRD / user journeys / backlog | PRD with user journeys, non-functional requirements, acceptance criteria, and prioritised backlog | Affiliate | Must |
| 7 | Stage-gate plan and launch readiness checklist | Gate 0-4 milestones, owners, dates; launch checklist includes SLO/SLA, support, security, pricing, legal | G42 | Must |

#### Technology (4 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 8 | Target architecture for Azure SaaS | Reference architecture selected; core services identified; integration points; scalability and cost considerations | Affiliate | Must |
| 9 | Tenancy model selected | Multi-tenant, single-tenant, or hybrid; isolation boundaries; tenant provisioning lifecycle documented | G42 | Must |
| 10 | Data partitioning and access controls | Tenant-aware data model; least-privilege access; row/partition isolation; auditability | Affiliate | Must |
| 11 | API strategy & versioning | API-first interfaces; authN/authZ; versioning and deprecation policy; API documentation published | G42 | Should |

#### DevOps (4 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 12 | CI/CD pipeline aligned to golden pipeline | Automated build/test, security scans, artifact versioning, approvals, and environment promotions | G42 | Must |
| 13 | Infrastructure as Code (IaC) & landing zones | Repeatable deployments using IaC; dev/test/prod separation; policy-as-code enforcement | G42 | Must |
| 14 | Observability implemented | Logs/metrics/traces with dashboards; alerting tied to SLOs; runbooks and on-call integration | Affiliate | Must |
| 15 | DR/BCP and RTO/RPO defined and tested | Documented RTO/RPO per tier; backups; failover procedures; periodic testing with evidence | Affiliate | Should |

#### Security (4 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 16 | Security baseline alignment | MFA, RBAC, secrets management, encryption in transit/at rest, secure SDLC controls, audit logging | G42 | Must |
| 17 | Threat model completed and reviewed | Threat model, mitigations, and residual risk sign-off; exceptions documented with expiry | G42 | Must |
| 18 | Pen test / vulnerability remediation plan | Pre-launch pen test completed; remediation tracked; patch SLAs defined; evidence retained | Affiliate | Must |
| 19 | Compliance mapping & evidence pack | Controls mapped to required standards; evidence collection plan; continuous compliance dashboarding | G42 | Should |

#### Finance (2 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 20 | Business case & unit economics | Pricing assumptions, TAM/SAM/SOM, forecast, Azure COGS model, gross margin targets, support cost model | G42 | Must |
| 21 | FinOps controls configured | Budgets, alerts, tagging, cost allocation (showback/chargeback), reserved capacity strategy | G42 | Should |

#### Commercials (4 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 22 | SKU packaging & tiering | Defined SKUs, tiers, add-ons, service attach options; feature entitlements and limits documented | G42 | Must |
| 23 | Metering & billing instrumentation | Usage events captured, rated, and reconciled; invoice/export integration path defined | G42 | Must |
| 24 | Contract set ready (MSA/DPA/SLA/order form) | Standard contract templates populated for product specifics; service credits and obligations defined | G42 | Must |
| 25 | Support model and SLAs | Support tiers (L1-L3), response/restore targets, escalation, customer success motions | Affiliate | Must |

#### Operations (2 items)

| # | Checklist Item | Acceptance Criteria | Owner | Priority |
|---|---------------|-------------------|-------|----------|
| 26 | Runbooks and operational readiness review | Operational readiness completed; runbooks, KB articles, monitoring, incident playbooks in place | Affiliate | Should |
| 27 | Customer onboarding & provisioning workflow | Standard tenant provisioning, onboarding checklist, training materials, and admin guides | G42 | Should |

### Intake Checklist Summary

| Section | Total Items | Must | Should | G42-owned | Affiliate-owned |
|---------|-------------|------|--------|-----------|-----------------|
| Business | 4 | 3 | 1 | 2 | 2 |
| Product Management | 3 | 3 | 0 | 2 | 1 |
| Technology | 4 | 3 | 1 | 2 | 2 |
| DevOps | 4 | 3 | 1 | 2 | 2 |
| Security | 4 | 3 | 1 | 2 | 2 |
| Finance | 2 | 1 | 1 | 2 | 0 |
| Commercials | 4 | 4 | 0 | 3 | 1 |
| Operations | 2 | 0 | 2 | 1 | 1 |
| **Total** | **27** | **20** | **7** | **16** | **11** |

---

### Product Documentation Pack (Template 6)

Attach this checklist to every GO recommendation. All items must be created or explicitly waived with rationale.

| # | Document |
|---|----------|
| 1 | Product one-pager (problem, ICP, value, KPIs) |
| 2 | PRD-lite (MVP scope, journeys, acceptance criteria) |
| 3 | Architecture outline + tenancy decision record |
| 4 | Security feasibility pack (threat model v1 + evidence plan) |
| 5 | Commercial spec (pricing/packaging v1 + tier definitions) |
| 6 | Delivery plan (milestones, resourcing, risks, dependencies) |
| 7 | Operational readiness plan (SLOs, DR, runbooks, support model) |
| 8 | Marketplace readiness plan (if applicable) |

---

### Product Roadmap (Template 7)

Structure the roadmap by phases. Include explicit dependencies.

| Phase | Timeframe | Outcome | Key Capabilities | Milestones / Dates | Dependencies | Owner |
|-------|-----------|---------|-----------------|-------------------|--------------|-------|
| **MVP** | 0-90 days | Minimum viable product delivered | Core features for design partner validation | MVP launch date | Microsoft/ISE, platform services, affiliate dependencies | G42 / Affiliate |
| **GA** | 90-180 days | General availability release | Full feature set, security hardened, marketplace-listed | GA launch date | Microsoft/ISE, platform services, affiliate dependencies | G42 / Affiliate |
| **Scale** | 6-12 months | Growth and expansion | Multi-region, advanced features, partner integrations | Scale milestones | Microsoft/ISE, platform services, affiliate dependencies | G42 / Affiliate |

### Exit Criteria

- Product is functional and meets quality standards
- All "Must" checklist items complete (or explicitly waived with rationale)
- Product Documentation Pack (Template 6) delivered
- Ready for market release

---

## 7. Stage 4: SELL

### Purpose

Package product offering with services and add-ons.

### Stakeholder Responsibilities

| Stakeholder | Role |
|-------------|------|
| **BUs** | Lead product sales with Group coordination |
| **Group** | Lead strategic international markets and I3 accounts |
| **MSFT** | Activate in Azure Marketplace |

### Checklist

| # | Item | Details |
|---|------|---------|
| 1 | Pricing model defined | Pricing tiers established, licensing model confirmed, discount policies set |
| 2 | Sales collateral created | Product datasheets, demo scripts, case studies (if available) |
| 3 | Azure Marketplace listing (if applicable) | Listing created and approved, transact capability enabled, co-sell ready status achieved |
| 4 | Partner channel activated | Partner agreements in place, partner enablement completed, joint marketing planned |
| 5 | First customers acquired | Pilot customers onboarded, reference customers identified, revenue recognised |

### Exit Criteria

- Product actively being sold
- Revenue being generated
- Customer base established

---

## 8. Stage 5: REVIEW

### Purpose

Assess product performance and iterate to improve.

### Stakeholder Responsibilities

| Stakeholder | Role |
|-------------|------|
| **BUs** | Track success KPIs, support feedback loops |
| **Group** | Define and standardise KPIs across BUs, support feedback |
| **MSFT** | Utilise Unified Support for similar services |

### Key Performance Indicators (KPIs)

| Category | Metrics |
|----------|---------|
| **Revenue** | ARR, MRR, growth rate |
| **Customers** | Count, retention rate, NPS |
| **Product** | Usage, adoption, feature utilisation |
| **Operations** | Uptime, support tickets, resolution time |

### Checklist

| # | Item | Details |
|---|------|---------|
| 1 | KPIs defined and tracked | Metrics dashboard created, baseline measurements taken, targets established |
| 2 | Customer feedback collected | NPS surveys conducted, feature requests compiled, support trends analysed |
| 3 | Performance review completed | Quarterly review held, results vs targets analysed, lessons learned documented |
| 4 | Improvement roadmap created | Enhancement priorities set, technical debt addressed, innovation opportunities identified |
| 5 | Next iteration planned | Version roadmap updated, resource allocation confirmed, timeline established |

### Exit Criteria

- Continuous review cycle established
- Regular review cadence maintained
- Improvement actions tracked and executed

---

## 9. Stage Transition Summary

| From | To | Entry Requirements | Key Gate Artefacts |
|------|-----|-------------------|-------------------|
| -- | **Ideate** | Idea submitted via MS Forms or GitHub; BU sponsor identified | Template 1 (Idea Intake Form) |
| **Ideate** | **Validate** | All 5 submission completeness checks confirmed; admin approval | Completed intake form |
| **Validate** | **Build** | Positive GO decision; prioritisation complete; resources allocated | Template 5 (Recommendation Memo), Scorecard, Templates 2-4 |
| **Build** | **Sell** | Product functional; quality approved; documentation ready | Template 6 (Documentation Pack), Template 7 (Roadmap), Intake Checklist complete |
| **Sell** | **Review** | Product actively sold; revenue generated; customers onboarded | Sales collateral, Marketplace listing, customer references |
| **Review** | **(Continuous)** | Ongoing performance monitoring and iteration | KPI dashboards, feedback reports, improvement roadmap |

---

## 10. Governance Notes

From the Validation Engine appendix:

1. **Scope change control** -- All scope changes must flow through the product governance cadence. No direct ad hoc engineering requests are permitted.

2. **Decision record requirements** -- Every gate decision must record:
   - Conditions to proceed (with owners and due dates)
   - Named owners (G42 PO, Affiliate PO, Eng Lead, CS Lead, Security Lead)
   - Capacity plan (resourcing and FTE allocation)
   - Explicit external dependencies (Microsoft/ISE and affiliates)

3. **Template workflow:**
   - Complete **Template 1** for every idea submitted.
   - For ideas advanced to Validate, complete **Templates 2-4** with supporting evidence.
   - Produce the final decision using **Template 5** and attach **Template 6** (documentation checklist).
   - For GO decisions, publish the roadmap using **Template 7**.

---

## 11. Label Reference

All labels used in the GitHub-based governance board:

### Stage Labels

| Label | Description |
|-------|-------------|
| `stage:ideate` | Idea is in Ideate phase |
| `stage:validate` | Idea is in Validate phase |
| `stage:build` | Idea is in Build phase |
| `stage:sell` | Idea is in Sell phase |
| `stage:review` | Idea is in Review phase |

### Decision Labels

| Label | Description |
|-------|-------------|
| `decision:go-fast-track` | Approved: Fast-track to Build |
| `decision:go-modernize` | Approved: Modernize-first |
| `decision:hold` | On hold pending resolution |
| `decision:kill` | Idea killed |

### Track Labels

| Label | Description |
|-------|-------------|
| `track:a-saas-ready` | Track A: SaaS-ready |
| `track:b-modernize-first` | Track B: Modernize-first |

### Status Labels

| Label | Description |
|-------|-------------|
| `status:needs-info` | Waiting for more information |
| `status:blocked` | Blocked by external dependency |
| `status:ready-for-review` | Ready for stage transition |
| `status:red-flag` | Red-flag override active -- auto HOLD |

### Idea Type Labels

| Label | Description |
|-------|-------------|
| `type:greenfield` | New idea |
| `type:brownfield` | SaaSify existing project |
| `type:whitelabel` | Partner white-labeling |

### Vertical Labels

| Label | Description |
|-------|-------------|
| `vertical:healthcare` | Healthcare vertical |
| `vertical:government` | Government vertical |
| `vertical:financial-services` | Financial Services vertical |
| `vertical:cybersecurity` | Cybersecurity vertical |
| `vertical:education` | Education vertical |
| `vertical:other` | Other vertical |

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

### Stakeholder Labels

| Label | Description |
|-------|-------------|
| `stakeholder:bu` | Business Unit is lead |
| `stakeholder:group` | Group is lead |
| `stakeholder:msft` | Microsoft is lead |

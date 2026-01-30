# Setup Guide: Microsoft Forms Integration

This guide explains how to set up Microsoft Forms to automatically create GitHub issues when ideas are submitted. The form fields align with **Template 1 — Idea Intake Form** from the SaaS Factory Validation Engine.

## Prerequisites

- Microsoft 365 account with access to Microsoft Forms and Power Automate
- GitHub Personal Access Token with `repo` scope
- Admin access to this GitHub repository

## Step 1: Create the Microsoft Form

### 1.1 Create a New Form

1. Go to [Microsoft Forms](https://forms.microsoft.com)
2. Click **+ New Form**
3. Name it: **G42 SaaS Idea Nomination**

### 1.2 Add Form Fields

Add the following questions in order:

| # | Question Type | Question | Options/Settings |
|---|---------------|----------|------------------|
| 1 | Text | Idea Name | Required, Short answer |
| 2 | Choice | Affiliate / Business Unit | Required, Dropdown: Presight, Analog, Core42, M42, Inception, Astratech, Khazna Data Centers, AIQ, CPX, Space42 |
| 3 | Choice | Vertical | Required, Dropdown: Healthcare, Government, Financial Services, Cybersecurity, Education, Other |
| 4 | Choice | Idea Type | Required: Greenfield (New idea), Brownfield (SaaSify existing), White-label (Partner) |
| 5 | Text | Problem Statement | Required, Long answer — "What problem are we solving? For whom? Why now?" |
| 6 | Text | Ideal Customer Profile (ICP) | Required, Long answer — "Sector, size, geography, regulatory profile, buyer personas" |
| 7 | Text | Value Hypothesis | Required, Long answer — "Quantified outcome: cost reduction, compliance, time saved, revenue, risk reduction" |
| 8 | Text | Success Metrics (Initial) | Required, Long answer — "North-star metric + 3-5 leading indicators" |
| 9 | Text | Proposed Solution | Required, Short answer — "1-2 sentences" |
| 10 | Text | Differentiation | Required, Long answer — "Why G42? Why Azure? Competitive advantage" |
| 11 | Choice | Expected Business Value | Required: High (>$10M), Medium ($1M-$10M), Low (<$1M) |
| 12 | Choice | SaaS Readiness (Initial) | Required: Track A - SaaS-ready, Track B - Modernize-first, Unknown |
| 13 | Text | Target Market / Customers | Required, Long answer |
| 14 | Text | Key Constraints | Optional, Long answer — "Data residency, regulated requirements, integrations, latency, sovereignty" |
| 15 | Choice | Customer Evidence Available | Required: Existing pipeline, Existing customers, None |
| 16 | Choice | Requested Support - Microsoft | Optional, Multi-select: Field validation, Marketplace guidance, Co-sell, ACR mapping |
| 17 | Choice | Requested Support - Microsoft ISE | Optional, Multi-select: Feasibility, Accelerators, Engineering capacity, Other |
| 18 | Text | Requested Support - G42 SaaS Factory | Optional, Long answer — "Identity/tenant mgmt, metering, observability, CI/CD templates, etc." |
| 19 | Text | Proposed Timeline | Optional, Short answer — "Target MVP date / Target GA date" |
| 20 | Text | Named Owners | Required, Long answer — "G42 Product Owner, Affiliate Product Owner, Engineering Lead" |
| 21 | Text | Your Name | Required, Short answer |
| 22 | Text | Your Email | Required, Short answer |

### 1.3 Form Settings

1. Click the **...** menu > **Settings**
2. Enable **Record name** (optional, for tracking)
3. Set **Who can fill out this form** based on your organization's needs

---

## Step 2: Create GitHub Personal Access Token

1. Go to [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)
2. Click **Generate new token (classic)**
3. Name: `G42-SaaS-Forms-Integration`
4. Expiration: Set based on your security policy
5. Scopes: Select `repo` (full control of private repositories)
6. Click **Generate token**
7. **Copy and save the token** - you won't be able to see it again!

---

## Step 3: Create Power Automate Flow

### 3.1 Create New Flow

1. Go to [Power Automate](https://make.powerautomate.com)
2. Click **+ Create** > **Automated cloud flow**
3. Name: `G42 SaaS Idea to GitHub`
4. Trigger: Search for **Microsoft Forms** > **When a new response is submitted**

### 3.2 Configure the Trigger

1. Select your form: **G42 SaaS Idea Nomination**

### 3.3 Add "Get response details" Action

1. Click **+ New step**
2. Search for **Microsoft Forms** > **Get response details**
3. Form Id: Select your form
4. Response Id: Select **Response Id** from dynamic content

### 3.4 Add "HTTP" Action (Create GitHub Issue)

1. Click **+ New step**
2. Search for **HTTP**
3. Configure as follows:

**Method:** `POST`

**URI:**
```
https://api.github.com/repos/akaddour/G42_SaaS_Factory_Board/issues
```

**Headers:**
```
Accept: application/vnd.github+json
Authorization: Bearer YOUR_GITHUB_TOKEN
X-GitHub-Api-Version: 2022-11-28
Content-Type: application/json
```

**Body:**
```json
{
  "title": "[IDEA] @{outputs('Get_response_details')?['body/rIdeaName']}",
  "body": "## SaaS Product Idea Nomination\n\n### Affiliate / Business Unit\n@{outputs('Get_response_details')?['body/rBusinessUnit']}\n\n### Vertical\n@{outputs('Get_response_details')?['body/rVertical']}\n\n### Idea Type\n@{outputs('Get_response_details')?['body/rIdeaType']}\n\n### Problem Statement\n@{outputs('Get_response_details')?['body/rProblemStatement']}\n\n### Ideal Customer Profile (ICP)\n@{outputs('Get_response_details')?['body/rICP']}\n\n### Value Hypothesis\n@{outputs('Get_response_details')?['body/rValueHypothesis']}\n\n### Success Metrics (Initial)\n@{outputs('Get_response_details')?['body/rSuccessMetrics']}\n\n### Proposed Solution\n@{outputs('Get_response_details')?['body/rProposedSolution']}\n\n### Differentiation\n@{outputs('Get_response_details')?['body/rDifferentiation']}\n\n### Expected Business Value\n@{outputs('Get_response_details')?['body/rBusinessValue']}\n\n### SaaS Readiness (Initial)\n@{outputs('Get_response_details')?['body/rSaaSReadiness']}\n\n### Target Market / Customers\n@{outputs('Get_response_details')?['body/rTargetMarket']}\n\n### Key Constraints\n@{outputs('Get_response_details')?['body/rKeyConstraints']}\n\n### Customer Evidence Available\n@{outputs('Get_response_details')?['body/rCustomerEvidence']}\n\n### Requested Support - Microsoft\n@{outputs('Get_response_details')?['body/rSupportMicrosoft']}\n\n### Requested Support - Microsoft ISE\n@{outputs('Get_response_details')?['body/rSupportISE']}\n\n### Requested Support - G42 SaaS Factory\n@{outputs('Get_response_details')?['body/rSupportG42Factory']}\n\n### Initial Resource Estimate\n@{outputs('Get_response_details')?['body/rResourceEstimate']}\n\n### Proposed Timeline\n@{outputs('Get_response_details')?['body/rTimeline']}\n\n### Named Owners\n@{outputs('Get_response_details')?['body/rNamedOwners']}\n\n---\n\n**Submitted by:** @{outputs('Get_response_details')?['body/rSubmitterName']} (@{outputs('Get_response_details')?['body/rSubmitterEmail']})\n\n---\n\n## Ideate Stage - Submission Completeness Check\n\n- [ ] Problem statement is clear\n- [ ] ICP defined\n- [ ] Success metrics proposed\n- [ ] Constraints captured\n- [ ] Named owners assigned",
  "labels": ["stage:ideate"]
}
```

> **Note:** The `rIdeaName`, `rBusinessUnit`, etc. references are placeholder names. In Power Automate, use **Dynamic content** to select the actual form responses for each field. The dynamic content IDs will match the question IDs from your form.

### 3.5 Save and Test

1. Click **Save**
2. Submit a test response to your form
3. Check if the issue appears in GitHub

---

## Step 4: Verify Integration

1. Submit a test idea through the Microsoft Form
2. Check GitHub Issues - a new issue should appear within 1-2 minutes
3. Verify the GitHub Actions workflows run:
   - `auto-label.yml` applies BU, type, vertical, and track labels
   - `add-to-project.yml` adds the issue to the project board with "Backlog" stage
4. Verify the Ideate checklist appears in the issue body

---

## Troubleshooting

### Issue not created
- Check Power Automate flow run history for errors
- Verify GitHub token has correct permissions
- Ensure token hasn't expired

### Labels not applied
- Check GitHub Actions workflow runs
- Verify the workflow file syntax is correct
- Check repository permissions for Actions

### Form responses not captured
- Ensure "Get response details" action is configured
- Map the correct dynamic content fields

### Missing fields in issue body
- Verify all dynamic content references match your form question IDs
- Check for special characters in form responses that may break JSON

---

## Security Notes

- Store the GitHub token securely in Power Automate
- Rotate the token periodically
- Use a service account for the token if available
- Consider using Azure Key Vault for token storage in production

# Setup Guide: Microsoft Forms Integration

This guide explains how to set up Microsoft Forms to automatically create GitHub issues when ideas are submitted.

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
| 2 | Choice | Business Unit | Required, Dropdown: Presight, Analog, Core42, M42, Inception, Astratech, Khazna Data Centers, AIQ, CPX, Space42 |
| 3 | Choice | Idea Type | Required: Greenfield (New idea), Brownfield (SaaSify existing), White-label (Partner) |
| 4 | Text | Problem Statement | Required, Long answer |
| 5 | Text | Proposed Solution | Required, Long answer |
| 6 | Choice | Expected Business Value | Required: High (>$10M), Medium ($1M-$10M), Low (<$1M) |
| 7 | Text | Target Market / Customers | Required, Long answer |
| 8 | Text | Initial Resource Estimate | Optional, Long answer |
| 9 | Text | Your Name | Required, Short answer |
| 10 | Text | Your Email | Required, Short answer |

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
  "title": "[IDEA] @{outputs('Get_response_details')?['body/r1234567890']}",
  "body": "## SaaS Product Idea Nomination\n\n### Business Unit\n@{outputs('Get_response_details')?['body/r2345678901']}\n\n### Idea Type\n@{outputs('Get_response_details')?['body/r3456789012']}\n\n### Problem Statement\n@{outputs('Get_response_details')?['body/r4567890123']}\n\n### Proposed Solution\n@{outputs('Get_response_details')?['body/r5678901234']}\n\n### Expected Business Value\n@{outputs('Get_response_details')?['body/r6789012345']}\n\n### Target Market / Customers\n@{outputs('Get_response_details')?['body/r7890123456']}\n\n### Initial Resource Estimate\n@{outputs('Get_response_details')?['body/r8901234567']}\n\n---\n\n**Submitted by:** @{outputs('Get_response_details')?['body/r9012345678']} (@{outputs('Get_response_details')?['body/r0123456789']})\n\n---\n\n## Ideate Stage Checklist\n\n- [ ] Clear problem statement defined\n- [ ] Business value articulated\n- [ ] Initial market sizing done\n- [ ] BU sponsor identified\n- [ ] Group template filled",
  "labels": ["stage:ideate"]
}
```

> **Note:** The `r1234567890` references are placeholders. In Power Automate, use **Dynamic content** to select the actual form responses for each field.

### 3.5 Save and Test

1. Click **Save**
2. Submit a test response to your form
3. Check if the issue appears in GitHub

---

## Step 4: Verify Integration

1. Submit a test idea through the Microsoft Form
2. Check GitHub Issues - a new issue should appear within 1-2 minutes
3. Verify the GitHub Actions workflow runs and applies labels automatically

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

---

## Security Notes

- Store the GitHub token securely in Power Automate
- Rotate the token periodically
- Use a service account for the token if available
- Consider using Azure Key Vault for token storage in production

# Email Notification Setup Guide

This guide explains how to configure email notifications for the G42 SaaS Factory Board. Notifications are sent via a Power Automate flow that receives webhook calls from GitHub Actions.

## Architecture

```
GitHub Issue Event → GitHub Actions → HTTP POST → Power Automate → Outlook Email
```

## Prerequisites

- Microsoft 365 account with access to Power Automate
- Admin access to the GitHub repository (to add secrets)

---

## Step 1: Create the Power Automate Flow

### 1.1 Create a New Flow

1. Go to [Power Automate](https://make.powerautomate.com)
2. Click **+ Create** > **Automated cloud flow**
3. Name: `G42 SaaS Factory - Email Notifications`
4. Trigger: Search for **When an HTTP request is received**

### 1.2 Configure the HTTP Trigger

1. Click on the trigger step
2. In **Request Body JSON Schema**, paste:

```json
{
  "type": "object",
  "properties": {
    "to": {
      "type": "array",
      "items": { "type": "string" }
    },
    "cc": {
      "type": "array",
      "items": { "type": "string" }
    },
    "subject": { "type": "string" },
    "body": { "type": "string" },
    "event_type": { "type": "string" },
    "issue_number": { "type": "integer" },
    "issue_url": { "type": "string" }
  },
  "required": ["to", "subject", "body"]
}
```

### 1.3 Add "Send an email (V2)" Action

1. Click **+ New step**
2. Search for **Office 365 Outlook** > **Send an email (V2)**
3. Configure:
   - **To**: Use an expression to join the `to` array:
     ```
     join(triggerBody()?['to'], ';')
     ```
   - **Subject**: Select `subject` from Dynamic content
   - **Body**: Select `body` from Dynamic content (set to **HTML** mode using the `</>` toggle)
   - **CC** (optional): Use expression:
     ```
     join(triggerBody()?['cc'], ';')
     ```

### 1.4 Configure Sender (Optional)

To send from a shared mailbox (e.g., `saas-factory@g42.ai`):
1. In the **Send an email (V2)** action, click **Show advanced options**
2. Set **From (Send as)** to the shared mailbox address
3. Ensure the flow's connection account has **Send As** permissions on that mailbox

### 1.5 Save and Copy the URL

1. Click **Save**
2. Go back to the **When an HTTP request is received** trigger
3. Copy the **HTTP POST URL** — you'll need this for the next step

---

## Step 2: Add GitHub Repository Secrets

1. Go to your repository on GitHub
2. Navigate to **Settings** > **Secrets and variables** > **Actions**
3. Add the following secrets:

| Secret Name | Value |
|-------------|-------|
| `POWER_AUTOMATE_WEBHOOK_URL` | The HTTP POST URL copied from Power Automate |
| `ADMIN_NOTIFICATION_EMAILS` | Comma-separated admin emails (e.g., `admin1@g42.ai,admin2@g42.ai`) |

---

## Step 3: Verify

1. **Create a test issue** using the Idea Nomination template
2. Fill in the Submitter Email field with your email
3. After the issue is created, check your inbox for the "New Idea Submitted" email
4. Check the GitHub Actions run logs for the `Auto Label Issues` workflow to confirm the notification step ran

---

## Email Templates

Email templates are stored as JSON files in `templates/emails/`. Each file contains:

| Field | Description |
|-------|-------------|
| `description` | Human-readable description of when this email is sent |
| `subject` | Email subject line with `{{variable}}` placeholders |
| `body` | HTML email body with `{{variable}}` placeholders |

### Template Files

| File | Trigger |
|------|---------|
| `idea-submitted.json` | New idea created |
| `stage-transition-success.json` | Idea moves to next stage |
| `stage-transition-blocked.json` | Stage transition blocked by gate |
| `decision-made.json` | Decision label applied (GO/HOLD/KILL) |
| `red-flag-raised.json` | Red flag override activated |
| `checklist-complete.json` | All checklist items completed |

### Available Variables

| Variable | Description |
|----------|-------------|
| `{{idea_name}}` | Issue title (without `[IDEA]` prefix) |
| `{{issue_url}}` | GitHub issue URL |
| `{{issue_number}}` | Issue number |
| `{{business_unit}}` | Submitting BU |
| `{{vertical}}` | Target vertical |
| `{{submitter_name}}` | Submitter's name |
| `{{submitter_email}}` | Submitter's email |
| `{{current_stage}}` | Current stage name |
| `{{previous_stage}}` | Previous stage name (transitions) |
| `{{decision}}` | Decision type (decisions) |
| `{{blocked_reason}}` | Why transition was blocked |
| `{{named_owners}}` | Named owners text |

### Editing Templates

To change email content, edit the JSON files directly in `templates/emails/`. Changes take effect on the next workflow run — no other configuration needed.

---

## Troubleshooting

### Emails not being sent
- Check GitHub Actions logs for the notification step
- Verify `POWER_AUTOMATE_WEBHOOK_URL` secret is set correctly
- Check Power Automate flow run history for errors

### Emails arriving to wrong recipients
- Verify the "Submitter Email" and "Named Owners" fields in the issue contain valid email addresses
- Check `ADMIN_NOTIFICATION_EMAILS` secret formatting (comma-separated, no spaces)

### Template variables showing as `{{variable}}`
- Ensure the variable name in the template matches the available variables listed above
- Check the issue body contains the expected sections (e.g., "### Submitter Email")

### Power Automate flow failing
- Check the flow run history for error details
- Verify the JSON schema matches the payload format
- Ensure the Outlook connection is authorized and the sender mailbox has correct permissions

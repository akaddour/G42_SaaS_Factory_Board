# Post-Migration Checklist

Manual steps to complete after running `scripts/migrate.sh`.

## 1. Configure Repository Secrets

If you skipped setting secrets during migration, add them now:

```bash
gh secret set COMPASS_API_KEY --repo <org>/<repo>
gh secret set POWER_AUTOMATE_WEBHOOK_URL --repo <org>/<repo>
gh secret set ADMIN_NOTIFICATION_EMAILS --repo <org>/<repo>
gh secret set PROJECT_TOKEN --repo <org>/<repo>
```

- **PROJECT_TOKEN** must be a PAT (classic) with `project`, `repo`, and `admin:org` (if org-owned) scopes.

## 2. Power Automate Webhook

1. Create a new Power Automate flow (or duplicate the existing one)
2. Set trigger to "When an HTTP request is received"
3. Copy the webhook URL into the `POWER_AUTOMATE_WEBHOOK_URL` secret

## 3. End-to-End Verification

- [ ] Create a test issue using the **SaaS Product Idea Nomination** template
- [ ] Verify the **AI Ideation Expert** workflow triggers and posts a comment
- [ ] Verify the **auto-label** workflow applies labels correctly
- [ ] Verify the issue appears on the project board in the **Backlog** column
- [ ] Test a stage transition (add `stage:ideate` label) and verify the gate check runs
- [ ] Verify email notifications arrive via Power Automate
- [ ] Wait for the **project-board-sync** scheduled run (every 5 min) or trigger manually

## 4. Clean Up

- [ ] Close/delete the test issue after verification
- [ ] Update any external documentation pointing to the old repository

#!/bin/bash
set -euo pipefail

# ============================================================
# G42 SaaS Factory — Repository Migration Script
# Migrates all files, labels, and project board to a new repo.
# Usage: ./scripts/migrate.sh <target-org> <target-repo> [github-host]
# Example: ./scripts/migrate.sh G42SaaSFactory Triage github.core42.ai
# ============================================================

TARGET_ORG="${1:?Usage: ./scripts/migrate.sh <target-org> <target-repo> [github-host]}"
TARGET_REPO="${2:?Usage: ./scripts/migrate.sh <target-org> <target-repo> [github-host]}"
GH_HOST="${3:-github.core42.ai}"
SOURCE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NEW_ORG_REPO="${TARGET_ORG}/${TARGET_REPO}"
TEMP_DIR=""

# Export GH_HOST so all gh CLI commands target the enterprise instance
export GH_HOST

# Old hard-coded IDs (will be replaced with new ones)
OLD_PROJECT_ID="PVT_kwHOALNmH84BNitD"
OLD_STAGE_FIELD_ID="PVTSSF_lAHOALNmH84BNitDzg8gaUE"
OLD_BACKLOG_ID="c14ac672"
OLD_IDEATE_ID="a2cbc606"
OLD_VALIDATE_ID="191386a7"
OLD_BUILD_ID="a6a853b2"
OLD_SELL_ID="4eddb5b2"
OLD_REVIEW_ID="c420d033"
OLD_COMPLETED_ID="fde6108e"
OLD_REJECTED_ID="f8d2a5e0"

# Portable sed -i
sed_inplace() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "$@"
  else
    sed -i "$@"
  fi
}

cleanup() {
  if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
    echo "Cleaning up temp directory..."
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

# ─── Step 1: Validate prerequisites ─────────────────────────

echo "=== Step 1: Validating prerequisites ==="
echo "  GitHub host: ${GH_HOST}"

for cmd in gh jq git rsync; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: '$cmd' is required but not installed."
    exit 1
  fi
done

if ! gh auth status --hostname "${GH_HOST}" &>/dev/null; then
  echo "Error: gh CLI is not authenticated to ${GH_HOST}."
  echo "Run: gh auth login --hostname ${GH_HOST}"
  exit 1
fi

if ! gh api "users/${TARGET_ORG}" --hostname "${GH_HOST}" &>/dev/null; then
  # Try as org endpoint (GHE may not have /users for orgs)
  if ! gh api "orgs/${TARGET_ORG}" --hostname "${GH_HOST}" &>/dev/null; then
    echo "Error: GitHub user/org '${TARGET_ORG}' not found on ${GH_HOST}."
    exit 1
  fi
fi

# Detect owner type (user vs org)
OWNER_TYPE=$(gh api "users/${TARGET_ORG}" --hostname "${GH_HOST}" --jq '.type' 2>/dev/null || echo "Organization")
if [ "$OWNER_TYPE" = "Organization" ]; then
  URL_PREFIX="orgs"
else
  URL_PREFIX="users"
fi

echo "  Target: ${NEW_ORG_REPO} (${OWNER_TYPE})"

REPO_EXISTS=false
if gh repo view "${NEW_ORG_REPO}" --hostname "${GH_HOST}" &>/dev/null 2>&1; then
  REPO_EXISTS=true
  echo "  Repository '${NEW_ORG_REPO}' already exists — will push to it."
fi

echo "  All prerequisites OK."

# ─── Step 2: Create new repository (skip if exists) ──────────

echo ""
if [ "$REPO_EXISTS" = true ]; then
  echo "=== Step 2: Skipping repo creation (already exists) ==="
else
  echo "=== Step 2: Creating repository ${NEW_ORG_REPO} on ${GH_HOST} ==="
  read -p "Create private repository '${NEW_ORG_REPO}'? [y/N] " -r
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
  fi
  gh repo create "${NEW_ORG_REPO}" --private --description "G42 SaaS Factory — AI Ideation Expert"
  echo "  Repository created."
fi

# ─── Step 3: Clone and copy files ────────────────────────────

echo ""
echo "=== Step 3: Copying files to new repository ==="

TEMP_DIR=$(mktemp -d)
echo "  Temp directory: ${TEMP_DIR}"

git clone "https://${GH_HOST}/${NEW_ORG_REPO}.git" "${TEMP_DIR}/repo"
REPO_DIR="${TEMP_DIR}/repo"

# Copy all files except .git and .claude session data
rsync -a \
  --exclude='.git' \
  --exclude='.claude' \
  --exclude='.DS_Store' \
  "${SOURCE_DIR}/" "${REPO_DIR}/"

# Copy .claude/settings.local.json if it exists
if [ -f "${SOURCE_DIR}/.claude/settings.local.json" ]; then
  mkdir -p "${REPO_DIR}/.claude"
  cp "${SOURCE_DIR}/.claude/settings.local.json" "${REPO_DIR}/.claude/"
fi

echo "  Files copied."

# ─── Step 4: Update hard-coded references ────────────────────

echo ""
echo "=== Step 4: Updating hard-coded references ==="

# Update repo name in settings.local.json (if it exists)
if [ -f "${REPO_DIR}/.claude/settings.local.json" ]; then
  sed_inplace "s|akaddour/G42_SaaS_Factory_Board|${NEW_ORG_REPO}|g" \
    "${REPO_DIR}/.claude/settings.local.json"
fi

# Update github.com references to enterprise host across workflow files
sed_inplace "s|https://github.com/users/akaddour/projects/7|https://${GH_HOST}/${URL_PREFIX}/${TARGET_ORG}/projects/PLACEHOLDER|g" \
  "${REPO_DIR}/.github/workflows/add-to-project.yml"

echo "  Updated repo references."
echo "  (Project board IDs will be updated after board creation.)"

# ─── Step 5: Create labels ───────────────────────────────────

echo ""
echo "=== Step 5: Creating GitHub labels ==="

bash "${REPO_DIR}/scripts/setup-labels.sh" "${NEW_ORG_REPO}"

echo "  Labels created."

# ─── Step 6: Create project board ────────────────────────────

echo ""
echo "=== Step 6: Creating project board ==="

# Create project — capture URL from text output (more reliable on GHE)
PROJECT_OUTPUT=$(gh project create --owner "${TARGET_ORG}" --title "SaaS Factory Board" 2>&1)
echo "$PROJECT_OUTPUT"

# Try --format json first for project details, fall back to gh project list
PROJECT_JSON=$(gh project list --owner "${TARGET_ORG}" --format json --jq '.projects[] | select(.title == "SaaS Factory Board")' 2>/dev/null || true)

if [ -n "$PROJECT_JSON" ]; then
  NEW_PROJECT_ID=$(echo "$PROJECT_JSON" | jq -r '.id')
  PROJECT_NUMBER=$(echo "$PROJECT_JSON" | jq -r '.number')
else
  # Fall back to GraphQL query to find the project
  echo "  Querying project via GraphQL..."
  PROJECT_QUERY='query($owner: String!) {
    organization(login: $owner) {
      projectsV2(first: 10, orderBy: {field: CREATED_AT, direction: DESC}) {
        nodes { id number title }
      }
    }
  }'
  PROJECT_DATA=$(gh api graphql -f query="$PROJECT_QUERY" -f owner="${TARGET_ORG}" --jq '.data.organization.projectsV2.nodes[] | select(.title == "SaaS Factory Board")' 2>/dev/null || true)

  if [ -z "$PROJECT_DATA" ]; then
    # Try as user instead of org
    PROJECT_QUERY='query($owner: String!) {
      user(login: $owner) {
        projectsV2(first: 10, orderBy: {field: CREATED_AT, direction: DESC}) {
          nodes { id number title }
        }
      }
    }'
    PROJECT_DATA=$(gh api graphql -f query="$PROJECT_QUERY" -f owner="${TARGET_ORG}" --jq '.data.user.projectsV2.nodes[] | select(.title == "SaaS Factory Board")')
  fi

  NEW_PROJECT_ID=$(echo "$PROJECT_DATA" | jq -r '.id')
  PROJECT_NUMBER=$(echo "$PROJECT_DATA" | jq -r '.number')
fi

PROJECT_URL="https://${GH_HOST}/${URL_PREFIX}/${TARGET_ORG}/projects/${PROJECT_NUMBER}"

echo "  Project created: ${PROJECT_URL}"
echo "  Project ID: ${NEW_PROJECT_ID}"
echo "  Project Number: ${PROJECT_NUMBER}"

if [ -z "$NEW_PROJECT_ID" ] || [ "$NEW_PROJECT_ID" = "null" ]; then
  echo "Error: Could not determine project ID. Create the project board manually."
  echo "  Then update workflow files with the project IDs."
  exit 1
fi

# Add Stage single-select field
echo "  Adding Stage field..."
gh project field-create "$PROJECT_NUMBER" --owner "${TARGET_ORG}" \
  --name "Stage" --data-type SINGLE_SELECT \
  --single-select-options "Backlog,Ideate,Validate,Build,Sell,Review,Completed,Rejected"

# Query field and option IDs via GraphQL
echo "  Querying field and option IDs..."
FIELD_QUERY='query($projectId: ID!) {
  node(id: $projectId) {
    ... on ProjectV2 {
      field(name: "Stage") {
        ... on ProjectV2SingleSelectField {
          id
          options {
            id
            name
          }
        }
      }
    }
  }
}'

FIELD_DATA=$(gh api graphql -f query="$FIELD_QUERY" -f projectId="$NEW_PROJECT_ID" --jq '.data.node.field')
NEW_STAGE_FIELD_ID=$(echo "$FIELD_DATA" | jq -r '.id')
NEW_BACKLOG_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Backlog") | .id')
NEW_IDEATE_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Ideate") | .id')
NEW_VALIDATE_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Validate") | .id')
NEW_BUILD_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Build") | .id')
NEW_SELL_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Sell") | .id')
NEW_REVIEW_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Review") | .id')
NEW_COMPLETED_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Completed") | .id')
NEW_REJECTED_ID=$(echo "$FIELD_DATA" | jq -r '.options[] | select(.name == "Rejected") | .id')

echo "  Stage field ID: ${NEW_STAGE_FIELD_ID}"
echo "  Option IDs captured for all 8 stages."

# Update workflow files with new project/field/option IDs
echo "  Updating workflow files with new project IDs..."

WORKFLOW_FILES=(
  "${REPO_DIR}/.github/workflows/add-to-project.yml"
  "${REPO_DIR}/.github/workflows/project-board-sync.yml"
  "${REPO_DIR}/.github/workflows/stage-gate-transition.yml"
)

for f in "${WORKFLOW_FILES[@]}"; do
  sed_inplace "s|${OLD_PROJECT_ID}|${NEW_PROJECT_ID}|g" "$f"
  sed_inplace "s|${OLD_STAGE_FIELD_ID}|${NEW_STAGE_FIELD_ID}|g" "$f"
  sed_inplace "s|${OLD_BACKLOG_ID}|${NEW_BACKLOG_ID}|g" "$f"
  sed_inplace "s|${OLD_IDEATE_ID}|${NEW_IDEATE_ID}|g" "$f"
  sed_inplace "s|${OLD_VALIDATE_ID}|${NEW_VALIDATE_ID}|g" "$f"
  sed_inplace "s|${OLD_BUILD_ID}|${NEW_BUILD_ID}|g" "$f"
  sed_inplace "s|${OLD_SELL_ID}|${NEW_SELL_ID}|g" "$f"
  sed_inplace "s|${OLD_REVIEW_ID}|${NEW_REVIEW_ID}|g" "$f"
  sed_inplace "s|${OLD_COMPLETED_ID}|${NEW_COMPLETED_ID}|g" "$f"
  sed_inplace "s|${OLD_REJECTED_ID}|${NEW_REJECTED_ID}|g" "$f"
done

# Update the project URL placeholder in add-to-project.yml with the real project number
sed_inplace "s|projects/PLACEHOLDER|projects/${PROJECT_NUMBER}|g" \
  "${REPO_DIR}/.github/workflows/add-to-project.yml"

echo "  Workflow files updated."

# ─── Step 7: Commit and push ─────────────────────────────────

echo ""
echo "=== Step 7: Committing and pushing ==="

cd "${REPO_DIR}"
git checkout -b main 2>/dev/null || true
git add -A
git commit -m "Initial migration from G42 SaaS Factory Board

Migrated all workflows, templates, docs, and configuration.
Project board IDs updated to new project on ${GH_HOST}."
git push -u origin main

echo "  Pushed to ${NEW_ORG_REPO}."

# ─── Step 8: Secrets checklist ───────────────────────────────

echo ""
echo "=== Step 8: Repository Secrets ==="
echo ""
echo "The following secrets must be configured for the workflows to function:"
echo ""
echo "  1. COMPASS_API_KEY             — Core42 Compass API key (AI Ideation Expert)"
echo "  2. POWER_AUTOMATE_WEBHOOK_URL — Power Automate webhook for email notifications"
echo "  3. ADMIN_NOTIFICATION_EMAILS  — Comma-separated admin email addresses"
echo "  4. PROJECT_TOKEN              — GitHub PAT with 'project' scope (on ${GH_HOST})"
echo ""
read -p "Would you like to set secrets now? [y/N] " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for secret in COMPASS_API_KEY POWER_AUTOMATE_WEBHOOK_URL ADMIN_NOTIFICATION_EMAILS PROJECT_TOKEN; do
    read -sp "Enter value for ${secret} (or press Enter to skip): " value
    echo ""
    if [ -n "$value" ]; then
      echo "$value" | gh secret set "$secret" --repo "${NEW_ORG_REPO}"
      echo "  Set ${secret}."
    else
      echo "  Skipped ${secret}."
    fi
  done
fi

# ─── Step 9: Verify setup ───────────────────────────────────

echo ""
echo "=== Step 9: Verifying setup ==="

LABEL_COUNT=$(gh label list --repo "${NEW_ORG_REPO}" --json name --jq 'length')
echo "  Labels: ${LABEL_COUNT} created"

echo "  Project board: ${PROJECT_URL}"

WORKFLOW_COUNT=$(find "${REPO_DIR}/.github/workflows" -name "*.yml" | wc -l | tr -d ' ')
echo "  Workflows: ${WORKFLOW_COUNT} files"

echo ""
echo "============================================"
echo "  Migration complete!"
echo "============================================"
echo ""
echo "  Repository: https://${GH_HOST}/${NEW_ORG_REPO}"
echo "  Project:    ${PROJECT_URL}"
echo ""
echo "  Next steps:"
echo "  1. Log in to GitHub Enterprise: gh auth login --hostname ${GH_HOST}"
echo "  2. See docs/migration-checklist.md for remaining manual steps"
echo ""

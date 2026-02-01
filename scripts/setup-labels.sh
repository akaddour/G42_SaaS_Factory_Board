#!/bin/bash
# Setup GitHub Labels for G42 SaaS Factory Board
# Run this script once after creating the repository

REPO="akaddour/G42_SaaS_Factory_Board"

echo "Setting up labels for $REPO..."

# Delete default labels (optional - uncomment if desired)
# gh label delete "bug" --repo $REPO --yes 2>/dev/null
# gh label delete "documentation" --repo $REPO --yes 2>/dev/null
# gh label delete "duplicate" --repo $REPO --yes 2>/dev/null
# gh label delete "enhancement" --repo $REPO --yes 2>/dev/null
# gh label delete "good first issue" --repo $REPO --yes 2>/dev/null
# gh label delete "help wanted" --repo $REPO --yes 2>/dev/null
# gh label delete "invalid" --repo $REPO --yes 2>/dev/null
# gh label delete "question" --repo $REPO --yes 2>/dev/null
# gh label delete "wontfix" --repo $REPO --yes 2>/dev/null

# Stage Labels
gh label create "stage:ideate" --description "Idea is in Ideate phase" --color "0E8A16" --repo $REPO 2>/dev/null || gh label edit "stage:ideate" --description "Idea is in Ideate phase" --color "0E8A16" --repo $REPO
gh label create "stage:validate" --description "Idea is in Validate phase" --color "1D76DB" --repo $REPO 2>/dev/null || gh label edit "stage:validate" --description "Idea is in Validate phase" --color "1D76DB" --repo $REPO
gh label create "stage:build" --description "Idea is in Build phase" --color "5319E7" --repo $REPO 2>/dev/null || gh label edit "stage:build" --description "Idea is in Build phase" --color "5319E7" --repo $REPO
gh label create "stage:sell" --description "Idea is in Sell phase" --color "D93F0B" --repo $REPO 2>/dev/null || gh label edit "stage:sell" --description "Idea is in Sell phase" --color "D93F0B" --repo $REPO
gh label create "stage:review" --description "Idea is in Review phase" --color "FBCA04" --repo $REPO 2>/dev/null || gh label edit "stage:review" --description "Idea is in Review phase" --color "FBCA04" --repo $REPO

# Decision Labels
gh label create "decision:go-fast-track" --description "Approved: Fast-track to Build" --color "0E8A16" --repo $REPO 2>/dev/null || gh label edit "decision:go-fast-track" --description "Approved: Fast-track to Build" --color "0E8A16" --repo $REPO
gh label create "decision:go-modernize" --description "Approved: Modernize-first" --color "1D76DB" --repo $REPO 2>/dev/null || gh label edit "decision:go-modernize" --description "Approved: Modernize-first" --color "1D76DB" --repo $REPO
gh label create "decision:hold" --description "On hold pending resolution" --color "FBCA04" --repo $REPO 2>/dev/null || gh label edit "decision:hold" --description "On hold pending resolution" --color "FBCA04" --repo $REPO
gh label create "decision:kill" --description "Idea killed" --color "D93F0B" --repo $REPO 2>/dev/null || gh label edit "decision:kill" --description "Idea killed" --color "D93F0B" --repo $REPO

# Track Labels
gh label create "track:a-saas-ready" --description "Track A: SaaS-ready" --color "84B6EB" --repo $REPO 2>/dev/null || gh label edit "track:a-saas-ready" --description "Track A: SaaS-ready" --color "84B6EB" --repo $REPO
gh label create "track:b-modernize-first" --description "Track B: Modernize-first" --color "BFD4F2" --repo $REPO 2>/dev/null || gh label edit "track:b-modernize-first" --description "Track B: Modernize-first" --color "BFD4F2" --repo $REPO

# Stakeholder Labels
gh label create "stakeholder:bu" --description "Business Unit is lead" --color "C2E0C6" --repo $REPO 2>/dev/null || gh label edit "stakeholder:bu" --description "Business Unit is lead" --color "C2E0C6" --repo $REPO
gh label create "stakeholder:group" --description "Group is lead" --color "BFD4F2" --repo $REPO 2>/dev/null || gh label edit "stakeholder:group" --description "Group is lead" --color "BFD4F2" --repo $REPO
gh label create "stakeholder:msft" --description "Microsoft is lead" --color "D4C5F9" --repo $REPO 2>/dev/null || gh label edit "stakeholder:msft" --description "Microsoft is lead" --color "D4C5F9" --repo $REPO

# Business Unit Labels
gh label create "bu:presight" --description "Presight" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:presight" --description "Presight" --color "006B75" --repo $REPO
gh label create "bu:analog" --description "Analog" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:analog" --description "Analog" --color "006B75" --repo $REPO
gh label create "bu:core42" --description "Core42" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:core42" --description "Core42" --color "006B75" --repo $REPO
gh label create "bu:m42" --description "M42" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:m42" --description "M42" --color "006B75" --repo $REPO
gh label create "bu:inception" --description "Inception" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:inception" --description "Inception" --color "006B75" --repo $REPO
gh label create "bu:astratech" --description "Astratech" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:astratech" --description "Astratech" --color "006B75" --repo $REPO
gh label create "bu:khazna" --description "Khazna Data Centers" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:khazna" --description "Khazna Data Centers" --color "006B75" --repo $REPO
gh label create "bu:aiq" --description "AIQ" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:aiq" --description "AIQ" --color "006B75" --repo $REPO
gh label create "bu:cpx" --description "CPX" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:cpx" --description "CPX" --color "006B75" --repo $REPO
gh label create "bu:space42" --description "Space42" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "bu:space42" --description "Space42" --color "006B75" --repo $REPO

# Engineering Labels
gh label create "engineering:ise" --description "ISE co-engineering" --color "D4C5F9" --repo $REPO 2>/dev/null || gh label edit "engineering:ise" --description "ISE co-engineering" --color "D4C5F9" --repo $REPO

# Status Labels
gh label create "status:needs-info" --description "Waiting for more information" --color "FEF2C0" --repo $REPO 2>/dev/null || gh label edit "status:needs-info" --description "Waiting for more information" --color "FEF2C0" --repo $REPO
gh label create "status:blocked" --description "Blocked by external dependency" --color "E99695" --repo $REPO 2>/dev/null || gh label edit "status:blocked" --description "Blocked by external dependency" --color "E99695" --repo $REPO
gh label create "status:ready-for-review" --description "Ready for stage transition" --color "0E8A16" --repo $REPO 2>/dev/null || gh label edit "status:ready-for-review" --description "Ready for stage transition" --color "0E8A16" --repo $REPO
gh label create "status:red-flag" --description "Red-flag override active - auto HOLD" --color "B60205" --repo $REPO 2>/dev/null || gh label edit "status:red-flag" --description "Red-flag override active - auto HOLD" --color "B60205" --repo $REPO

# Idea Type Labels
gh label create "type:greenfield" --description "New idea" --color "84B6EB" --repo $REPO 2>/dev/null || gh label edit "type:greenfield" --description "New idea" --color "84B6EB" --repo $REPO
gh label create "type:brownfield" --description "SaaSify existing project" --color "BFD4F2" --repo $REPO 2>/dev/null || gh label edit "type:brownfield" --description "SaaSify existing project" --color "BFD4F2" --repo $REPO
gh label create "type:whitelabel" --description "Partner white-labeling" --color "D4C5F9" --repo $REPO 2>/dev/null || gh label edit "type:whitelabel" --description "Partner white-labeling" --color "D4C5F9" --repo $REPO

# Vertical Labels
gh label create "vertical:healthcare" --description "Healthcare vertical" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "vertical:healthcare" --description "Healthcare vertical" --color "006B75" --repo $REPO
gh label create "vertical:government" --description "Government vertical" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "vertical:government" --description "Government vertical" --color "006B75" --repo $REPO
gh label create "vertical:financial-services" --description "Financial Services vertical" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "vertical:financial-services" --description "Financial Services vertical" --color "006B75" --repo $REPO
gh label create "vertical:cybersecurity" --description "Cybersecurity vertical" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "vertical:cybersecurity" --description "Cybersecurity vertical" --color "006B75" --repo $REPO
gh label create "vertical:education" --description "Education vertical" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "vertical:education" --description "Education vertical" --color "006B75" --repo $REPO
gh label create "vertical:other" --description "Other vertical" --color "006B75" --repo $REPO 2>/dev/null || gh label edit "vertical:other" --description "Other vertical" --color "006B75" --repo $REPO

echo "Labels setup complete!"

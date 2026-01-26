# G42 SaaS Factory Board

A GitHub-native workflow management system for the G42 SaaS Framework governance process.

## Overview

This repository manages the end-to-end lifecycle of SaaS product ideas across G42 Business Units, from initial ideation through validation, build, sales, and review phases.

## SaaS Framework Stages

| Stage | Outcome |
|-------|---------|
| **Ideate** | Long list of ideas with clear outline of expected business value |
| **Validate** | Prioritized ideas based on G42 market potential and effort assessments |
| **Build** | Developed functional SaaS products ready to market |
| **Sell** | Packaged product offering with services & add-ons |
| **Review** | Assess product performance and iterate to improve |

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

1. **Via Microsoft Forms** (Recommended): Submit through the [Idea Nomination Form](#) - automatically creates a GitHub issue
2. **Via GitHub**: Create a new issue using the "Idea Nomination" template

### Tracking Ideas

- View the [Project Board](../../projects) to see all ideas and their current stage
- Each idea is tracked as a GitHub Issue with stage-specific checklists

### Stage Transitions

1. Complete all checklist items for the current stage
2. Add the `status:ready-for-review` label
3. An admin will review and move the idea to the next stage

## Documentation

- [Setup Guide](docs/setup-guide.md) - How to set up MS Forms integration
- [Workflow Guide](docs/workflow-guide.md) - Detailed process documentation
- [Stage Criteria](docs/stage-criteria.md) - Criteria for each stage

## Labels

| Label | Purpose |
|-------|---------|
| `stage:ideate` | Idea is in Ideate phase |
| `stage:validate` | Idea is in Validate phase |
| `stage:build` | Idea is in Build phase |
| `stage:sell` | Idea is in Sell phase |
| `stage:review` | Idea is in Review phase |
| `bu:*` | Identifies the submitting Business Unit |
| `type:greenfield` | New idea |
| `type:brownfield` | SaaSify existing project |
| `type:whitelabel` | Partner white-labeling |

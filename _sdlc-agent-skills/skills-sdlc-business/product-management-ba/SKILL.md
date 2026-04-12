---
name: product-management-ba
description: Product management from a business analyst perspective. Use this skill for working with product owner, defining product roadmap, prioritizing features, and managing product discovery.
---

# Product Management for BA

## When to Use

- When working with Product Owner on product definition
- For conducting product discovery
- When defining MVP and roadmap
- For prioritizing features
- When validating product hypotheses
- For defining product metrics

## Key Concepts

**Product Management for BA** — collaboration with Product Owner to define what to build and for whom, with focus on customer and business value.

### Product Management Framework

```
┌─────────────────────────────────────────────────────────────────┐
│              PRODUCT MANAGEMENT FRAMEWORK                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────┐   ┌─────────────┐   ┌─────────────┐           │
│  │  DISCOVER   │ ─▶│  VALIDATE   │ ─▶│  BUILD      │           │
│  │             │   │             │   │             │           │
│  │ • Problems  │   │ • Hypothesis│   │ • MVP       │           │
│  │ • Solutions │   │ • Testing   │   │ • Features  │           │
│  │ • Insights  │   │ • Feedback  │   │ • Launch    │           │
│  └─────────────┘   └─────────────┘   └─────────────┘           │
│        │                 │                  │                    │
│        └─────────────────┴──────────────────┘                    │
│                      DISPATCH (delivery)                        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### BA and Product Owner Roles

| BA Does | Product Owner Does |
|---------|---------------------|
| Collects and documents requirements | Defines product vision |
| Analyzes business processes | Prioritizes backlog |
| Conducts stakeholder interviews | Makes feature decisions |
| Creates functional specifications | Defines acceptance criteria |
| Validates requirements with users | Manages stakeholder expectations |

## Product Discovery

### Discovery Methods

| Method | Description | When to Use |
|-------|-------------|-------------|
| **User Interviews** | Deep user interviews | Understanding problems |
| **Surveys** | Quantitative surveys | Scaling |
| **Competitive Analysis** | Competitor analysis | Positioning |
| **Market Research** | Market research | New markets |
| **Data Analysis** | Data analysis | Existing products |
| **Observation** | User observation | Context |

### Discovery Outputs

```
DISCOVERY OUTPUTS:
══════════════════════════

1. Problem Statements
   - Pain points identified
   - User needs documented
   - Business impact quantified

2. Solution Ideas
   - Feature candidates
   - Hypotheses to test
   - Prioritized list

3. Insights
   - User behavior patterns
   - Market opportunities
   - Technical constraints
```

## Product Roadmap

### Roadmap Structure

```
PRODUCT ROADMAP: [Product] 2026

════════════════════════════════════════════════════════════

Q1 2026                    Q2 2026                    Q3-Q4 2026
(Foundation)              (Growth)                   (Scale)
────────────              ──────────                 ─────────

[Core Platform]           [User Portal]              [Mobile App]
  - Basic auth              - Self-service             - iOS/Android
  - Core features           - Dashboard                - Push notifications
  - API v1                  - Analytics                - Offline mode

[Integrations]            [Advanced Features]         [Enterprise]
  - Webhooks                - AI/ML                    - SSO/SAML
  - Public API              - Automation               - Audit logs
  - Partner portal          - Advanced reporting       - SLA

════════════════════════════════════════════════════════════
Legend: MVP ────▶ Enhancements ────▶
```

### Roadmap Types

| Type | Description | Use Case |
|------|-------------|----------|
| **Time-based** | By quarters/months | Stable teams |
| **Feature-based** | By feature groups | Product launches |
| **Goal-based** | By goals/OKR | Outcome-focused |
| **Kanban** | Continuous | Maintenance mode |

## Product Metrics

### North Star Metric

```
NORTH STAR: [Main metric]

Formula: [Metric that best reflects value]

Examples:
- Revenue per user
- Active users
- Tasks completed
- Conversion rate

Target: [target value]
```

### Metrics Framework

```
PIRATE METRICS:
═══════════════════════

┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐
│ ACQUIRE │  │ ACTIVATE│  │ RETAIN  │  │ REFER   │  │ REVENUE │
│         │  │         │  │         │  │         │  │         │
│ - Traffic│  │ - Signups│  │ - DAU   │  │ - NPS   │  │ - LTV   │
│ - CAC   │  │ - Onboard│  │ - Churn │  │ - Viral │  │ - MRR   │
│ - Sources│  │ - Time2value│  │ - Retention│ │ - K-factor││ - ARPU │
└─────────┘  └─────────┘  └─────────┘  └─────────┘  └─────────┘
```

## Templates

### Product Brief Template

```markdown
# Product Brief: [Product/Feature name]

**Version:** 1.0
**Date:** [Date]
**Product Owner:** [Name]
**Business Analyst:** [Name]

## Problem Statement
[Description of problem the product solves]

## Target Audience
| Segment | Description | Size |
|---------|-------------|------|
| Primary | [Main segment] | [Size] |
| Secondary | [Secondary segment] | [Size] |

## Hypothesis
We believe that [product/feature] for [audience] will [business result], because [rationale].

## Success Metrics
| Metric | Target | Measurement |
|--------|--------|-------------|
| [Metric 1] | [Target] | [How measured] |
| [Metric 2] | [Target] | [How measured] |

## MVP Scope
### Must Have
- [Feature 1]
- [Feature 2]

### Should Have
- [Feature 3]

### Won't Have (this release)
- [Feature 4]

## User Stories
| ID | Story | Priority | Estimation |
|----|-------|----------|------------|
| US-001 | As a user... | P0 | 5 SP |
| US-002 | As a user... | P1 | 3 SP |

## Timeline
| Milestone | Date |
|-----------|------|
| Discovery complete | [Date] |
| MVP ready | [Date] |
| Beta launch | [Date] |
| General availability | [Date] |

## Risks
| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk] | [Impact] | [Mitigation] |

## Dependencies
- [Dependency 1]
- [Dependency 2]
```

### Prioritization Framework

```markdown
# Feature Prioritization: [Product]

## Scoring Matrix

| Feature | Value | Effort | Confidence | Score | Priority |
|---------|-------|--------|-------------|-------|----------|
| Auth system | High | Medium | High | 9.0 | P0 |
| User dashboard | High | Low | High | 12.0 | P0 |
| Search | Medium | High | Medium | 4.5 | P2 |
| Notifications | Medium | Medium | Medium | 6.0 | P1 |

## Priority Framework: ICE
Score = (Impact × Confidence) / Effort

## RICE Scoring
RICE = (Reach × Impact × Confidence) / Effort
```

## Integration with Other Agents

### For Product Owner

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Product brief is ready. Need to approve scope and include in roadmap. Brief: [link].",
  todos: "[-] Review product brief\n[ ] Approve MVP scope\n[ ] Add to roadmap"
)
```

### For User Research (Designer)

```markdown
new_task(
  mode: "sdlc-designer",
  message: "User research required for product. Target audience: [description], Hypothesis: [description].",
  todos: "[-] Conduct user interviews\n[ ] Create user personas\n[ ] Document insights"
)
```

### For Development

```markdown
new_task(
  mode: "sdlc-coder",
  message: "MVP scope approved. Need to implement: [list of features]. Acceptance criteria: [link].",
  todos: "[-] Implement MVP\n[ ] Write tests\n[ ] Conduct review"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Jira | Backlog, roadmap |
| Miro | Discovery workshops |
| Productboard | Roadmapping |
| Amplitude | Product analytics |
| Mixpanel | Analytics |
| Notion | Documentation |

## Product Management for BA Checklist

- [ ] Product vision defined
- [ ] Discovery conducted
- [ ] Product brief created
- [ ] Metrics defined
- [ ] Backlog prioritized
- [ ] Roadmap created
- [ ] Agreed with PO and stakeholders
- [ ] MVP plan exists

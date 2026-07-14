---
name: feasibility-analysis
description: Project feasibility analysis. Use this skill for assessing technical, operational, and economic feasibility of a project before launching.
---

# Feasibility Analysis

## When to Use

- At project start (feasibility study)
- Before submitting a proposal
- For Go/No-Go decision making
- When comparing alternatives
- For determining required resources

## Key Concepts

**Feasibility Analysis** — assessment of how feasible and advisable a project is according to various criteria before deciding to launch it.

### Types of Feasibility

| Type | Description | Key Questions |
|-----|-------------|----------------|
| **Technical** | Technical feasibility | Are technologies available? |
| **Operational** | Operational feasibility | Will it work? |
| **Economic** | Economic feasibility | Is it worth doing? |
| **Legal** | Legal feasibility | Are there restrictions? |
| **Schedule** | Schedule feasibility | Can we meet deadlines? |

### Feasibility Matrix

```
                     High feasibility
                            │
     ┌──────────────────────┼──────────────────────┐
     │                      │                      │
     │   IMPLEMENT          │    PRIORITY         │
     │   (Feasible)         │    (Desirable)       │
     │                      │                      │
 ────┼──────────────────────┼──────────────────────┼─────
     │                      │                      │
     │   RECONSIDER         │    NOT IMPLEMENT    │
     │   (Revisit)          │    (Not Feasible)    │
     │                      │                      │
     └──────────────────────┼──────────────────────┘
                            │
                     Low feasibility
                     
          Technical complexity ──────────────▶
```

## Analysis Components

### 1. Technical Feasibility

```
Technical Feasibility:

✓ Available technologies
   - Existing solutions
   - Open source options
   - Cloud platforms

✓ Technical team
   - Skills
   - Experience
   - Capacity

✓ Infrastructure
   - Existing systems
   - Scalability
   - Performance

✓ Integration
   - API availability
   - Data formats
   - Legacy systems
```

### 2. Operational Feasibility

```
Operational Feasibility:

✓ Organizational fit
   - Culture
   - Processes
   - Stakeholder support

✓ User acceptance
   - Training needs
   - Change management
   - Adoption

✓ Process changes
   - Workflow impact
   - New responsibilities
   - Automation level
```

### 3. Economic Feasibility

```
Economic Feasibility:

✓ Costs
   - Development
   - Operations
   - Maintenance

✓ Benefits
   - Revenue increase
   - Cost reduction
   - Risk reduction

✓ ROI
   - Payback period
   - NPV
   - Break-even

✓ Budget availability
```

### 4. Legal Feasibility

```
Legal Feasibility:

✓ Regulatory compliance
   - GDPR
   - Industry regulations
   - Data protection

✓ Contracts
   - Licensing
   - SLAs
   - Vendor agreements

✓ Intellectual property
```

### 5. Schedule Feasibility

```
Schedule Feasibility:

✓ Timeline
   - Critical milestones
   - Deadlines
   - Dependencies

✓ Resource availability
   - Team capacity
   - Tool availability

✓ Risk timeline
   - Buffer for delays
   - Contingency
```

## Feasibility Assessment Example

### Example: New CRM Implementation

```
FEASIBILITY ASSESSMENT: CRM Implementation

┌────────────────────────────────────────────────────────────┐
│                    ASSESSMENT                              │
├────────────────────────────────────────────────────────────┤
│                                                            │
│  Technical Feasibility: ✅ HIGH                             │
│  ├─ Salesforce/HubSpot available                           │
│  ├─ API integration possible                                │
│  └─ Team has experience                                     │
│                                                            │
│  Operational Feasibility: ⚠ MEDIUM                         │
│  ├─ Training required (2 weeks)                           │
│  ├─ Process changes needed                                │
│  └─ Management support: Yes                                │
│                                                            │
│  Economic Feasibility: ✅ HIGH                              │
│  ├─ ROI: 250% over 3 years                                │
│  ├─ Budget available                                       │
│  └─ Break-even: 14 months                                  │
│                                                            │
│  Legal Feasibility: ✅ HIGH                                 │
│  ├─ GDPR compliance possible                              │
│  └─ No legal blockers                                      │
│                                                            │
│  Schedule Feasibility: ⚠ MEDIUM                           │
│  ├─ Aggressive timeline (3 months)                         │
│  ├─ Need additional resources                             │
│  └─ Can add 20% buffer                                     │
│                                                            │
├────────────────────────────────────────────────────────────┤
│  OVERALL: FEASIBLE ✅                                       │
│  Recommendation: PROCEED with minor schedule adjustments   │
└────────────────────────────────────────────────────────────┘
```

## Templates

### Feasibility Study Template

```markdown
# Feasibility Study: [Project Name]

**Date:** [Date]
**Author:** [Name]
**Status:** [Draft/Final]

## Executive Summary
[1-2 paragraphs with recommendation]

## Project Overview
**Problem/Opportunity:** [Description]
**Proposed solution:** [Description]
**Scope:** [Project boundaries]

## Assessment

### Technical Feasibility
**Rating:** [High/Medium/Low]

| Factor | Assessment | Notes |
|--------|------------|-------|
| Technology | ✅ Available | [Notes] |
| Team skills | ⚠ Need training | [Notes] |
| Integration | ✅ Feasible | [Notes] |
| Infrastructure | ✅ Ready | [Notes] |

**Conclusion:** [Conclusion]

### Operational Feasibility
**Rating:** [High/Medium/Low]

| Factor | Assessment | Notes |
|--------|------------|-------|
| Org fit | ✅ Good | [Notes] |
| User acceptance | ⚠ Needs effort | [Notes] |
| Process changes | ⚠ Moderate | [Notes] |

**Conclusion:** [Conclusion]

### Economic Feasibility
**Rating:** [High/Medium/Low]

| Factor | Assessment | Notes |
|--------|------------|-------|
| ROI | ✅ 250% | 3-year |
| Budget | ✅ Available | $XX |
| Payback | ✅ 14 months | [Notes] |

**Conclusion:** [Conclusion]

### Legal Feasibility
**Rating:** [High/Medium/Low]

| Factor | Assessment | Notes |
|--------|------------|-------|
| Compliance | ✅ Clear | [Notes] |
| Contracts | ✅ Ready | [Notes] |

**Conclusion:** [Conclusion]

### Schedule Feasibility
**Rating:** [High/Medium/Low]

| Factor | Assessment | Notes |
|--------|------------|-------|
| Timeline | ⚠ Tight | Need buffer |
| Resources | ⚠ Need more | [Notes] |

**Conclusion:** [Conclusion]

## Risk Assessment
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Tech risk | Low | High | Proof of concept |
| Schedule risk | Medium | Medium | Add buffer |

## Recommendation
- [ ] APPROVE — Project is feasible
- [ ] APPROVE WITH CHANGES — Adjustments required
- [ ] DECLINE — Project is not feasible

**Reason:** [Rationale]

## Next Steps
- [ ] Detail design
- [ ] Project charter
- [ ] Team allocation
```

### Decision Matrix

```markdown
# Feasibility Decision Matrix

| Option | Technical | Operational | Economic | Legal | Schedule | Score | Recommendation |
|--------|-----------|--------------|-----------|-------|----------|-------|----------------|
| Option A | High | High | High | High | Medium | 4.6 | ✅ SELECT |
| Option B | High | Medium | Medium | High | High | 4.2 | Alternative |
| Option C | Low | Low | Medium | High | Low | 2.4 | ❌ Reject |

Scoring: High=5, Medium=3, Low=1
```

## Integration with Other Agents

### For Decision Making

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Feasibility study is ready. Need to make Go/No-Go decision. Recommendation: [Approve/Approve with changes/Decline].",
  todos: "[-] Review feasibility\n[ ] Make decision\n[ ] Allocate resources"
)
```

### For Detailed Analysis

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Feasibility study shows technical challenges. Need POC to confirm feasibility.",
  todos: "[-] Define POC scope\n[ ] Execute POC\n[ ] Document results"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Excel | Feasibility matrix |
| Miro | Visual assessment |
| Confluence | Documentation |
| Jira | Tracking |

## Feasibility Analysis Checklist

- [ ] Technical assessment conducted
- [ ] Operational assessment conducted
- [ ] Economic assessment conducted
- [ ] Legal assessment conducted
- [ ] Schedule assessment conducted
- [ ] Risks identified
- [ ] Recommendation with rationale exists
- [ ] Results agreed with stakeholders

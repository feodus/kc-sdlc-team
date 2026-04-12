---
name: gap-analysis
description: Gap analysis between current and target state. Use this skill to identify gaps in processes, systems, and requirements when transitioning to the target state.
---

# Gap Analysis

## When to Use

- When transitioning from current (AS-IS) to target (TO-BE) state
- To identify necessary changes
- When assessing readiness for implementation
- To plan migration
- When defining project scope

## Core Concepts

**Gap Analysis** is a method for identifying the gap between current state (AS-IS) and desired future state (TO-BE) to understand necessary changes.

### Types of Gaps

| Type | Description | Example |
|------|-------------|---------|
| **Process** | Differences in processes | Manual vs Automated |
| **Technology** | Differences in technologies | Legacy vs Modern |
| **Skill** | Differences in skills | Manual vs Automated |
| **Knowledge** | Differences in knowledge | Training gaps |
| **Performance** | Differences in performance | 100 req/s vs 10000 req/s |

## Gap Analysis Structure

### Analysis Model

```
AS-IS (Current)     GAP (Gap)           TO-BE (Target)
──────────────── = ────────────── = ─────────────────
Process A      →    What needs      →   Process B
                     to change
```

### Categories of Gaps

```
┌─────────────────────────────────────────────────────────────────┐
│                      GAP ANALYSIS                               │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  AS-IS                          TO-BE                            │
│  ──────                         ──────                           │
│  Manual accounting         →    Automated accounting            │
│  10 days                  →    1 day                           │
│  5% errors                →    0.1% errors                     │
│  Paper documents          →    Digital documents              │
│                                                                  │
│  ─────────────────────────────────────────────────────────────   │
│                                                                  │
│  GAPS IDENTIFIED:                                                │
│  ─────────────────────────────────────────────────────────────   │
│  [1] Technology: Automation system needed                       │
│  [2] Processes: Need to redesign processes                      │
│  [3] Skills: Staff training required                            │
│  [4] Data: Historical data migration                            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Conducting Gap Analysis

### Steps

```
1. DEFINE target state (TO-BE)
   └── What needs to be achieved?

2. DESCRIBE current state (AS-IS)
   └── How does it work now?

3. COMPARE states
   └── What's the difference?

4. IDENTIFY gaps
   └── What needs to change?

5. PRIORITIZE gaps
   └── What's more important?

6. DEFINE solutions
   └── How to close the gaps?
```

### Example: Gap Analysis for CRM Implementation

```
AS-IS (Current):
- Manual customer entry in Excel
- No interaction history
- Reports done manually (2 hours/week)
- Data in different files

TO-BE (Target):
- Automatic entry via form
- Complete history in CRM
- Automated reports
- Unified database

GAPS:
| Gap | Category | Solution | Priority |
|-----|-----------|---------|----------|
| No CRM | Technology | Implement Bitrix24 | Must |
| Manual entry | Process | Automate | Must |
| No integration | Technology | API integration | Should |
| Training | Skill | Training | Should |
```

## Methods for Measuring Gaps

### Quantitative Approach

```
AS-IS Metrics:
- Process time: 10 hours
- Error rate: 5%
- Cost: 1000 rub/operation
- Customer satisfaction: 60%

TO-BE Metrics:
- Process time: 2 hours
- Error rate: 0.1%
- Cost: 200 rub/operation
- Customer satisfaction: 90%

GAP:
- Time: -80%
- Errors: -98%
- Cost: -80%
- Satisfaction: +50%
```

### Qualitative Approach

```
AS-IS → TO-BE → GAP

[Manual accounting] → [Automation] → [Software needed]

[No reporting] → [Dashboards] → [Dashboards needed]

[Fragmented data] → [Unified DB] → [Data migration]
```

## Templates

### Template: Gap Analysis Matrix

```markdown
# Gap Analysis: [Project/System]

**Date:** [Date]
**Author:** [Name]

## AS-IS Description
[Current state description]

## TO-BE Description
[Target state description]

## Gap Matrix

| Area | AS-IS | TO-BE | Gap | Solution | Priority |
|------|-------|-------|-----|---------|----------|
| Process | ... | ... | ... | ... | Must |
| Technology | ... | ... | ... | ... | Must |
| Personnel | ... | ... | ... | ... | Should |
| Data | ... | ... | ... | ... | Could |

## Gap Details

### Gap 1: [Name]
**Category:** Process/Technology/Skill
**Description:** [Gap description]
**Impact:** High/Medium/Low
**Solution:** [Solution description]
**Effort:** [S/M/L]
**Risks:** [Risk list]
```

### Gap Assessment Template

```markdown
# Gap Assessment: [Area]

## Current State (AS-IS)
| Metric | Value | Source |
|--------|----------|----------|
| Time | 10 hours | Measurement |
| Errors | 5% | Statistics |
| Cost | 1000 rub | Calculation |

## Target State (TO-BE)
| Metric | Value | Source |
|--------|----------|----------|
| Time | 2 hours | Requirements |
| Errors | 0.1% | SLA |
| Cost | 200 rub | Business case |

## Gap Summary
| Gap | Current | Target | Change |
|-----|---------|---------|-----------|
| Time | 10 hours | 2 hours | -80% |
| Errors | 5% | 0.1% | -98% |
| Cost | 1000 | 200 | -80%

## Recommendations
1. [Recommendation 1]
2. [Recommendation 2]
```

## Integration with Other Agents

### Transfer to System Analyst

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Gap analysis completed. Need to define technical requirements to close gaps. Gaps: [list].",
  todos: "[-] Analyze gaps\n[ ] Define technical requirements\n[ ] Design architecture"
)
```

### For Solution Development

```markdown
new_task(
  mode: "sdlc-coder",
  message: "Gap analysis ready. Need to develop solution to close priority gaps. Gaps: [list].",
  todos: "[-] Implement solution for Gap 1\n[ ] Implement solution for Gap 2\n[ ] Conduct testing"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Excel | Gap matrix |
| Miro | Visual analysis |
| Confluence | Documentation |
| Jira | Tracking gaps as tasks |

## Gap Analysis Checklist

- [ ] Target state (TO-BE) defined
- [ ] Current state (AS-IS) described
- [ ] All gaps identified
- [ ] Each gap categorized
- [ ] Solutions defined for each gap
- [ ] Gaps prioritized
- [ ] Efforts and risks assessed
- [ ] Results documented
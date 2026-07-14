---
name: root-cause-analysis
description: Root cause analysis. Use this skill for identifying root causes of problems using 5 Why, Fishbone (Ishikawa), and other techniques.
---

# Root Cause Analysis

## When to Use

- For recurring problems
- For understanding deep causes of defects
- When making decisions about improvements
- For preventing future problems
- When conducting post-mortem

## Core Concepts

**Root Cause Analysis (RCA)** — is a methodology for identifying root causes of problems, not symptoms, to develop effective solutions.

### Difference Between Symptom and Cause

```
Symptom (observable):      Customers complain about slow performance
                            ↓
Cause level 1:             Database responds slowly
                            ↓
Cause level 2:             No indexes on frequently used fields
                            ↓
ROOT CAUSE:                Deploy procedure doesn't include index migrations
```

## RCA Methods

### 1. 5 Whys Method

```
Problem: Customer didn't receive order on time

1. Why?
   Customer received order later than expected.

2. Why? (repeat until root cause)
   Because delivery was delayed by 3 days.

3. Why?
   Because the item was not in stock.

4. Why?
   Because the shipment was cancelled.

5. Why?
   Because the manager forgot to place order with supplier.

ROOT CAUSE: No reminder procedure for ordering
```

**Rules:**
- Ask "why" 3-5 times
- Answer with facts, not opinions
- Reach systemic cause

### 2. Fishbone Diagram (Ishikawa)

```
                      PROBLEM
                         │
         ┌───────────────┴───────────────┐
         │                               │
    ┌────┴────┐                    ┌─────┴────┐
    │ PEOPLE  │                    │ PROCESS  │
    │         │                    │          │
    │ - Train │                    │ - Proced │
    │ - Errors│                    │ - Standard│
    └─────────┘                    └──────────┘
         │                               │
    ┌────┴────┐                    ┌─────┴────┐
    │MACHINE  │                    │MATERIALS │
    │         │                    │          │
    │ - Server│                    │ - Quality│
    │ - Soft  │                    │ - Access │
    └─────────┘                    └──────────┘
         │                               │
    ┌────┴────┐                    ┌─────┴────┐
    │METHOD   │                    │MEASUREMENT│
    │         │                    │          │
    │ - SOP   │                    │ - Metrics│
    │ - Reqs  │                    │ - Monitoring│
    └─────────┘                    └───────────┘
```

**Categories (6M):**
- **Man** — People
- **Machine** — Equipment/Technology
- **Method** — Methods/Processes
- **Material** — Materials
- **Measurement** — Measurements/Metrics
- **Mother Nature** — Environment

### 3. Pareto Analysis (80/20)

```
Principle: 80% of problems are caused by 20% of causes

Example distribution:
├─ Cause A: 45%  ████████████
├─ Cause B: 25%  █████
├─ Cause C: 15%  ███
├─ Cause D: 10%  ██
└─ Cause E: 5%   █

Solution: Focus on causes A and B
```

## RCA Process

```
1. DEFINE PROBLEM
   - What happened?
   - When?
   - Where?
   - Who is affected?

2. COLLECT DATA
   - Facts, not opinions
   - Timeline
   - Participants

3. CONDUCT ANALYSIS
   - 5 Whys
   - Fishbone
   - Pareto

4. IDENTIFY ROOT CAUSE
   - Systemic cause
   - Repeatable

5. DEVELOP SOLUTION
   - Prevent recurrence
   - Action items

6. CLOSE
   - Verify effectiveness
   - Document
```

## Templates

### Template: 5 Whys

```markdown
# 5 Whys Analysis: [Problem]

**Date:** [Date]
**Problem:** [Problem description]

## Investigation

### Why 1?
**Question:** Why did [event] happen?
**Answer:** [Cause]

### Why 2?
**Question:** Why did [cause from Why 1] happen?
**Answer:** [Cause]

### Why 3?
**Question:** Why did [cause from Why 2] happen?
**Answer:** [Cause]

### Why 4?
**Question:** Why did [cause from Why 3] happen?
**Answer:** [Cause]

### Why 5?
**Question:** Why did [cause from Why 4] happen?
**Answer:** [ROOT CAUSE]

## Root Cause
[Formulated root cause]

## Recommended Actions
| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| [Action 1] | [Name] | [Date] | [ ] |
| [Action 2] | [Name] | [Date] | [ ] |
```

### Template: Fishbone

```markdown
# Fishbone Diagram: [Problem]

**Date:** [Date]

## Problem
[Problem description]

## Diagram

                    [PROBLEM]
                       │
    ┌──────────────────┼──────────────────┐
    │                  │                  │
┌───┴───┐          ┌───┴───┐          ┌───┴───┐
│PEOPLE │          │MACHINE│          │METHOD │
│       │          │       │          │       │
│ -     │          │ -     │          │ -     │
│ -     │          │ -     │          │ -     │
└───────┘          └───────┘          └───────┘
    │                  │                  │
┌───┴───┐          ┌───┴───┐          ┌───┴───┐
│MATERIAL│         │PROCESS│          │METRICS│
│       │          │       │          │       │
│ -     │          │ -     │          │ -     │
│ -     │          │ -     │          │ -     │
└───────┘          └───────┘          └───────┘

## Root Causes Identified
| Category | Cause | Impact |
|-----------|-------|--------|
| [Category] | [Cause] | High |

## Actions
| Action | Owner | Priority |
|----------|---------------|-----------|
| [Action] | [Name] | High |
```

### Template: Post-Mortem

```markdown
# Post-Mortem: [Incident]

**Date:** [Date]
**Duration:** [N hours]
**Impact:** [Description]

## Timeline
| Time | Event |
|-------|---------|
| 10:00 | Problem discovered |
| 10:15 | Investigation started |
| 11:00 | Root cause found |
| 12:00 | Fix applied |
| 13:00 | Problem resolved |

## Root Cause
[Root cause description]

## Impact Analysis
- Customers affected: [N]
- Financial losses: [Amount]
- Reputation damage: [Assessment]

## Corrective Actions
| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| [Action 1] | [Name] | [Date] | [ ] |

## Preventive Actions
| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| [Action 1] | [Name] | [Date] | [ ] |

## Lessons Learned
1. [Lesson 1]
2. [Lesson 2]
```

## Integration with Other Agents

### Handover for Fix

```markdown
new_task(
  mode: "sdlc-coder",
  message: "Root cause analysis conducted. Root cause identified: [description]. Need to develop and apply fix.",
  todos: "[-] Develop fix\n[ ] Apply\n[ ] Verify\n[ ] Write test"
)
```

### For Prevention

```markdown
new_task(
  mode: "sdlc-devops",
  message: "RCA revealed systemic problem: [description]. Need to implement preventive measures (monitoring, alerts).",
  todos: "[-] Configure monitoring\n[ ] Configure alerts\n[ ] Verify"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Miro | Fishbone diagram |
| Lucidchart | Diagrams |
| Jira | Tracking actions |
| Confluence | Post-mortem docs |

## RCA Checklist

- [ ] Problem clearly defined
- [ ] Facts collected
- [ ] Method applied (5 Whys or Fishbone)
- [ ] Systemic cause found
- [ ] Corrective actions developed
- [ ] Owners assigned
- [ ] Effectiveness verified
- [ ] Documented for future
---
name: requirements-prioritization
description: Requirements prioritization methods. Use this skill for defining requirements priorities using MoSCoW, KANO, WSJF, RICE, and other techniques.
---

# Requirements Prioritization

## When to Use

- With limited resources and budget
- For defining release scope
- When planning sprints
- For aligning expectations with stakeholders
- When defining MVP (Minimum Viable Product)
- For managing technical debt

## Core Concepts

**Prioritization** is the process of determining the order of requirements implementation based on their importance, urgency, dependencies, and constraints.

### Why Prioritize

- Limited resources (time, budget, team)
- Different levels of business importance
- Dependencies between requirements
- Need for fast time-to-market

## Prioritization Methods

### 1. MoSCoW

Simple and widely used method.

| Category | Description | Budget % |
|-----------|-------------|-----------|
| **Must Have** | Critically important | 60% |
| **Should Have** | Important but not critical | 20% |
| **Could Have** | Desirable | 20% |
| **Won't Have** | Not in this release | 0% (backlog) |

**Example:**

```
Order management system requirements:
- Must Have: Order creation, payment — 60%
- Should Have: Order history, notifications — 20%
- Could Have: Recommendations, reviews — 20%
- Won't Have: External system integration — postponed
```

**Rules:**
- Must Have = release impossible without them
- Should Have = important but there is workaround
- Could Have = can be implemented if time remains
- Won't Have = not this year

### 2. KANO Model

KANO model defines three types of requirements:

| Type | Description | Example |
|------|-------------|--------|
| **Must-be** | Basic expectations | Payment security |
| **One-dimensional** | Linear (more = better) | Delivery speed |
| **Attractive** | Unexpected, delighting | Personalization |

**How to use:**

```
Customer survey:
- "How would you feel about feature X?" (Neutral / Expect / Like / Don't care / Dislike)

Analysis:
- Must-be: high "Dislike" when absent
- One-dimensional: linear correlation
- Attractive: high "Like" when present
```

### 3. WSJF (Weighted Shortest Job First)

Method from SAFe (Scaled Agile Framework).

```
WSJF = (Business Value + Time Criticality + Risk Reduction) / Job Size
```

**Parameters:**

| Parameter | Scale | Description |
|----------|-------|----------|
| Business Value | 1-9 | Business value |
| Time Criticality | 1-9 | Urgency |
| Risk Reduction | 1-9 | Risk reduction |
| Job Size | 1-21 | Size (story points) |

**Calculation Example:**

```
US-001: Order placement
- Business Value: 8
- Time Criticality: 9
- Risk Reduction: 7
- Job Size: 8
WSJF = (8 + 9 + 7) / 8 = 3.0

US-002: Product search  
- Business Value: 6
- Time Criticality: 5
- Risk Reduction: 4
- Job Size: 3
WSJF = (6 + 5 + 4) / 3 = 5.0
```

### 4. RICE Scoring

Method from Intercom.

```
RICE = (Reach × Impact × Confidence) / Effort
```

| Parameter | Description | Scale |
|----------|-------------|-------|
| Reach | How many users affected per quarter | 1-100 |
| Impact | How important | 0.25/0.5/1/2/3 |
| Confidence | Confidence in estimate | 50%/80%/100% |
| Effort | Person-days | 1-N |

### 5. PESTLE + Impact/Effort Matrix

```
                 High Impact
                    │
     Implement      │    Priority
     first          │    (MVP)
     (MVP)          │
────────────────────┼─────────────────────
     Secondarily    │    Remove/Postpone
     (improvements) │    (low value)
                    │
                Low Impact
                     High Effort → Low Effort
```

## Prioritization Structure

### Priority Matrix

```markdown
| ID | Requirement | MoSCoW | WSJF | Release | Status |
|----|------------|--------|------|-------|--------|
| BR-001 | Order creation | Must | 8.0 | 1.0 | Approved |
| BR-002 | Product search | Must | 5.0 | 1.0 | Approved |
| BR-003 | Order history | Should | 3.5 | 1.0/2.0 | Pending |
| BR-004 | Recommendations | Could | 2.0 | 2.0 | Backlog |
```

### Prioritization Agreement Document

```markdown
# Prioritization Agreement: [Project/Release]

**Date:** [Date]
**Participants:** [List]

## Reviewed Requirements
| Requirement | Priority | Votes |
|------------|-----------|--------|
| ... | ... | ... |

## Decision
- **Release 1 (MVP):** [Must Have list]
- **Release 2:** [Should Have list]
- **Release 3:** [Could Have list]

## Signatures
- [Customer]
- [Product Owner]
- [BA]
```

## Templates

### Template: WSJF Calculator

```markdown
# WSJF Calculator

| US | Business Value | Time Criticality | Risk Reduction | Job Size | WSJF | Priority |
|----|----------------|------------------|----------------|----------|------|-----------|
| US-001 | 8 | 9 | 7 | 8 | 3.00 | 4 |
| US-002 | 6 | 5 | 4 | 3 | 5.00 | 2 |
| US-003 | 9 | 8 | 6 | 13 | 1.77 | 5 |
| US-004 | 5 | 4 | 3 | 2 | 6.00 | 1 |
```

### Template: Prioritization Workshop

```markdown
# Prioritization Workshop: [Project]

**Date:** [Date]
**Facilitator:** [Name]

## Rules
1. Each participant votes for 3 Must Have
2. Discussion max 2 minutes per requirement
3. Decisions recorded immediately

## Voting Results

### Must Have (votes > 50%)
| Requirement | Votes |
|------------|---------|
| BR-001 | 5/6 |
| BR-002 | 4/6 |

### Should Have
...

### Could Have
...

## Agreed Priorities
- **Release 1:** [List]
- **Release 2:** [List]
- **Backlog:** [List]
```

## Integration with Other Agents

### Transfer to Project Manager Planning

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Requirements priorities agreed. Need to include in project plan and estimate timelines. Requirements: [list with priorities].",
  todos: "[-] Add to backlog\n[ ] Estimate timelines\n[ ] Define resources"
)
```

### Request Estimation from Technical Team

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Requirements prioritized. Need to estimate technical complexity and size (story points). Priorities: [list].",
  todos: "[-] Estimate Story Points\n[ ] Define dependencies\n[ ] Identify technical risks"
)
```

## Method Selection Criteria

| Situation | Recommended Method |
|----------|---------------------|
| Simple project, quick decisions | MoSCoW |
| Need to understand customer expectations | KANO |
| Many requirements, need numerical method | WSJF |
| Distributed team, need transparency | RICE |
| Limited budget | Impact/Effort Matrix |

## Tools

| Tool | Method |
|------|-------|
| Jira | MoSCoW, WSJF |
| Azure DevOps | WSJF |
| Trello | MoSCoW |
| Notion | All methods |
| Miro | Visual prioritization |

## Prioritization Checklist

- [ ] All stakeholders involved in process
- [ ] Criteria understood and agreed
- [ ] There are quantitative estimates (where applicable)
- [ ] Decisions documented
- [ ] There is backup plan for lowering priority
- [ ] Regularly reviewed (iterative)
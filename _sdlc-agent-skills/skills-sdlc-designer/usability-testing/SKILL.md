---
name: usability-testing
description: Usability testing with real users. Use to identify UX problems and improve user experience.
---

# Usability Testing

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for conducting usability testing. Includes preparation, execution, analysis, and documentation of testing results with users.

## When to Use

Use this skill:
- When testing with real users
- For identifying UX problems
- When evaluating design solutions
- For comparing variants
- When redesigning existing product
- For validating new features

## Testing Types

### By Format

| Type | Description | When |
|-----|-------------|-------|
| Moderated | Facilitator conducts | In-depth research |
| Unmoderated | Automated | Scaling |
| Remote | Remote | Geographic distribution |

### By Methodology

| Type | Description |
|-----|-------------|
| Quantitative | Statistically significant data |
| Qualitative | Deep insights |

## Preparation

### Test Script

```markdown
# Usability Test Script

## Introduction (2 min)
- Introduce yourself
- Explain the purpose of the test
- Ask permission to record
- Answer questions

## Warm-up (3 min)
- Get to know the participant
- Their experience with similar products

## Tasks (20 min)
### Task 1: [Task description]
- Present the task
- Observe as they attempt to complete
- Note any confusion or issues
- Ask follow-up questions

### Task 2: [Task description]
...

## Post-test (5 min)
- What was easy/difficult?
- Any questions?
- Would you recommend this product?
```

### Task Scenarios

```markdown
## Task 1: Find product
"Imagine you're looking for a red winter jacket. 
Find a product and add it to your cart."

## Success Criteria
- [] Found product page
- [] Added to cart
- [] Completed checkout flow
```

### Metrics

| Metric | Description | Target |
|--------|-------------|--------|
| Task completion | % successfully completed | > 80% |
| Time on task | Time to complete | < X min |
| Errors | Number of errors | < 3 |
| SUS Score | System Usability Scale | > 68 |

## Execution

### Session Flow

```
1. Introduction (5 min)
2. Warm-up (5 min)
3. Core tasks (20-30 min)
4. Debrief (10 min)

Total: 45-60 minutes
```

### Observation Tips

```markdown
## What to observe
- Mouse movements
- Hesitation
- Frustration signals
- Self-talk
- Questions asked

## What to avoid
- Leading questions
- Helping too quickly
- Interrupting flow
- Making assumptions
```

### Think Aloud Protocol

"Please describe out loud what you're doing and why."
```

## Analysis

### Affinity Diagram

```
[Group observations into themes]

## Theme 1: Navigation
- Observation A
- Observation B
- Observation C

## Theme 2: Clarity
- Observation A
- Observation B
```

### Findings Template

```markdown
# Usability Test Findings

## Participants
5 participants, [demographics]

## Key Findings

### Finding 1: [Title]
Severity: Critical/High/Medium/Low

**Observation**
[Description]

**Impact**
[User impact]

**Recommendation**
[Design recommendation]
```

### Metrics Calculation

```markdown
## Task Completion
Task 1: 5/5 (100%)
Task 2: 3/5 (60%)

## Average Time
Task 1: 45 seconds
Task 2: 2 minutes

## Error Rate
Task 1: 1 error
Task 2: 4 errors

## SUS Score
78/100 (Good)
```

## Remote Testing

### Tools

| Tool | Features |
|------|----------|
| UserTesting | Remote unmoderated |
| Maze | Rapid testing |
| Lookback | Moderated remote |
| UserZoom | Enterprise |

### Remote Best Practices

```
1. Send clear instructions
2. Test technology beforehand
3. Have backup plan
4. Record sessions
5. Follow up with thank you
```

## Quality Criteria

- [ ] Tasks defined clearly
- [ ] Participants relevant
- [ ] Sessions recorded
- [ ] Findings documented
- [ ] Recommendations practical
- [ ] Follow-up conducted
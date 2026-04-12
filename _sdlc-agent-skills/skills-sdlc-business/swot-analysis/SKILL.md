---
name: swot-analysis
description: SWOT analysis for business analytics. Use this skill for conducting SWOT analysis of a project, product, or business direction.
---

# SWOT Analysis

## When to Use

- During strategic planning
- For evaluating a project or product
- When analyzing competitive position
- When making decisions about development
- For determining strategies

## Core Concepts

**SWOT** — is an acronym for Strengths, Weaknesses, Opportunities, Threats.

### SWOT Matrix

```
                    Internal Factors
                 Strengths      Weaknesses
              ┌──────────────┬──────────────┐
   Opportunities│   S-O        │   W-O       │  ←
     (Opp)     │   (Maxi)     │   (Mini)    │    External
               ├──────────────┼──────────────┤     factors
     Threats   │   S-T        │   W-T       │
      (Thrt)   │   (Miti)     │   (Prob)    │  →
              └──────────────┴──────────────┘
```

### Quadrant Interpretation

| Quadrant | Strategy | Description |
|----------|----------|-------------|
| **S-O** | Maxi-Maxi | Use strengths for opportunities |
| **W-O** | Mini-Maxi | Overcome weaknesses for opportunities |
| **S-T** | Maxi-Miti | Use strengths for threat mitigation |
| **W-T** | Mini-Prob | Minimize weaknesses and avoid threats |

## Conducting SWOT

### Steps

```
1. DEFINE PURPOSE
   └─ What are we analyzing? (project, product, company)

2. COLLECT DATA
   ├─ Internal: resources, processes, competencies
   └─ External: market, competitors, trends

3. CONDUCT ANALYSIS
   ├─ Strengths: What do we do well?
   ├─ Weaknesses: What needs improvement?
   ├─ Opportunities: What could help?
   └─ Threats: What could harm?

4. DEVELOP STRATEGY
   └─ S-O, W-O, S-T, W-T strategies

5. DOCUMENT
   └─ Conclusions and recommendations
```

## Analysis Categories

### Strengths

| Category | Examples |
|----------|----------|
| Resources | Finance, team, technology |
| Processes | Efficiency, quality |
| Position | Market share, reputation |
| Competencies | Unique skills, patents |

### Weaknesses

| Category | Examples |
|----------|----------|
| Resources | Lack of finances |
| Processes | Outdated processes |
| Position | Low brand awareness |
| Competencies | Lack of skills |

### Opportunities

| Category | Examples |
|----------|----------|
| Market | Growing demand, new segments |
| Technology | New technologies |
| Regulatory | Government support |
| Competitive | Competitor exit |

### Threats

| Category | Examples |
|----------|----------|
| Market | Competition, demand decline |
| Technology | Technology obsolescence |
| Regulatory | New regulations |
| Economic | Inflation, crisis |

## SWOT Examples

### Example: New Product Launch

```
STRENGTHS:
✓ Strong brand
✓ Loyal customer base
✓ Experienced team
✓ Funding available

WEAKNESSES:
✗ No experience in this market
✗ Limited marketing budget
✗ Small team

OPPORTUNITIES:
→ Growing market
→ Few competitors in segment
→ New technologies

THREATS:
⚠ Large players may enter
⚠ Economic situation
⚠ Regulatory changes

STRATEGIES:
S-O: Use brand for rapid market capture
W-O: Find partner to strengthen
S-T: Use reputation to protect position
W-T: Scale quickly before competitors arrive
```

### Example: Process Optimization

```
STRENGTHS:
✓ Expert team
✓ Good customer relationships

WEAKNESSES:
✗ Outdated system
✗ High staff turnover

OPPORTUNITIES:
→ Implement automation
→ Staff training

THREATS:
⚠ Customer loss during transition

STRATEGIES:
S-O: Quickly implement automation with experts
W-T: Minimize disruption for customers
```

## Templates

### Template: SWOT Matrix

```markdown
# SWOT Analysis: [Subject]

**Date:** [Date]
**Author:** [Name]

## STRENGTHS
| # | Strength | Impact | Evidence |
|---|----------|--------|----------|
| 1 | [Strength 1] | High | [Evidence] |
| 2 | [Strength 2] | Medium | [Evidence] |

## WEAKNESSES
| # | Weakness | Impact | Action |
|---|----------|--------|--------|
| 1 | [Weakness 1] | High | [Action] |
| 2 | [Weakness 2] | Medium | [Action] |

## OPPORTUNITIES
| # | Opportunity | Probability | Impact |
|---|-------------|-------------|--------|
| 1 | [Opportunity 1] | High | High |
| 2 | [Opportunity 2] | Medium | Medium |

## THREATS
| # | Threat | Probability | Impact | Mitigation |
|---|--------|-------------|--------|------------|
| 1 | [Threat 1] | Medium | High | [Action] |

## Strategies

### S-O Strategies (Maxi-Maxi)
| Strategy | Description |
|-----------|------------|
| [Strategy 1] | [Description] |

### W-O Strategies (Mini-Maxi)
| Strategy | Description |
|-----------|------------|
| [Strategy 1] | [Description] |

### S-T Strategies (Maxi-Miti)
| Strategy | Description |
|-----------|------------|
| [Strategy 1] | [Description] |

### W-T Strategies (Mini-Prob)
| Strategy | Description |
|-----------|------------|
| [Strategy 1] | [Description] |

## Prioritized Actions
| Action | Strategy | Owner | Due Date |
|----------|-----------|--------|----------|
| [Action 1] | S-O | [Name] | [Date] |
```

### Template: Competitive SWOT

```markdown
# Competitive SWOT: [Product] vs [Competitor]

## Our Product
### Strengths
- [Strength 1]
- [Strength 2]

### Weaknesses
- [Weakness 1]
- [Weakness 2]

## Competitor [Name]
### Strengths
- [Strength 1]
- [Strength 2]

### Weaknesses
- [Weakness 1]
- [Weakness 2]

## Comparative Table
| Factor | Our Product | Competitor | Advantage |
|--------|-------------|------------|-----------|
| Price | $10 | $15 | Us |
| Quality | High | Medium | Us |
| Support | 24/7 | 9-5 | Us |
```

## Integration with Other Agents

### For Strategic Planning

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "SWOT analysis conducted. Need to develop strategy based on identified strategies. Document: [link].",
  todos: "[-] Prioritize strategies\n[ ] Include in plan\n[ ] Define resources"
)
```

### For Product Development

```markdown
new_task(
  mode: "sdlc-marketer",
  message: "SWOT analysis ready. Need to develop marketing strategy based on S-O and S-T strategies. Document: [link].",
  todos: "[-] Develop positioning strategy\n[ ] Define channels\n[ ] Prepare plan"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Miro | Visual SWOT matrix |
| Lucidchart | Diagrams |
| Xtensio | Templates |
| Canvanizer | Online SWOT |

## SWOT Checklist

- [ ] Analysis purpose defined
- [ ] Internal factors data collected
- [ ] External factors data collected
- [ ] Strengths identified
- [ ] Weaknesses identified
- [ ] Opportunities identified
- [ ] Threats identified
- [ ] Strategies developed by quadrant
- [ ] Priority actions defined
- [ ] Results documented
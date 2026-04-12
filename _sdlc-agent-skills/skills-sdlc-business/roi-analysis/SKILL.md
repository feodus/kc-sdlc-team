---
name: roi-analysis
description: Return on Investment (ROI) analysis. Use this skill for calculating and documenting project ROI, evaluating economic efficiency, and making investment decisions.
---

# ROI Analysis

## When to Use

- When justifying investments in projects
- For comparing alternative solutions
- When determining economic feasibility
- For prioritizing projects
- When reporting to management

## Key Concepts

**ROI (Return on Investment)** — metric that measures profitability of investments relative to their cost.

### ROI Formula

```
ROI = (Benefit - Cost) / Cost × 100%

or

ROI = (Net Profit / Investment Cost) × 100%
```

### Additional Metrics

| Metric | Formula | Description |
|--------|---------|-------------|
| **NPV** | Σ (CFt / (1+r)^t) - I0 | Net Present Value |
| **IRR** | r when NPV = 0 | Internal Rate of Return |
| **Payback Period** | I0 / CFavg | Payback period |
| **ROI** | (Benefits - Costs) / Costs | Return on Investment |

## ROI Analysis Structure

### Components

```
┌─────────────────────────────────────────────────────────────────┐
│                    ROI ANALYSIS                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  INVESTMENTS (Costs)                                            │
│  ├── Initial (One-time)                                         │
│  │   ├── Development                                            │
│  │   ├── Equipment                                              │
│  │   ├── Training                                                │
│  │   └── Migration                                              │
│  └── Operational (Ongoing)                                      │
│      ├── Support                                                │
│      ├── Licenses                                               │
│      └── Maintenance                                            │
│                                                                  │
│  ───────────────────────────────────────────────────────────    │
│                                                                  │
│  BENEFITS                                                        │
│  ├── Direct                                                      │
│  │   ├── Cost reduction                                         │
│  │   ├── Revenue increase                                        │
│  │   └── Time reduction                                         │
│  └── Indirect (Intangible)                                       │
│      ├── Quality improvement                                     │
│      ├── Satisfaction increase                                   │
│      └── Risk reduction                                          │
│                                                                  │
│  ───────────────────────────────────────────────────────────    │
│                                                                  │
│  RESULT                                                          │
│  ├── NPV: $XXX                                                  │
│  ├── IRR: XX%                                                   │
│  ├── ROI: XX%                                                   │
│  └── Payback: X months                                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Time Periods

```
Timeline:
────────────────────────────────────────────────────────────▶
Year 0      Year 1      Year 2      Year 3      Year 4      Year 5
 (invest)   (operate)   (operate)   (operate)   (operate)   (operate)
     │           │           │           │           │           │
  -100K      +30K        +35K        +40K        +45K        +50K
              (benefits) (benefits)  (benefits)  (benefits)  (benefits)
```

## ROI Calculation Examples

### Example 1: CRM Implementation

```
PROJECT: CRM System Implementation

INVESTMENTS:
├── Initial:
│   ├── CRM license (3 years): $45,000
│   ├── Implementation: $30,000
│   ├── Integration: $15,000
│   └── Training: $10,000
│   = Total Year 0: $100,000
│
└── Annual:
    ├── Support: $15,000/year
    └── Administration: $5,000/year
    = Total Annual: $20,000

BENEFITS (annually):
├── Customer churn reduction: $25,000
├── Conversion increase: $40,000
├── Admin time reduction: $15,000
└── Reporting improvement: $10,000
= Total Annual Benefits: $90,000

CALCULATION (5 years):
────────────────────────────────────────────
Year 0:  -$100,000
Year 1:  +$90,000 - $20,000 = +$70,000
Year 2:  +$90,000 - $20,000 = +$70,000
Year 3:  +$90,000 - $20,000 = +$70,000
Year 4:  +$90,000 - $20,000 = +$70,000
Year 5:  +$90,000 - $20,000 = +$70,000
────────────────────────────────────────────
Total: -$100,000 + $350,000 = +$250,000

ROI = $250,000 / $100,000 × 100% = 250%
Payback Period = 100,000 / 70,000 = 1.43 years
NPV (10% discount) = $145,000 (positive!)
```

### Example 2: Process Automation

```
PROJECT: Order Processing Automation

Costs (Year 0):
- RPA software: $25,000
- Implementation: $20,000
- Training: $5,000
= Total: $50,000

Benefits (annually):
- FTE reduction: 2 × $30,000 = $60,000
- Error reduction: $10,000
- Process acceleration: $15,000
= Total: $85,000/year

ROI = ($85,000 - $15,000 operating) / $50,000 × 100%
    = $70,000 / $50,000 × 100% = 140% (Year 1)
```

## Templates

### ROI Calculator Template

```markdown
# ROI Analysis: [Project Name]

**Date:** [Date]
**Analyst:** [Name]
**Analysis period:** [3/5 years]

## Investments (Costs)

### Initial (One-time)
| Category | Description | Cost |
|-----------|-------------|------|
| Development | ... | $XX,XXX |
| Equipment | ... | $XX,XXX |
| Training | ... | $XX,XXX |
| Migration | ... | $XX,XXX |
| **Total Year 0** | | **$XXX,XXX** |

### Operational (Annual)
| Category | Annual Cost |
|-----------|-------------|
| Support | $XX,XXX |
| Licenses | $XX,XXX |
| Maintenance | $XX,XXX |
| **Total Annual** | **$XX,XXX** |

## Benefits

### Direct benefits (annually)
| Benefit | Description | Value |
|---------|-------------|-------|
| Cost reduction | ... | $XX,XXX |
| Revenue increase | ... | $XX,XXX |
| Time reduction | ... | $XX,XXX |
| **Total Direct** | | **$XX,XXX** |

### Indirect benefits (annually)
| Benefit | Description | Assessment |
|---------|-------------|------------|
| Quality improvement | ... | $X,XXX |
| Satisfaction | ... | $X,XXX |

## ROI Calculation

### Cash Flow
| Year | Investment | Benefits | Operational | Net Cash Flow |
|------|------------|---------|-------------|---------------|
| 0 | -$100K | - | - | -$100K |
| 1 | - | $90K | $20K | +$70K |
| 2 | - | $90K | $20K | +$70K |

### Summary Metrics
| Metric | Value | Target | Status |
|--------|----------|---------|--------|
| ROI | 250% | >100% | ✅ |
| NPV | $145K | >0 | ✅ |
| IRR | 45% | >15% | ✅ |
| Payback Period | 1.4 years | <3 years | ✅ |

## Sensitivity Analysis
| Parameter | Base | -20% | +20% | Impact |
|----------|---------|------|------|--------|
| Benefits | $90K | $72K | $108K | High |
| Costs | $100K | $80K | $120K | Medium |

## Recommendation
- [ ] ROI positive (>100%)
- [ ] NPV positive
- [ ] Payback period within limits
- [ ] Recommendation: [Approve/Reject]
```

### Executive Summary Template

```markdown
# ROI Executive Summary: [Project]

**Recommendation:** APPROVE ✅

## Key Numbers
| Metric | Value |
|--------|----------|
| Investment | $100,000 |
| Annual benefits | $90,000 |
| ROI (5 years) | 250% |
| Payback period | 1.4 years |
| NPV (10%) | $145,000 |

## Rationale
- Project pays back in less than 2 years
- ROI significantly exceeds target threshold (100%)
- High confidence in benefit estimates

## Risks
| Risk | Probability | Mitigation |
|------|--------------|------------|
| Benefits not achieved | Medium | KPI monitoring |

## Next Steps
- [ ] Approve budget
- [ ] Begin implementation
```

## Integration with Other Agents

### For Project Manager

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "ROI analysis is ready. Need to include in project budget and request approval. Document: [link].",
  todos: "[-] Approve budget\n[ ] Include in plan\n[ ] Agree with Finance"
)
```

### For Data from Data Engineer

```markdown
new_task(
  mode: "sdlc-data",
  message: "Need to provide data for ROI calculation. Required metrics: [list].",
  todos: "[-] Provide data\n[ ] Validate calculations"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Excel | ROI, NPV, IRR calculations |
| Tableau | Visualization |
| Jira | Project metrics tracking |
| Confluence | Documentation |

## ROI Analysis Checklist

- [ ] All cost items defined
- [ ] All benefits defined (direct and indirect)
- [ ] Time horizon specified
- [ ] Discount rate defined
- [ ] NPV, IRR, ROI, Payback calculated
- [ ] Sensitivity analysis conducted
- [ ] Executive summary exists
- [ ] Results agreed with Finance

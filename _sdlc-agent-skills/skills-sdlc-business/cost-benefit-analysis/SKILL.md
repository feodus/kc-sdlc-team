---
name: cost-benefit-analysis
description: Cost-benefit analysis. Use this skill for comparative evaluation of solutions by cost criteria and benefits received, including qualitative and quantitative factors.
---

# Cost-Benefit Analysis

## When to Use

- When comparing alternative solutions
- For budget decision making
- When justifying investments
- For determining most effective solution
- When preparing business cases

## Key Concepts

**Cost-Benefit Analysis (CBA)** — systematic approach to comparing costs and benefits of different options to make informed decisions.

### Types of Costs

| Type | Description | Examples |
|------|-------------|----------|
| **Direct** | Direct costs | Salaries, equipment |
| **Indirect** | Indirect costs | Administrative expenses |
| **Recurring** | Recurring costs | Support, licenses |
| **Non-recurring** | One-time costs | Development, implementation |
| **Opportunity** | Opportunity costs | Foregone benefits |

### Types of Benefits

| Type | Description | Examples |
|------|-------------|----------|
| **Direct** | Direct benefits | Revenue increase |
| **Indirect** | Indirect benefits | Reputation improvement |
| **Quantifiable** | Measurable benefits | Cost reduction |
| **Qualitative** | Qualitative benefits | Customer satisfaction |

## CBA Methods

### 1. Simple Comparison

```
Comparing options:

Variant A:
- Costs: $100,000
- Benefits: $150,000
- Net Benefit: +$50,000
- ROI: 50%

Variant B:
- Costs: $80,000
- Benefits: $110,000
- Net Benefit: +$30,000
- ROI: 37.5%

Winner: Variant A (higher ROI)
```

### 2. Break-even Analysis

```
Break-even point:

Fixed costs: $50,000
Contribution margin: $10/unit

Break-even = Fixed costs / Contribution margin
           = $50,000 / $10
           = 5,000 units

Sales > 5,000 units → Profit
Sales < 5,000 units → Loss
```

### 3. TCO Analysis (Total Cost of Ownership)

```
TCO Analysis:

Option A (On-premise):
├── Capital: $50,000
├── Implementation: $20,000
├── Annual ops (3 years): $30,000 × 3 = $90,000
├── Upgrades: $10,000
└── TCO (3 years): $170,000

Option B (Cloud):
├── Setup: $5,000
├── Monthly subscription (3 years): $500 × 36 = $18,000
├── Training: $3,000
└── TCO (3 years): $26,000

Winner: Option B (saves $144,000)
```

## CBA Structure

### Cost Categories

```
COSTS
══════════════════════════
1. Capital Expenditure (CAPEX)
   - Hardware/Software
   - Development
   - Infrastructure

2. Operating Expenditure (OPEX)
   - Personnel
   - Maintenance
   - Support
   - Licenses

3. Implementation Costs
   - Training
   - Data migration
   - Consulting
   - Change management
```

### Benefit Categories

```
BENEFITS
══════════════════════════
1. Tangible (Measurable)
   - Revenue increase
   - Cost reduction
   - Error reduction
   - Time savings

2. Intangible (Non-measurable)
   - Customer satisfaction
   - Employee satisfaction
   - Brand value
   - Competitive advantage
```

## CBA Examples

### Example: Build vs Buy

```
COST-BENEFIT: Build vs Buy CRM

╔══════════════════════════════════════════════════════════╗
║                    BUILD vs BUY CRM                       ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  BUILD (Custom)                                          ║
║  ─────────────────                                       ║
║  Costs:                                                  ║
║  ├── Dev team (6 months): $180,000                       ║
║  ├── Infrastructure: $30,000                            ║
║  ├── Maintenance (2 years): $60,000                     ║
║  └── Total: $270,000                                    ║
║                                                          ║
║  Benefits:                                               ║
║  ├── Full customization: Priceless                      ║
║  └── No per-user fees: $50,000/yr saved                  ║
║                                                          ║
║  BUY (SaaS)                                              ║
║  ──────────                                              ║
║  Costs:                                                  ║
║  ├── Implementation: $10,000                             ║
║  ├── Subscription (2 years): $48,000                    ║
║  └── Total: $58,000                                     ║
║                                                          ║
║  Benefits:                                               ║
║  ├── Faster deployment                                  ║
║  ├── Less internal effort                               ║
║  └── Always up-to-date                                  ║
║                                                          ║
╠══════════════════════════════════════════════════════════╣
║  RECOMMENDATION: BUY                                    ║
║  - Lower cost ($58K vs $270K)                           ║
║  - Faster time-to-value                                 ║
║  - Less risk                                            ║
╚══════════════════════════════════════════════════════════╝
```

## Templates

### CBA Template

```markdown
# Cost-Benefit Analysis: [Option/Solution]

**Date:** [Date]
**Author:** [Name]
**Analysis horizon:** [3 years]

## Overview
[Brief description of option]

## Costs

### Capital Costs (One-time)
| Item | Year 0 | Notes |
|------|--------|-------|
| Development | $XX,XXX | ... |
| Equipment | $XX,XXX | ... |
| Training | $XX,XXX | ... |
| **Total Capital** | **$XX,XXX** | |

### Operational Costs (Annual)
| Item | Annual | Notes |
|------|--------|-------|
| Personnel | $XX,XXX | ... |
| Maintenance | $XX,XXX | ... |
| Licenses | $XX,XXX | ... |
| **Total Annual** | **$XX,XXX** | |

### Total Cost of Ownership (3 years)
| Year | Cost |
|------|------|
| Year 0 | $XX,XXX |
| Year 1 | $XX,XXX |
| Year 2 | $XX,XXX |
| **TCO** | **$XX,XXX** |

## Benefits

### Tangible Benefits (Annual)
| Benefit | Value | Calculation |
|---------|-------|-------------|
| Cost reduction | $XX,XXX | ... |
| Revenue increase | $XX,XXX | ... |
| Efficiency gains | $XX,XXX | ... |
| **Total** | **$XX,XXX** | |

### Intangible Benefits
| Benefit | Assessment |
|---------|------------|
| Customer satisfaction | High |
| Employee satisfaction | Medium |
| Competitive advantage | High |

## Analysis

### Net Benefit Calculation
| Metric | Value |
|--------|-------|
| Total Benefits (3 years) | $XX,XXX |
| Total Costs (3 years) | $XX,XXX |
| Net Benefit | $XX,XXX |
| ROI | XX% |

### Sensitivity Analysis
| Variable | Base | -20% | +20% | Impact |
|----------|------|------|------|--------|
| Benefits | $100K | $80K | $120K | High |
| Costs | $80K | $64K | $96K | Medium |

## Comparison (if multiple options)

| Metric | Option A | Option B | Winner |
|--------|----------|----------|--------|
| TCO | $100K | $80K | B |
| ROI | 50% | 80% | B |
| Implementation time | 6 mo | 2 mo | B |
| Risk | Medium | Low | B |

## Recommendation
- [ ] APPROVE — option is most effective
- [ ] NEEDS REVIEW — additional analysis required
- [ ] DECLINE — costs exceed benefits

**Rationale:** [Rationale]
```

### Quick Comparison Matrix

```markdown
# Quick CBA: [Options being compared]

| Criteria | Weight | Option A | Option B | Notes |
|-----------|--------|----------|----------|-------|
| Cost | 30% | 7 | 9 | Lower is better |
| Benefits | 25% | 8 | 7 | Higher is better |
| Implementation time | 15% | 5 | 9 | Faster is better |
| Risk | 15% | 6 | 8 | Lower is better |
| Scalability | 15% | 8 | 6 | Higher is better |
| **Weighted Score** | 100% | 6.9 | 7.8 | **B wins** |
```

## Integration with Other Agents

### For Project Manager

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "CBA is ready. Need to approve most effective option for budget inclusion. Document: [link].",
  todos: "[-] Review CBA\n[ ] Approve selection\n[ ] Allocate budget"
)
```

### For Decision Making

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Need to choose between options A and B. CBA shows: [brief summary]. Recommendation: [A/B].",
  todos: "[-] Make decision\n[ ] Document\n[ ] Proceed"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Excel | Calculations, comparison |
| Tableau | Visualization |
| Miro | Visual matrices |
| Jira | Tracking |

## Cost-Benefit Analysis Checklist

- [ ] All cost categories defined
- [ ] All benefit categories defined
- [ ] Costs and benefits quantified
- [ ] Time analysis conducted
- [ ] Alternative comparison exists
- [ ] Sensitivity analysis conducted
- [ ] Recommendation with rationale exists
- [ ] Results agreed with Finance

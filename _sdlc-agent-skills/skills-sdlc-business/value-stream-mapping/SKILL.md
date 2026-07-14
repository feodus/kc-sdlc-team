---
name: value-stream-mapping
description: Value stream mapping. Use this skill for analyzing and optimizing value streams using Lean methodology.
---

# Value Stream Mapping (VSM)

## When to Use

- When implementing Lean/Agile methodologies
- To identify waste in processes
- When optimizing production and business processes
- To reduce execution time (lead time, cycle time)
- When analyzing end-to-end processes

## Core Concepts

**Value Stream Mapping (VSM)** is a Lean methodology for visualizing and analyzing the value creation flow from start to end, including all stages that a product or service goes through.

### What is Value?

```
Value = What the customer is willing to pay for

Examples:
- Finished product
- Solved customer problem
- Quality service

Not value:
- Waiting
- Rework
- Unnecessary approvals
```

### 8 Types of Waste (Muda)

| # | Waste | Description | Example |
|---|--------|-------------|---------|
| 1 | Overproduction | Excessive production | Printing 100 copies, need 10 |
| 2 | Waiting | Waiting | Waiting for approval |
| 3 | Transport | Transportation | Sending documents between departments |
| 4 | Over-processing | Excessive processing | Collecting data no one uses |
| 5 | Inventory | Inventory | Unused materials |
| 6 | Motion | Motion | Searching for information |
| 7 | Defects | Defects | Errors in documents |
| 8 | Skills underutilization | Underutilization | Employee doing simple work |

## Value Stream Map Structure

### Main Elements

```
┌─────────────────────────────────────────────────────────────────────┐
│                    VALUE STREAM MAP                                 │
│  Process: [Name]                                                  │
│                                                                      │
│  ┌──────────┐      ┌──────────┐      ┌──────────┐                   │
│  │Supplier  │─────▶│ Process  │─────▶│ Customer │                   │
│  │Supplier  │      │ Process  │      │ Customer │                   │
│  └──────────┘      └──────────┘      └──────────┘                   │
│       │                  │                   │                      │
│       ▼                  ▼                   ▼                      │
│  [Order            [Value              [Delivery                   │
│   info]             addition]            info]                     │
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐  │
│  │                    TIME LINE                                 │  │
│  │                                                               │  │
│  │  ▶ 2 days ──▶ ▶ 3 hours ──▶ ▶ 1 day ──▶                     │  │
│  │                                                               │  │
│  │  Lead Time: 3 days 14 hours                                  │  │
│  │  Cycle Time: 5 hours                                         │  │
│  │                                                               │  │
│  │  ▶ VA: 4 hours ──▶ NVA: 3 days 10 hours                     │  │
│  │  VA Ratio: 5%                                                │  │
│  └─────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

### Key VSM Metrics

| Metric | Description | Formula |
|--------|-------------|---------|
| **Lead Time** | Total time from order to receipt | Σ (all stages) |
| **Cycle Time** | One cycle time | Execution time × 1 |
| **VA Time** | Value-add time | Σ (value operations) |
| **NVA Time** | Non-value-add time | Lead Time - VA Time |
| **VA Ratio** | Percentage of value time | (VA Time / Lead Time) × 100% |

## Step-by-Step VSM Creation

### Stage 1: Select Stream

```
1. Define start and end of stream
2. Select product/service for analysis
3. Define key participants
```

### Stage 2: Data Collection

```
1. Observe the process
2. Measure time for each stage
3. Define operation type (VA/NVA)
4. Gather data on inventory, queues
```

### Stage 3: Drawing Current State Map

```
1. Draw processes (boxes)
2. Add information flows (arrows)
3. Cycle time and wait time
4. Highlight NVA zones
```

### Stage 4: Waste Analysis

```
1. Look for 8 types of waste
2. Identify bottlenecks
3. Define opportunities
```

### Stage 5: Drawing Future State Map

```
1. Define ideal state
2. Remove waste
3. Create pull system
4. Continuous flow
```

### Stage 6: Action Plan

```
1. Define improvements
2. Assign owners
3. Set deadlines
```

## VSM Example: Request Processing

### Current State

```
Client ──▶ Form ──▶ Waiting ──▶ Verification ──▶ Waiting ──▶ Decision ──▶ Client
            (10 min)  (2 days)    (30 min)    (1 day)    (1 hour)
            
Lead Time: 3 days 11 hours 40 minutes
VA Time: 11 hours 40 minutes
VA Ratio: 13%

Wastes:
- Waiting: 3 days (97% of time!)
- Manual data entry twice
- Verification in multiple systems
```

### Future State

```
Client ──▶ Autoform ──▶ System ──▶ Auto decision ──▶ Client
            (5 min)      (30 min)    (10 min)
            
Lead Time: 45 minutes
VA Time: 45 minutes
VA Ratio: 100%

Improvements:
- Automatic validation
- System integration
- Automatic decision making
```

## Templates

### Template: VSM Summary

```markdown
# Value Stream Map: [Stream Name]

**Date:** [Date]
**Owner:** [Name]
**Product/Service:** [Name]

## Current State

### Metrics
| Metric | Value |
|---------|----------|
| Lead Time | X days |
| Cycle Time | X hours |
| VA Time | X hours |
| NVA Time | X hours |
| VA Ratio | X% |

### Identified Wastes
| Waste | Where | Impact |
|--------|-----|---------|
| Waiting | Stage 2 | 2 days |
| Rework | Stage 3 | 10% |

## Future State

### Target Metrics
| Metric | Target Value |
|---------|------------------|
| Lead Time | < X hours |
| VA Ratio | > 80% |

### Improvement Plan
| Improvement | Stage | Owner | Deadline |
|---------------|------|---------------|------|
| Automation | Stage 2 | Dev team | Q2 |
| Integration | Stage 3 | Dev team | Q2 |

## ROI
| Metric | Before | After | Savings |
|------------|-----|-------|----------|
| Time | 3 days | 1 day | 2 days |
| Cost | 10000 rub | 3000 rub | 7000 rub/process |
```

## Tools

| Tool | Purpose |
|------|---------|
| Miro | Visual VSM |
| Lucidchart | VSM diagrams |
| Visio | Professional VSM |
| Excel | Tables and calculations |
| LeanKit | Kanban for VSM |

## Integration with Other Agents

### For Implementing Improvements

```markdown
new_task(
  mode: "sdlc-coder",
  message: "VSM analysis completed. Need to implement improvements: automation of stages, system integration. Current process: [description], target: [description].",
  todos: "[-] Implement automation\n[ ] Integrate systems\n[ ] Conduct UAT"
)
```

### For DevOps Optimization

```markdown
new_task(
  mode: "sdlc-devops",
  message: "VSM optimization showed need for CI/CD improvement. Current cycle time: X, target: Y.",
  todos: "[-] Analyze pipeline\n[ ] Optimize build\n[ ] Implement automation"
)
```

## VSM Analysis Checklist

- [ ] Stream boundaries defined
- [ ] Data collected for all stages
- [ ] Time measured for each stage
- [ ] VA and NVA operations defined
- [ ] All 8 types of waste identified
- [ ] Current State map drawn
- [ ] Future State map drawn
- [ ] Improvement plan created
- [ ] Owners assigned
---
name: process-mapping
description: Process mapping methods. Use this skill for documenting, analyzing, and optimizing existing business processes (AS-IS and TO-BE).
---

# Process Mapping

## When to Use

- When analyzing current processes (AS-IS)
- When designing target processes (TO-BE)
- For process optimization and improvement
- When documenting processes for requirements
- To identify bottlenecks and issues
- When handing over processes for automation

## Core Concepts

**Process Mapping** is a methodology for documenting and visualizing business processes for understanding, analysis, and improvement.

### Process Types

| Type | Description | Example |
|------|-------------|---------|
| **AS-IS** | Current process | How it works now |
| **TO-BE** | Target process | How it should be |
| **CAN-BE** | Possible process | What could be |

### Levels of Detail

```
Level 1: Macro (high level)
└── Main process: "Order Processing"
    ├── Subprocess 1: Order reception
    ├── Subprocess 2: Processing
    └── Subprocess 3: Delivery

Level 2: Process (middle level)
└── Subprocess: "Order Reception"
    ├── Task 1: Verify data
    ├── Task 2: Confirm availability
    └── Task 3: Create order

Level 3: Task (low level)
└── Task: "Verify data"
    ├── Step 1: Verify email
    ├── Step 2: Verify phone
    └── Step 3: Verify address
```

## Mapping Methods

### 1. Simple Text Description

```markdown
## Process: Request Processing

1. Client submits request via website form
2. System automatically checks field completion
3. If data is incorrect → returns error
4. If data is correct → creates request
5. Manager receives notification
6. Manager reviews request
7. If request approved → goes to work
8. If request rejected → client receives notification
```

### 2. Swimlane Diagram

```
┌─────────────────────────────────────────────────────────┐
│                     Client                               │
│  ┌────────────┐                                         │
│  │Submits    │                                         │
│  │request    │                                         │
│  └─────┬──────┘                                         │
│        │                                                │
│        ▼                                                │
│  ┌────────────┐      ┌────────────────────┐            │
│  │   System  │─────▶│ Validates data     │            │
│  └────────────┘      └────────────────────┘            │
│        │                        │                       │
│        │Error                  │OK                     │
│        ▼                        ▼                       │
│  ┌────────────┐      ┌────────────────────┐            │
│  │Returns    │      │    Manager          │            │
│  │error      │      │                    │            │
│  └────────────┘      │ Reviews request   │            │
│        ▲             └─────────┬──────────┘            │
│        │                       │                       │
│        │              ┌────────┴────────┐              │
│        │              │               │               │
│        │              ▼               ▼               │
│        │        ┌──────────┐  ┌──────────┐           │
│        │        │Approve  │  │Reject    │           │
│        │        └────┬─────┘  └────┬─────┘           │
│        │             │             │                  │
└────────┴─────────────┴─────────────┴──────────────────┘
```

### 3. Value-Added Flow Chart

```
┌─────────────────────────────────────────────────────────┐
│  Stage          │ Action          │ Type       │ Time    │
├───────────────┼─────────────────┼───────────┼──────────┤
│ Reception     │ Accept request  │ VA        │ 2 min    │
│               │ Validate data   │ VA        │ 1 min    │
│               │ (automatically) │           │          │
├───────────────┼─────────────────┼───────────┼──────────┤
│ Processing    │ Assign manager  │ VA        │ 30 sec   │
│               │ Call            │ VA        │ 5 min    │
│               │ client          │           │          │
├───────────────┼─────────────────┼───────────┼──────────┤
│ Verification  │ Verify          │ NVA       │ 2 min    │
│               │ manually        │ (required)│          │
└───────────────┴─────────────────┴───────────┴──────────┘

VA = Value Added (adds value)
NVA = Non-Value Added (doesn't add value but required)
```

## Process Analysis Techniques

### 1. SIPOC Analysis

| Letter | Description | Example |
|--------|-------------|---------|
| **S** uppliers | Suppliers | Client, partners |
| **I** nputs | Inputs | Request, documents |
| **P** rocess | Process | Request processing |
| **O** utputs | Outputs | Approved request |
| **C** ustomers | Customers | End user |

### 2. RACI Matrix

| Process | Role 1 | Role 2 | Role 3 | Role 4 |
|---------|-------|--------|--------|--------|
| Request reception | R | I | C | - |
| Verification | A | R | I | - |
| Approval | A | - | C | I |

**R**esponsible — Execute  
**A**ccountable — Accountable  
**C**onsulted — Consulted  
**I**nformed — Informed

### 3. Gap Analysis (AS-IS vs TO-BE)

```
AS-IS (Current)                    TO-BE (Target)
─────────────────                  ─────────────────
Manual data entry    ────▶      Automatic entry
                                     │
Average time: 30 min              Average: 5 min
                                     │
Errors: 10%                        Errors: < 1%

Gap: Need to implement OCR and validation
```

## Templates

### Template: Process Description

```markdown
# Process Map: [Process Name]

**ID:** PROC-001
**Version:** 1.0
**Date:** [Date]

## General Information
| Field | Value |
|------|----------|
| Goal | [Goal description] |
| Owner | [Role/Name] |
| Input | [Inputs] |
| Output | [Outputs] |
| Frequency | [Daily/on request] |

## AS-IS Process

### Swimlane Diagram
[Diagram]

### Step-by-Step Description
| # | Step | Owner | Time | Type |
|---|-----|---------------|-------|-----|
| 1 | Step 1 | Role 1 | 5 min | VA |
| 2 | Step 2 | Role 2 | 3 min | VA |

### AS-IS Metrics
| Metric | Current Value |
|---------|------------------|
| Execution time | 30 min |
| Cost | 100 rub |
| Errors | 5% |

## TO-BE Process

### Expected Improvements
| AS-IS Problem | TO-BE Solution | Expected Result |
|---------------|--------------|---------------------|
| Manual entry | Automation | -80% time |

### TO-BE Step-by-Step
| # | Step | Owner | Time | Type |
|---|-----|---------------|-------|-----|
| 1 | Step 1 | System | 10 sec | VA |
| 2 | Step 2 | Role 1 | 2 min | VA |

## Gap Analysis

### Gaps
| Area | Gap | Priority |
|---------|-----|-----------|
| Technology | Automation needed | High |
| Personnel | Training required | Medium |

### Recommendations
- [Recommendation 1]
- [Recommendation 2]
```

## Tools

| Tool | Purpose |
|------|---------|
| Miro | Swimlane diagrams, collaborative |
| Lucidchart | Process diagrams |
| Bizagi Modeler | BPMN modeling |
| Visio | Professional diagrams |
| Draw.io | Free modeling |
| Excel | Tables, RACI matrix |

## Integration with Other Agents

### For System Analysis

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Processes documented (AS-IS and TO-BE). Need to design technical implementation of TO-BE processes. Processes: [link].",
  todos: "[-] Analyze TO-BE processes\n[ ] Define technical requirements\n[ ] Design architecture"
)
```

### For DevOps Optimization

```markdown
new_task(
  mode: "sdlc-devops",
  message: "Processes optimized. Need to evaluate automation possibilities. Processes: [list].",
  todos: "[-] Evaluate automation opportunities\n[ ] Propose solutions\n[ ] Evaluate complexity"
)
```

## Process Metrics

| Category | Metric | Description |
|-----------|---------|----------|
| **Time** | Cycle Time | Total execution time |
| **Time** | Lead Time | Time from request to result |
| **Quality** | Error Rate | Percentage of errors |
| **Quality** | First Pass Yield | Pass on first try |
| **Cost** | Cost per Process | Cost per unit |
| **Efficiency** | VA Ratio | Ratio of value steps |
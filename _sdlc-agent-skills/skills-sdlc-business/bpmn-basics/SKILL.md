---
name: bpmn-basics
description: BPMN 2.0 basics for business analysts. Use this skill for creating business processes in BPMN notation, understanding diagrams, and using them in requirements.
---

# BPMN 2.0 Basics for Business Analyst

## When to Use

- When modeling business processes
- For documenting workflows
- When conducting process workshops
- For handing over process documentation to developers
- When analyzing and optimizing processes

## Core Concepts

**BPMN (Business Process Model and Notation)** is a standard notation for modeling business processes, widely used for visualizing and documenting workflows.

### Main BPMN Elements

#### 1. Flow Objects

| Element | Notation | Description |
|---------|-------------|----------|
| **Process** | Rounded rectangle | Executable action |
| **Event** | Circle | Something that happens |
| **Gateway** | Diamond | Decision point |

#### 2. Events

| Type | Notation | Description |
|-----|-------------|----------|
| **Start** | Empty circle | Process start |
| **Intermediate** | Double-line circle | Intermediate event |
| **End** | Thick-line circle | Process end |

**Event Types:**

- ⭕ Timer
- ⭕ Message
- ⭕ Error
- ⭕ Cancel

#### 3. Activities

| Type | Notation | Description |
|-----|-------------|----------|
| **Task** | Rectangle | Work unit |
| **Subprocess** | Rectangle with cross | Nested process |
| **Call Activity** | Double-border rectangle | External process call |

#### 4. Gateways

| Type | Notation | Description |
|-----|-------------|----------|
| **Exclusive (XOR)** | X inside diamond | One path |
| **Inclusive (OR)** | O inside diamond | One or several |
| **Parallel (AND)** | + inside diamond | All paths simultaneously |
| **Event-based** | Rounded diamond | Based on event |

#### 5. Flows

| Type | Arrow | Description |
|-----|---------|----------|
| **Sequence Flow** | ➜ | Sequential flow |
| **Message Flow** | - - ➜ | Message flow between participants |
| **Association** | ➤ | Link to data/documents |

#### 6. Swimlanes

| Element | Description |
|---------|----------|
| **Pool** | Participant or system |
| **Lane** | Role or department within pool |

## Diagram Examples

### Example 1: Simple Process

```
┌─────────────────────────────────────────────────────────────┐
│                      POOL: Online Store                     │
│  ┌─────────────┐                                            │
│  │   LANE:     │                                            │
│  │  Customer   │                                            │
│  └─────────────┘                                            │
│      │                                                      │
│      ▼                                                      │
│  ┌───────────────────┐                                      │
│  │   Start Event    │                                      │
│  └───────────────────┘                                      │
│      │                                                      │
│      ▼                                                      │
│  ┌─────────────────────────┐                               │
│  │    [Place Order]        │  Task                         │
│  └─────────────────────────┘                               │
│      │                                                      │
│      ▼                                                      │
│  ┌─────────────────────────┐                               │
│  │   Gateway (XOR)         │                               │
│  │     Payment successful?  │                               │
│  └─────────────────────────┘                               │
│      │                                                      │
│    ╱   ╲                                                    │
│   ╱     ╲                                                   │
│  ▼       ▼                                                  │
│ ┌─────┐ ┌─────┐                                            │
│ │ Yes │ │ No │                                            │
│ └─────┘ └─────┘                                            │
│  │       │                                                  │
│  ▼       ▼                                                  │
│ ┌─────────────┐  ┌──────────────────┐                     │
│ │[Confirm]    │  │[Return error]     │                     │
│ └─────────────┘  └──────────────────┘                     │
│      │                                                      │
│      ▼                                                      │
│  ┌───────────────────┐                                      │
│  │    End Event     │                                      │
│  └───────────────────┘                                      │
└─────────────────────────────────────────────────────────────┘
```

### Example 2: Parallel Process

```
┌────────────────────────────────────────┐
│           POOL: Order Processing       │
│                                         │
│  ┌──────────┐    ┌──────────┐          │
│  │  Lane:   │    │  Lane:   │          │
│  │  Warehouse│    │ Delivery │          │
│  └──────────┘    └──────────┘          │
│       │                │                │
│       ▼                ▼                │
│  ┌─────────┐     ┌─────────┐           │
│  │[Pick]   │     │[Create]  │           │
│  │  items  │     │  invoice │           │
│  └─────────┘     └─────────┘           │
│       │                │                │
│       └────────┬───────┘                │
│                ▼                        │
│         ┌─────────┐                     │
│         │  AND    │  Parallel Gateway  │
│         └─────────┘                     │
│                │                        │
│       ┌────────┴────────┐              │
│       ▼                 ▼                │
│  ┌─────────┐      ┌─────────┐          │
│  │[Pass to]│     │[Pass to]│          │
│  │delivery │     │ courier │          │
│  └─────────┘      └─────────┘           │
│       │                │                │
│       └────────┬───────┘                │
│                ▼                        │
│         ┌─────────┐                     │
│         │  End    │                     │
│         └─────────┘                     │
└────────────────────────────────────────┘
```

## Tools

| Tool | Purpose | Free |
|------|------------|-----------|
| Bizagi Modeler | Modeling | Yes |
| Camunda Modeler | Modeling | Yes |
| Lucidchart | Visualization | Limited |
| Miro | Visualization | Limited |
| Visio | Modeling | Paid |
| Draw.io | Visualization | Yes |

## Recommendations

### Good BPMN Rules

1. **Start with Start Event** — always
2. **End with End Event** — always
3. **Use clear names** — verb + noun
4. **One gateway = one decision** — don't overload
5. **Avoid crossings** — use swimlanes
6. **Document exceptions** — handle errors

### Common Mistakes

| Mistake | Problem | Solution |
|---------|----------|----------|
| No Start/End | Unclear when process starts/ends | Always add start and end events |
| Overloaded gateway | Too many conditions | Split into multiple gateways |
| No error handling | Exceptions not covered | Add error events |
| Unclear names | "Process A" | "Process order" |

## Templates

### Template: Process Description

```markdown
# Process: [Name]

**ID:** PROCESS-001
**Version:** 1.0
**Author:** [Name]
**Date:** [Date]

## Process Goal
[Description — why this process is needed]

## Participants
| Role | Responsibility |
|------|----------------|
| ... | ... |

## Input
- [Input 1]
- [Input 2]

## Output
- [Output 1]
- [Output 2]

## BPMN Diagram
[Insert diagram]

## Main Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Exceptions
| Situation | Action |
|----------|----------|
| Error 1 | Action 1 |
| Error 2 | Action 2 |

## Metrics
| Metric | Target Value |
|---------|------------------|
| Execution time | < 24 hours |
| Error count | < 1% |
```

## Integration with Other Agents

### Transfer to System Analyst for Technical Implementation

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Business processes documented in BPMN. Need to convert to technical architecture. Processes: [process list].",
  todos: "[-] Analyze BPMN diagrams\n[ ] Design technical architecture\n[ ] Define system components\n[ ] Document API"
)
```

### Transfer to Designer for UX

```markdown
new_task(
  mode: "sdlc-designer",
  message: "Business processes defined. Need to design user scenarios. Processes: [list].",
  todos: "[-] Analyze processes\n[ ] Design user flows\n[ ] Create wireframes\n[ ] Conduct UX review"
)
```
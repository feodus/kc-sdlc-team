---
name: use-case-modeling
description: Developing Use Case diagrams. Use this skill for creating UML use case diagrams and documenting functional requirements in UC format.
---

# Use Case Modeling

## When to Use

- When modeling functional requirements
- For defining system boundaries
- When documenting actor ↔ system interaction
- For handing over requirements to developers
- When validating requirements with users

## Core Concepts

**Use Case** — is a description of a sequence of actions that the system performs to achieve a specific actor goal.

### Use Case Diagram Components

```
┌─────────────────────────────────────────────────────────────────┐
│                      SYSTEM: Online Store                       │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    ┌─────────────┐                                       │   │
│  │    │   Search    │                                       │   │
│  │    │   Products  │                                       │   │
│  │    └──────┬──────┘                                       │   │
│  │           │                                               │   │
│  │    ┌──────┴──────┐                                       │   │
│  │    │    Place    │                                       │   │
│  │    │    Order    │                                       │   │
│  │    └──────┬──────┘                                       │   │
│  │           │                                               │   │
│  │    ┌──────┴──────┐                                       │   │
│  │    │   Track     │                                       │   │
│  │    │   Order     │                                       │   │
│  │    └─────────────┘                                       │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  ┌──────────┐        ┌──────────┐        ┌──────────┐          │
│  │  Customer│        │  Manager │        │  Admin   │          │
│  │  (Actor)│        │  (Actor) │        │  (Actor) │          │
│  └──────────┘        └──────────┘        └──────────┘          │
│       │                    │                    │                  │
│       │                    │                    │                  │
│       └────────────────────┴────────────────────┘                  │
│                    (Associations)                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Core Elements

| Element | Symbol | Description |
|---------|--------|-------------|
| **System** | Rectangle | System boundary |
| **Use Case** | Oval | System function |
| **Actor** | Stick figure | External user |
| **Association** | Line | Actor ↔ UC connection |
| **Include** | <<include>> | Mandatory dependency |
| **Extend** | <<extend>> | Optional dependency |
| **Generalization** | Arrow | Inheritance |

### Use Case Relationships

#### 1. Include

```
Mandatory dependency — common function

    ┌──────────────┐
    │  Login to   │
    │  system     │
    └──────┬───────┘
           │ include
           ▼
    ┌──────────────┐
    │   Verify    │
    │   password  │
    └──────────────┘
```

#### 2. Extend

```
Additional function under specific conditions

    ┌──────────────┐
    │   Place    │ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
    │   Order    │        extend        │
    └──────────────┘                      │
           ▲                               │
           │         ┌──────────────┐      │
           └─────────│    Pay with │      │
                     │    bonus    │      │
                     └──────────────┘      │
                     (for members only)
```

#### 3. Generalization

```
Inheritance between actors

        ┌──────────┐
        │  Person  │  (parent)
        └────┬─────┘
             │
       ┌─────┴─────┐
       │           │
┌──────┴────┐  ┌───┴────────┐
│ Customer  │  │  Manager   │  (children)
└───────────┘  └────────────┘
```

## Creating Use Cases

### Steps

```
1. DEFINE SYSTEM BOUNDARIES
   └─ What is included in the system?

2. IDENTIFY ACTORS
   └─ Who interacts with the system?

3. DEFINE USE CASES
   └─ What should the system do?

4. CONNECT ACTORS AND USE CASES
   └─ Who does what?

5. ADD RELATIONSHIPS
   └─ Include, Extend, Generalization

6. DETAIL EACH UC
   └─ Describe flows
```

### Detail Level: Use Case Description

```markdown
# Use Case: Place Order

**ID:** UC-001
**Version:** 1.0
**Actor:** Customer
**Priority:** High
**Status:** Approved

## Primary Flow
1. Customer adds products to cart
2. Customer proceeds to checkout
3. System displays order form
4. Customer fills in delivery details
5. Customer selects payment method
6. Customer confirms order
7. System creates order
8. System sends confirmation

## Alternative Flows

### AF-001: Guest
1. Customer is not authenticated
2. System offers to login or continue as guest
3. Customer continues as guest
4. Continue from step 3 of main flow

### AF-002: Bonus Payment
1. Customer selects "Pay with bonuses"
2. System checks bonus balance
3. If sufficient → discount applied
4. If insufficient → additional payment suggested

## Error Flows

### EF-001: Product Unavailable
1. On confirmation, product is out of stock
2. System notifies customer
3. Customer removes product or waits

## Business Rules
- Minimum order amount: 500 RUB
- Free delivery from 3000 RUB
- Order retention period: 24 hours
```

## Templates

### Template: Use Case Diagram Legend

```
┌─────────────────────────────────────────────────────────────┐
│                  USE CASE DIAGRAM LEGEND                    │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  Actor ──────────── Use Case     [one-to-one]              │
│  Actor ────►─────── Use Case     [one or more]            │
│  Actor ◄───►─────── Use Case     [multiple actors]        │
│                                                              │
│  Use Case ──►───► Use Case      [include]                 │
│  Use Case ──►───► Use Case      [extend]                  │
│                                                              │
│  [Actor]          [System]          [Use Case]            │
│      ◉               ┌───┐              (  )              │
│                      │   │                                 │
│                      └───┘                                 │
└─────────────────────────────────────────────────────────────┘
```

### Template: Use Case Specification

```markdown
# Use Case Specification

**ID:** UC-[XXX]
**Name:** [Verb + Noun]
**Priority:** [Must/Should/Could/Won't]
**Version:** 1.0
**Status:** [Draft/Approved]

## Brief Description
[1-2 sentences about what the UC does]

## Actors
| Actor | Role | Description |
|-------|------|------------|
| [Name] | [Role] | [Description] |

## Preconditions
- [Condition 1]
- [Condition 2]

## Postconditions (success)
- [Result 1]
- [Result 2]

## Basic Flow
| Step | Actor Action | System Response |
|------|--------------|-----------------|
| 1 | Action | Response |
| 2 | ... | ... |

## Alternative Flows
| ID | Description | Trigger | Steps |
|----|-------------|---------|-------|
| AF-001 | ... | ... | ... |

## Business Rules
- [Rule 1]
- [Rule 2]

## Non-Functional Requirements
- [Requirement 1]
- [Requirement 2]

## Acceptance Criteria
- [Criterion 1]
- [Criterion 2]
```

## Integration with Other Agents

### Handover to System Analyst

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Use cases defined. Need to convert to technical specifications. Use cases: [list].",
  todos: "[-] Analyze UC\n[ ] Create functional specifications\n[ ] Design API"
)
```

### Handover to Testing

```markdown
new_task(
  mode: "sdlc-tester",
  message: "Use cases ready. Need to write test cases based on flows. Use cases: [list].",
  todos: "[-] Write test cases for basic flow\n[ ] Write test cases for alternative flows\n[ ] Conduct testing"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| PlantUML | Text-based UML |
| Draw.io | Visual modeling |
| Lucidchart | UML diagrams |
| Visual Paradigm | Professional modeling |
| Astah | UML modeling |

## Use Case Modeling Checklist

- [ ] System boundaries defined
- [ ] All actors identified
- [ ] All use cases defined
- [ ] Actor ↔ use case connections established
- [ ] Include/extend used where needed
- [ ] Each UC has flow descriptions
- [ ] Business rules defined
- [ ] Acceptance criteria added
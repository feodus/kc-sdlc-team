---
name: user-stories-ba
description: User story development from a business analyst perspective. Use this skill for creating user stories in INVEST format, acceptance criteria, and acceptance criteria.
---

# User Stories for BA

## When to Use

- In iterative development (Agile/Scrum/Kanban)
- For detailing requirements as user stories
- When planning sprints with product owner
- For handing over requirements to developers
- When defining acceptance criteria

## Core Concepts

**User Story** is a short, simple description of a feature from the user's perspective, expressing business value.

### Format

```
As a [user type]
I want to [action/feature]
So that [business value/benefit]
```

### Examples

```
✓ Good: "As a customer, I want to track my order status so that I know when to expect delivery"

✗ Bad: "As a user, I want a search box so that I can find products"
```

### INVEST Methodology

| Letter | Criterion | Description |
|-------|----------|----------|
| **I** | Independent | Independent from other stories |
| **N** | Negotiable | Flexible, discussable |
| **V** | Valuable | Brings value |
| **E** | Estimable | Can estimate complexity |
| **S** | Small | Small enough for sprint |
| **T** | Testable | Can be tested |

## User Story Structure

### Main Elements

```markdown
# US-[Number]: [Brief name]

**Epic:** [Epic link]
**Priority:** [P0/P1/P2/P3] 
**Story Points:** [Number]
**Owner:** [Role]
**Sprint:** [Number]

## Description
As a [user type],
I want to [action],
so that [value].

## Acceptance Criteria

### Happy Path
GIVEN [initial state]
WHEN [user action]
THEN [expected result]

### Alternative Paths
GIVEN [condition]
WHEN [action]
THEN [alternative result]

### Error Handling
GIVEN [error]
WHEN [action]
THEN [error message]
```

### Acceptance Criteria in Gherkin Format

```gherkin
Feature: Product search on website

  Scenario: Successful search by name
    Given user is on homepage
    When enters "laptop" in search field
    And clicks "Search" button
    Then search results are displayed
    And results contain "laptop"

  Scenario: Search with no results
    Given user is on homepage
    When enters "completely_nonexistent_product_12345" in search field
    And clicks "Search" button
    Then message "No products found" is displayed
    And suggestion "Try changing your search query"
```

## Detail Methods

### 1. Splitting User Stories

**By size:**
- Split by create/read/update/delete
- Separate different roles
- Split happy path and error cases

**Example of splitting:**

```
❌ Big story: "As a user, I want to manage my profile"
  
✓ Small stories:
  - US-001: "As a user, I want to view my profile"
  - US-002: "As a user, I want to edit my profile"
  - US-003: "As a user, I want to upload avatar"
  - US-004: "As a user, I want to change password"
```

**Splitting rules:**
- Each story should fit in a sprint
- Story should be valuable on its own
- Avoid dependencies between stories in a sprint

### 2. Acceptance Criteria

**Types of criteria:**

| Type | Description | Example |
|------|-------------|--------|
| Functional | What system should do | Product list displayed |
| Non-functional | How system works | Response time < 2 sec |
| UX/UI | Appearance | Blue button |
| Data | Data handling | Max 1000 products |
| Integration | Integrations | CRM synchronization |

**Full AC Example:**

```markdown
## Acceptance Criteria

### Functional
- [ ] User can enter text in search field
- [ ] Search performs by product name
- [ ] Results displayed as list
- [ ] Message shown when no results

### Performance
- [ ] Results displayed in less than 2 seconds
- [ ] Search works with 10000+ products

### UX
- [ ] Search field has placeholder "Search products..."
- [ ] Search button has magnifying glass icon
- [ ] Cursor changes to pointer on hover

### Error Cases
- [ ] Empty query: "Enter search query"
- [ ] Server error: "Technical error. Try later"
```

## Templates

### Template: User Story

```markdown
# US-[XXX]: [Name]

**Epic:** [Epic]
**Story Points:** [1/2/3/5/8/13]
**Priority:** [P0-P3]
**Sprint:** [N]

## User Story
As a [user role],
I want to [action],
so that [value].

## Acceptance Criteria

### Essential (Must Have)
- [ ] [Criteria 1]
- [ ] [Criteria 2]

### Desirable (Should Have)
- [ ] [Criteria 3]

## Dependencies
- [Dependency 1]
- [Dependency 2]

## Notes
- [Note 1]

## Tasks
- [ ] Task 1
- [ ] Task 2

## Test Scenarios
- TC-001: [Scenario 1]
- TC-002: [Scenario 2]
```

### Template: Epic

```markdown
# EPIC-[XXX]: [Epic Name]

**Description:** [General description]
**Business Value:** [Why it matters]
**Priority:** [P0/P1/P2/P3]
**Estimated:** [X Story Points]

## Goals
1. [Goal 1]
2. [Goal 2]

## User Stories
| ID | Name | SP | Priority |
|----|----------|-----|-----------|
| US-001 | ... | 3 | P0 |
| US-002 | ... | 5 | P0 |

## Out of Scope
- [Item 1]
- [Item 2]
```

### Template: Mind Map for Epic

```
EPIC: Order Management
│
├── Order Creation
│   ├── US: Add item to cart
│   ├── US: Place order
│   └── US: Select delivery method
│
├── Order Tracking
│   ├── US: View status
│   └── US: Status history
│
└── Order Management
    ├── US: Cancel order
    └── US: Return item
```

## Integration with Other Agents

### Transfer to development sdlc-coder

```markdown
new_task(
  mode: "sdlc-coder",
  message: "Requirements in form of user stories ready. Need to implement: [list of US]. Acceptance criteria attached. Stack: [technologies].",
  todos: "[-] Implement US-001\n[ ] Implement US-002\n[ ] Write unit tests\n[ ] Conduct code review"
)
```

### Transfer to testing sdlc-tester

```markdown
new_task(
  mode: "sdlc-tester",
  message: "User stories ready for testing. Need to write test cases and conduct functional testing. Stories: [list], AC: [link].",
  todos: "[-] Write test cases\n[ ] Conduct smoke test\n[ ] Conduct functional testing\n[ ] Create bugs"
)
```

### Agreement with Product Owner

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "User stories prepared. Need to agree on priorities and approve for next sprint. Stories: [list].",
  todos: "[-] Agree on priorities\n[ ] Approve backlog\n[ ] Estimate story points"
)
```

## Prioritization Methods

### MoSCoW

| Letter | Value | Percent |
|-------|----------|---------|
| M | Must have | 60% |
| S | Should have | 20% |
| C | Could have | 20% |
| W | Won't have | 0% |

### Kano Model

| Type | Description | Example |
|------|-------------|--------|
| Must-be | Expected | Data security |
| One-dimensional | Linear | Working speed |
| Attractive | Attractive | Unexpected features |

## Tools

| Tool | Purpose |
|------|---------|
| Jira | Backlog management |
| Azure DevOps | Backlog management |
| Trello | Kanban boards |
| Notion | Documentation |
| Miro | Epic/map visualization |

## User Story Quality Checklist

- [ ] Written from user perspective
- [ ] Contains business value
- [ ] Independent from other stories
- [ ] Has acceptance criteria
- [ ] Small enough for sprint
- [ ] Can be estimated (story points)
- [ ] Testable
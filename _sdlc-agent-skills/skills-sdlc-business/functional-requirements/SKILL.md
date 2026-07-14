---
name: functional-requirements
description: Defining functional requirements. Use this skill for documenting functional requirements — what the system should do, what functions to provide.
---

# Functional Requirements

## When to Use

- When documenting system requirements
- For defining functions and capabilities
- When handing over requirements to developers
- For validation with stakeholders
- When creating specifications

## Core Concepts

**Functional Requirement** — is a description of a function that the system must perform. Answers the question "What does the system do?"

### Characteristics of Good Functional Requirements

| Characteristic | Description | Example |
|----------------|-------------|---------|
| **Complete** | Full description | "System sends email when status..." |
| **Consistent** | No conflicts | No conflicts with other requirements |
| **Feasibility** | Achievable | Technically possible |
| **Unambiguous** | Clear | No different interpretations |
| **Verifiable** | Testable | Can be tested |
| **Traceable** | Traceable | Linked to business goal |

## Functional Requirements Structure

### Requirements Levels

```
┌─────────────────────────────────────────────────────────────┐
│                   REQUIREMENTS LEVELS                       │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  Level 1: Business Requirements                            │
│  └─ "Reduce request processing time"                       │
│                                                              │
│  Level 2: User Requirements                                │
│  └─ "Manager should see all requests in one place"         │
│                                                              │
│  Level 3: Functional Requirements                         │
│  └─ "System displays list of requests with filters"        │
│                                                              │
│  Level 4: Technical Requirements                          │
│  └─ "API endpoint: GET /api/v1/requests"                   │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### FR Template

```markdown
# FR-[ID]: [Title]

**Version:** 1.0
**Status:** Draft/Approved
**Priority:** Must Have/Should Have/Could Have/Won't Have

## Description
[Clear description of the function]

## User Story
As a [type of user],
I want to [function],
so that [benefit/value].

## Functional Specification

### Inputs
- [Input 1]: Type, format, source

### Processing
1. Step 1: [Description]
2. Step 2: [Description]

### Outputs
- [Output 1]: Type, format, recipient

## Business Rules
- [Rule 1]
- [Rule 2]

## Validation Rules
- [Validation rule 1]
- [Validation rule 2]

## Error Handling
| Error Code | Condition | User Message | System Action |
|------------|-----------|--------------|---------------|
| ERR-001 | ... | "Error..." | Log + Notify |

## Acceptance Criteria
- [ ] Criterion 1 — verifiable
- [ ] Criterion 2

## Dependencies
- [Dependency 1]
- [Dependency 2]

## Traceability
- Linked to: [Business Requirement]
- Parent: [User Story]
```

## Functional Requirements Examples

### Example 1: Authentication

```markdown
# FR-001: User Authentication

**Priority:** Must Have

## Description
The system should allow users to authenticate using email and password.

## Functional Specification

### Inputs
- Email: string, valid email format
- Password: string, min 8 characters

### Processing
1. Validate required fields
2. Validate email format
3. Find user by email
4. Verify password (bcrypt)
5. Create JWT token

### Outputs
- JWT token: string, 24 hours validity
- User profile: object

## Validation Rules
- Email: required, valid format
- Password: required, min 8 chars

## Acceptance Criteria
- [ ] User can login with correct credentials
- [ ] User receives error with incorrect password
- [ ] JWT token valid for 24 hours
- [ ] Blocked user cannot login
```

### Example 2: Product Search

```markdown
# FR-002: Product Search

**Priority:** Must Have

## Description
The system should allow users to search for products by name, SKU, and description.

## Functional Specification

### Inputs
- Query: string, min 2 characters
- Filters (optional): category, price range, brand

### Processing
1. Validate query
2. Create search query (Elasticsearch)
3. Apply filters
4. Sort by relevance

### Outputs
- Results: array of products
- Total count: number
- Suggestions: array of strings

## Business Rules
- Min query length: 2 characters
- Max results per page: 50
- Search timeout: 2 seconds

## Acceptance Criteria
- [ ] Search works by name
- [ ] Search works by SKU
- [ ] Filters apply correctly
- [ ] Results sorted by relevance
- [ ] Empty state when no results
```

## Functional Requirements Categories

| Category | Description | Examples |
|----------|-------------|----------|
| **Data Management** | CRUD operations | Create, read, update, delete |
| **Business Logic** | Business rules | Discount calculation, validation |
| **Integration** | External systems | API, webhooks |
| **Reporting** | Reports and dashboards | Export, charts |
| **Security** | Security | Authentication, authorization |
| **Notification** | Notifications | Email, push, SMS |
| **Search** | Search | Full-text, filters |

## Templates

### Template: FR Registry

```markdown
# Functional Requirements Registry

**Project:** [Name]
**Version:** 1.0
**Date:** [Date]

## Requirements List

| ID | Name | Priority | Status | Owner |
|----|------|----------|--------|-------|
| FR-001 | Authentication | Must | Approved | BA |
| FR-002 | Product Search | Must | Approved | BA |
| FR-003 | Shopping Cart | Should | Draft | BA |

## Requirements by Feature

### Feature: Authorization
| ID | Requirement |
|----|-------------|
| FR-001 | Authentication |
| FR-002 | Registration |
| FR-003 | Password Reset |
```

### FR Matrix

```markdown
| FR ID | Description | Use Case | Test Case | Status |
|-------|------------|----------|-----------|--------|
| FR-001 | Authentication | UC-001 | TC-001 | Approved |
| FR-002 | Search | UC-002 | TC-002 | Draft |
```

## Integration with Other Agents

### Handover to Development

```markdown
new_task(
  mode: "sdlc-coder",
  message: "Functional requirements documented. Need to implement functions. FRs: [list].",
  todos: "[-] Implement FR-001\n[ ] Implement FR-002\n[ ] Write unit tests"
)
```

### For Testing

```markdown
new_task(
  mode: "sdlc-tester",
  message: "FRs ready. Need to write test cases. Acceptance criteria attached.",
  todos: "[-] Write TC for FR-001\n[ ] Write TC for FR-002\n[ ] Conduct functional testing"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Jira | Requirement management |
| Confluence | Documentation |
| Azure DevOps | Backlog management |
| Notion | FR registry |

## Functional Requirements Checklist

- [ ] Requirements linked to business goals
- [ ] Each requirement has an ID
- [ ] Priority defined
- [ ] Acceptance criteria present
- [ ] Business rules defined
- [ ] Clear input/output
- [ ] No conflicts
- [ ] Requirement is verifiable
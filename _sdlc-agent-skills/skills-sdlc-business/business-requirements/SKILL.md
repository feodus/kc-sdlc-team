---
name: business-requirements
description: Business requirements documentation. Use this skill when creating formal business requirements, BRD documents, and requirements for customer approval.
---

# Business Requirements Documentation

## When to Use

- After gathering requirements through interviews, workshops, surveys
- When creating BRD (Business Requirements Document)
- For formal requirements approval with the customer
- When handing over requirements to System Analyst for technical specification
- During requirements audit or review

## Core Concepts

**Business Requirement** is a statement about a business need that must be satisfied to achieve a business goal or solve a business problem.

### Requirements Levels

```
┌─────────────────────────────────────────┐
│         Organizational Goals            │  Level 0
│    (company strategic goals)            │
├─────────────────────────────────────────┤
│         Business Requirements           │  Level 1
│  (what business wants to achieve)      │
├─────────────────────────────────────────┤
│       Functional Requirements           │  Level 2
│    (what system must do)                │
├─────────────────────────────────────────┤
│          Non-Functional                 │  Level 3
│      (how system must work)             │
├─────────────────────────────────────────┤
│          Technical Requirements         │  Level 4
│      (how it will be implemented)       │
└─────────────────────────────────────────┘
```

## Business Requirements Document Structure

### 1. Executive Summary

```markdown
## Summary

**Project:** [Name]
**Customer:** [Organization/Role]
**Date:** [Date]
**Version:** [1.0]

### Project Goal
[Brief description — 2-3 sentences]

### Expected Outcomes
- [Outcome 1]
- [Outcome 2]

### Key Stakeholders
- [Stakeholder 1]
- [Stakeholder 2]
```

### 2. Business Context

```markdown
## Business Context

### Background
[Why the need arose]

### Business Problem or Opportunity
| Problem | Impact | Source |
|----------|---------|----------|
| Problem 1 | High | Sales department |
| ... | ... | ... |

### Business Goals
| Goal | KPI | Target Value |
|------|-----|-------------------|
| Reduce request processing time | Processing time | < 24 hours |
| ... | ... | ... |
```

### 3. Business Requirements

```markdown
## Business Requirements

### BR-001: [Brief name]
**Description:** [Full description of business need]
**Priority:** Must Have | Should Have | Could Have | Won't Have
**Source:** [Who provided]
**Related Goals:** [Business goal reference]

**Business Value:**
- [Value 1]
- [Value 2]

**Acceptance Criteria:**
- [Criteria 1]
- [Criteria 2]

### BR-002: [Brief name]
...
```

### 4. User Requirements

```markdown
## User Requirements

### UR-001: [Description]
**User Type:** [Role]
**Need:** [What user wants to do]
**Reason:** [Why it's needed]

### UR-002: [Description]
...
```

### 5. Business Rules

```markdown
## Business Rules

| ID | Rule | Description | Constraints |
|----|---------|----------|-------------|
| BR-001 | 10% Discount | Discount for order from 10000 rub | Does not combine with other promotions |
| ... | ... | ... | ... |
```

### 6. Dependencies

```markdown
## Dependencies

### Internal Dependencies
| Requirement | Depends on | Type |
|------------|------------|-----|
| BR-002 | BR-001 | mandatory |

### External Dependencies
| Dependency | Description | Owner |
|-------------|----------|----------------|
| CRM integration | API access required | IT team |
```

### 7. Constraints and Assumptions

```markdown
## Constraints and Assumptions

### Constraints
- Budget: no more than X rub
- Timeline: Q2 2026
- Technologies: existing stack

### Assumptions
- Users have internet access
- System will work 24/7
```

## Templates

### Template: Requirement

```markdown
# BR-[XXX]: [Requirement Name]

**Version:** 1.0
**Status:** Draft | Approved | Implemented
**Priority:** Must Have | Should Have | Could Have | Won't Have
**Author:** [Name]
**Date Created:** [Date]
**Last Changed:** [Date]

## Description
[Clear description of requirement — what, why, for whom]

## Business Value
| Value | Description | Metric |
|----------|----------|---------|
| Value 1 | ... | Metric |

## Acceptance Criteria
- [ ] Criteria 1 — defined and measurable
- [ ] Criteria 2

## Links
- **Business Goals:** [List]
- **Related Requirements:** [List]
- **Dependencies:** [List]

## Constraints
- [Constraint 1]
- [Constraint 2]

## Change History
| Version | Date | Author | Change |
|---------|------|-------|-----------|
| 1.0 | DD-MM-YYYY | Author | Initial version |
```

### Template: Traceability Matrix

```markdown
| ID | Requirement | Business Goal | Acceptance Criteria | Status |
|----|------------|-------------|------------------|--------|
| BR-001 | ... | Goal-001 | AC-001 | Draft |
| BR-002 | ... | Goal-001 | AC-002 | Approved |
```

## Examples

### Example 1: Business Requirement for Online Store

```markdown
# BR-001: Self-service Order Tracking

**Priority:** Must Have
**Source:** Customer Support Team

## Description
Customers should be able to independently track the status of their orders through their personal account on the website without contacting support.

## Business Value
- Reduced support load: 30% reduction in contacts expected
- Increased customer satisfaction (NPS)

## Acceptance Criteria
- [ ] Customer sees current order status
- [ ] Customer sees status change history
- [ ] Status updates within 15 minutes of change
- [ ] Information available 24/7
```

### Example 2: Business Rule

```markdown
| ID | Rule | Category | Description |
|----|---------|-----------|----------|
| BR-002 | 14-day return | Policy | Customer can return goods of proper quality within 14 days from receipt |
| BR-003 | Minimum order amount | Commerce | Minimum order amount — 500 rubles |
| BR-004 | Free delivery | Commerce | Free delivery for orders from 3000 rubles |
```

## Integration with Other Agents

### Transfer Requirements to System Analyst

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Business requirements ready. Need to convert to technical specifications. Document: [link]. Main requirements: [brief list].",
  todos: "[-] Analyze business requirements\n[ ] Create functional specifications\n[ ] Define non-functional requirements\n[ ] Design API"
)
```

### Request Technical Validation from DevOps

For infrastructure requirements assessment:

```markdown
new_task(
  mode: "sdlc-devops",
  message: "System requirements: [list]. Evaluate infrastructure requirements and constraints.",
  todos: "[-] Evaluate infrastructure requirements\n[ ] Propose architecture\n[ ] Evaluate cost"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Confluence | Storage and collaboration |
| Jira | Requirements + tracking |
| Azure DevOps | Requirements + work items |
| Notion | Documentation |
| Google Docs | Collaborative editing |

## Requirements Quality Checklist

- [ ] Requirement understandable to business customer
- [ ] Requirement has clear business value
- [ ] Requirement is measurable (has acceptance criteria)
- [ ] Requirement is feasible (verified with technical team)
- [ ] Requirement is consistent (no conflicts with others)
- [ ] Requirement traces to business goal
- [ ] Requirement is prioritized
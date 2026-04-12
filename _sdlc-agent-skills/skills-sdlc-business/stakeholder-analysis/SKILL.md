---
name: stakeholder-analysis
description: Stakeholder analysis and classification. Use this skill for identifying, classifying, and planning management of project stakeholders.
---

# Stakeholder Analysis

## When to Use

- At the beginning of the project to identify all interested parties
- When project scope changes
- For communication planning
- When resolving conflicts between parties
- To determine influence and interest of participants

## Core Concepts

**Stakeholder** is a person, group, or organization that can affect the project or be affected by the project.

### Types of Stakeholders

| Type | Description | Examples |
|------|-------------|---------|
| **Internal** | Within organization | Management, employees, shareholders |
| **External** | Outside organization | Customers, partners, regulators |
| **Direct** | Directly related to project | Project team |
| **Indirect** | Indirectly related | End users |

## Analysis Methods

### 1. Stakeholder Register

```markdown
# Stakeholder Register

**Project:** [Name]
**Date:** [Date]
**BA:** [Name]

## Interested Parties

| ID | Name | Role | Organization | Type | Contact |
|----|-----|------|-------------|-----|---------|
| ST-001 | Ivan Petrov | CEO | Company A | Internal | ip@company.ru |
| ST-002 | Anna Sidorova | Product Owner | Company A | Internal | as@company.ru |
| ST-003 | Customers | End users | B2B | External | - |
```

### 2. Power/Interest Grid

```
                    High Interest
                         │
     Keep Satisfied       │      Manage Closely
     (Keep Satisfied)      │      (Manage Closely)
          │               │            │
          │               │            │
──────────┼───────────────┼────────────┼────────────
          │               │            │
          │               │            │
     Monitor              │      Keep Informed
     (Monitor)            │      (Keep Informed)
                         │
                    Low Interest
                         │
               Low Influence ──────────── High Influence
```

**Examples:**

| Quadrant | Actions | Example |
|----------|---------|---------|
| **Manage Closely** | Frequent communications, involvement | CEO, Key User |
| **Keep Satisfied** | Regular updates, satisfying needs | Finance, Legal |
| **Keep Informed** | Informing about progress | End users |
| **Monitor** | Minimal communications | External regulators |

### 3. Stakeholder Mapping Matrix

```markdown
| Stakeholder | Interest | Power | Attitude | Strategy | Engagement |
|-------------|-----------|-------|----------|----------|-------------|
| Ivan P.     | High     | High  | Support  | Manage   | Weekly      |
| Anna S.     | High     | Medium| Neutral  | Keep Sat | Bi-weekly   |
| Customers   | High     | Low   | Unknown  | Monitor  | Monthly     |
```

### 4. RACI for Stakeholders

```markdown
| Activity           | Ivan P. | Anna S. | IT team | Customers |
|--------------------|---------|---------|---------|----------|
| Requirements approval| A       | R       | C       | I         |
| Testing            | I       | C       | R       | A         |
| Implementation     | A       | I       | R       | C         |
```

## Templates

### Template: Stakeholder Profile

```markdown
# Stakeholder Profile: [Name/Role]

**ID:** ST-XXX
**Date:** [Date]

## Basic Information
| Field | Value |
|------|-----------|
| Name | [Name] |
| Role | [Role in project] |
| Organization | [Organization] |
| Influence Level | High/Medium/Low |
| Interest Level | High/Medium/Low |

## Expectations and Concerns
### Expectations
- [Expectation 1]
- [Expectation 2]

### Concerns
- [Concern 1]
- [Concern 2]

## Communication Style
- Preferred format: [Meetings/Email/Calls]
- Communication frequency: [Weekly]
- Key topics: [List]

## Interaction History
| Date | Event | Result |
|------|---------|-----------|
| DD-MM | Meeting | Agreed |
```

### Template: Stakeholder Management Plan

```markdown
# Stakeholder Management Plan

**Project:** [Name]
**Date:** [Date]

## Strategy by Groups

### High Power + High Interest (Manage Closely)
| Stakeholder | Frequency | Channel | Owner |
|-------------|---------|-------|---------------|
| Ivan P. | Weekly | Meeting | PM |
| Anna S. | 2x per week | Slack | BA |

### High Power + Low Interest (Keep Satisfied)
| Stakeholder | Frequency | Channel | Owner |
|-------------|---------|-------|---------------|
| Finance | Monthly | Email | PM |

### Low Power + High Interest (Keep Informed)
| Stakeholder | Frequency | Channel | Owner |
|-------------|---------|-------|---------------|
| End users | Monthly | Email | PO |

## Communication Matrix
| Message | Audience | Frequency | Channel | Owner |
|---------|-----------|---------|-------|---------------|
| Project status | All stakeholders | Weekly | Email | PM |
| Requirements | Development team | Daily | Jira | BA |
```

## Methods for Gathering Stakeholder Information

### Data Sources

| Method | Description |
|--------|-------------|
| Interviews | Direct contact with potential stakeholders |
| Surveys | Questionnaires to gather information |
| Document analysis | Organizational structure, job descriptions |
| Observation | How existing processes work |
| Working groups | Joint work with representatives |

## Integration with Other Agents

### For coordination with Project Manager

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Stakeholder analysis completed. Need to agree on communication plan and include key stakeholders in project. List: [list].",
  todos: "[-] Agree on communication plan\n[ ] Add to project\n[ ] Define roles"
)
```

### For interaction with System Analyst

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Key stakeholders defined. Need to agree on technical requirements. Contacts: [list with priorities].",
  todos: "[-] Conduct session with technical stakeholders\n[ ] Gather technical requirements\n[ ] Validate architecture"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Jira | Stakeholder tracking |
| Confluence | Documentation |
| Miro | Visual matrix |
| Smartsheet | Stakeholder management |
| Notion | Stakeholder database |

## Stakeholder Analysis Checklist

- [ ] All internal stakeholders identified
- [ ] All external stakeholders identified
- [ ] Influence and interest levels defined
- [ ] Stakeholder register completed
- [ ] Strategy defined for each group
- [ ] Communication plan created
- [ ] Owners assigned for communications
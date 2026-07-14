---
name: requirements-elicitation
description: Business requirements gathering methods. Use this skill when conducting interviews, surveys, workshops, and other techniques for identifying stakeholder needs.
---

# Requirements Elicitation

## When to Use

- At the beginning of a new project or initiative
- When it's necessary to identify user and business needs
- When conducting stakeholder interviews
- When organizing workshops and requirements gathering sessions
- When documenting existing processes

## Core Concepts

**Requirements Elicitation** is the process of discovering, extracting, and defining system requirements from various sources (users, customers, regulators, etc.).

### Requirements Sources

| Source | Description | Elicitation Methods |
|----------|-------------|--------------|
| Customer (Business) | Business goals, expected value | Interviews, documents |
| End Users | How they perform tasks | Observation, interviews, UX research |
| Regulatory/Compliance | Regulatory requirements | Document analysis, consultations |
| Technical Team | Constraints and capabilities | Technical discussions |
| Competitors | Best practices | Marketing analysis |

## Methods and Techniques

### 1. Interviews

**Interview Structure:**

```
1. Preparation
   - Define goals and questions
   - Select respondents
   - Prepare materials

2. Conducting
   - Establish contact
   - Ask open questions
   - Listen actively
   - Document

3. Analysis
   - Transcribe
   - Identify key requirements
   - Verify understanding
```

**Question Types:**

- **Open:** "Describe how you currently process orders?"
- **Closed:** "Do you use an ERP system?"
- **Probing:** "What exactly happens after the customer places an order?"
- **Problem:** "What problem would you like to solve?"

### 2. Surveys

**Recommended Tools:**

- Google Forms
- Microsoft Forms
- SurveyMonkey
- Typeform

**Survey Structure:**

```
1. Introduction (survey goal, ~2 min)
2. Demographic questions
3. Main questions (5-10)
4. Likert scales (agree/disagree)
5. Open questions (2-3)
6. Thank you
```

### 3. Workshops

**Format:**

```
Duration: 2-4 hours
Participants: 5-12 people
Roles: Facilitator, Secretary, Participants

Stages:
1. Introduction and goals (15 min)
2. Brainstorming (30 min)
3. Grouping and prioritization (30 min)
4. Requirements detailing (60 min)
5. Agreement and next steps (15 min)
```

### 4. Observation

- **Direct observation:** Observer present during process execution
- **Partner observation:** Work together with user
- **"Mouse race" observation:** Observe from distance

### 5. Document Analysis

- Business documents, reports
- Existing systems and their documentation
- Regulatory documents
- Templates and forms

## Templates

### Template: Interview Plan

```markdown
# Interview Plan: [Topic]

**Date:** [Date]
**Respondent:** [Name, Role]
**Interviewer:** [Name]
**Duration:** [Time]

## Interview Goals
1. [Goal 1]
2. [Goal 2]

## Main Questions

### Block 1: [Topic]
- Question 1: ...
- Question 2: ...

### Block 2: [Topic]
- Question 1: ...

## Backup Questions
- Question in case there's time left

## Expected Outcomes
- [Outcome 1]
- [Outcome 2]

## Next Steps
- [Step 1]
- [Step 2]
```

### Template: Workshop Session

```markdown
# Workshop: [Name]

**Date:** [Date]
**Location:** [Location]
**Facilitator:** [Name]
**Secretary:** [Name]

## Participants
| Name | Role | Organization |
|-----|------|--------------|
| ... | ... | ... |

## Agenda
| Time | Topic | Owner |
|-------|------|----------------|
| 10:00 | Introduction | Facilitator |
| 10:15 | ... | ... |

## Results
### Identified Requirements
1. ...

### Resolved Questions
1. ...

### Open Questions
1. ...

## Next Steps
| Task | Owner | Deadline |
|------|---------------|------|
| ... | ... | ... |
```

## Integration with Other Agents

### Transfer Requirements to System Analyst

After gathering requirements, transfer results to `sdlc-system-analyst`:

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Convert gathered business requirements to technical specifications. Business requirements: [brief description]. Main stakeholders: [list]. Priorities: [priority list].",
  todos: "[-] Analyze business requirements\n[ ] Create functional specifications\n[ ] Define non-functional requirements\n[ ] Document API needs"
)
```

### Coordination with Project Manager

For resource planning:

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Requirements gathered. Need to estimate effort and include in project plan. Requirements: [document link].",
  todos: "[-] Estimate requirements\n[ ] Add to plan\n[ ] Define resources"
)
```

## Tools

| Tool | Purpose | Free |
|------|------------|-----------|
| Miro | Visual workshops | Limited |
| FigJam | Collaboration | Limited |
| Confluence | Documentation | Limited |
| Notion | Documentation | Limited |
| Google Drive | Materials storage | Yes |

## Best Practices

1. **Combine methods** — one method doesn't give complete picture
2. **Document sources** — who provided each requirement
3. **Verify understanding** — paraphrase and validate
4. **Prioritize** — not all requirements are equally important
5. **Validate with stakeholders** — confirm interpretations
6. **Understand context** — know business context

## Common Mistakes

| Mistake | How to Avoid |
|---------|---------------|
| Gathering all requirements at once | Use iterative approach |
| Insufficient stakeholder engagement | Define all stakeholders early |
| Incorrect interpretation | Always verify understanding |
| No priorities | Use prioritization methods |
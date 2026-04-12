---
name: stakeholder-interviews
description: Conducting stakeholder interviews. Use this skill for preparing, conducting, and documenting interviews with stakeholders.
---

# Conducting Stakeholder Interviews

## When to Use

- When gathering business requirements
- For identifying user needs
- When exploring current processes
- For resolving conflicts between stakeholders
- During discovery phase of a new project

## Core Concepts

**Stakeholder Interview** is a structured conversation with an interested party to gather information about needs, expectations, problems, and suggestions.

### Interview Types

| Type | Purpose | Duration |
|-----|---------|----------|
| **Exploratory** | Exploring new area | 60-90 min |
| **Fact-finding** | Gathering facts about processes | 45-60 min |
| **Problem-solving** | Understanding the problem | 30-45 min |
| **Validation** | Testing hypotheses | 30 min |

## Interview Preparation

### Step 1: Context Research

```
Before the interview:
1. Study the organization
2. Review existing documentation
3. Understand the respondent's role
4. Prepare list of questions
5. Agree on time and format
```

### Step 2: Question Preparation

**Question Types:**

| Type | Description | Example |
|-----|-------------|---------|
| Open | Get detailed answer | "Tell me about your work..." |
| Closed | Yes/No, specific data | "Do you use system X?" |
| Clarifying | Understand deeper | "What exactly happens after...?" |
| Problem | Identify difficulties | "What problem do you want to solve?" |
| Hypothetical | Propose scenarios | "What would you do if...?" |

**Question Structure:**

```
1. Warming (5 min)
   - Introduction, creating comfortable atmosphere
   - "How are you? Tell me about your role..."

2. Main (30-45 min)
   - Main questions on topic
   - Open → Clarifying

3. Problem exploration (10-15 min)
   - Identifying problems and pain points
   - "What concerns you about the current process?"

4. Solution exploration (10-15 min)
   - Ideas and suggestions
   - "How would you like to solve this problem?"

5. Closing (5 min)
   - Summarizing
   - "Is there anything important we didn't discuss?"
   - Next steps
```

## Conducting the Interview

### Active Listening Techniques

```
✓ Nod and maintain eye contact
✓ Paraphrase ("So what I'm hearing is...")
✓ Ask clarifying questions
✓ Take notes (with permission)
✓ Watch for non-verbal cues

✗ Interrupt
✗ Give advice too early
✗ Make assumptions
✗ Rush
```

### Documentation

**Notes Format:**

```markdown
# Interview: [Date]

**Respondent:** [Name, Role]
**Interviewer:** [Name]
**Duration:** [60 min]

## Key Topics

### Topic 1: [Name]
- [Quote or observation]
- [Comment]
- [Requirement/Need]

### Topic 2: [Name]
...

## Identified Requirements
| Requirement | Category | Priority |
|-------------|----------|----------|
| Requirement 1 | Functional | High |
| Requirement 2 | Non-functional | Medium |

## Problems
| Problem | Impact | Solution |
|---------|--------|----------|
| Problem 1 | High | Proposal |

## Next Steps
- [ ] Prepare summary for respondent
- [ ] Verify understanding
- [ ] Schedule follow-up
```

## Sample Questions

### Business Context

```
1. Tell me about your role in the organization?
2. What business goals are you pursuing?
3. How do you measure success in your work?
4. Who are your main clients/partners?
```

### Current Processes

```
5. Describe a typical workday?
6. What tools do you use?
7. Where do main delays occur?
8. What takes the most time?
```

### Problems and Pain

```
9. What problem do you want to solve?
10. How often does this happen?
11. Who else is affected by this problem?
12. What are the current consequences?
```

### Expectations and Solutions

```
13. What should change?
14. How will you know the problem is solved?
15. What constraints need to be considered?
16. What would be the ideal solution?
```

## Templates

### Template: Interview Plan

```markdown
# Interview Plan

**Topic:** [Interview Topic]
**Respondent:** [Name, Role]
**Date/Time:** [Date, Time]
**Format:** [In-person/Zoom/Phone]
**Duration:** [60 min]

## Interview Goals
1. [Goal 1]
2. [Goal 2]
3. [Goal 3]

## Context
[Brief information about the project and why this interview is important]

## Questions

### Block 1: Role and Context (5 min)
- Question 1: ...
- Question 2: ...

### Block 2: [Topic] (20 min)
- Question 1: ...
- Question 2: ...
...

## Expected Outcomes
- [Outcome 1]
- [Outcome 2]

## Preparation
- [ ] Study materials about respondent
- [ ] Agree on time
- [ ] Prepare questions
- [ ] Set up recording (with permission)
```

### Template: Interview Summary

```markdown
# Interview Summary

**Date:** [Date]
**Respondent:** [Name]
**Topic:** [Topic]

## Summary
[2-3 paragraphs with main findings]

## Key Requirements
1. **Requirement 1** — [Description]
   - Category: [Functional/Non-functional]
   - Priority: [High/Medium/Low]
   - Source: Respondent

2. **Requirement 2** — [Description]
   ...

## Problems and Pain
| Problem | Frequency | Impact |
|---------|-----------|--------|
| Problem 1 | Daily | High |

## Business Value
- [Value 1]
- [Value 2]

## Next Steps
| Task | Responsible | Deadline |
|------|-------------|----------|
| ... | ... | ... |

## Confirmed by Respondent
- [ ] Yes, [Date]
- [ ] No, needs clarification
```

## Integration with Other Agents

### After Interview — Requirements Transfer

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "Stakeholder interviews completed. The following requirements were gathered: [brief list]. Need to convert to technical specifications.",
  todos: "[-] Analyze requirements\n[ ] Create functional specifications\n[ ] Define non-functional requirements"
)
```

### Coordination with Project Manager

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Interviews completed. Key stakeholders and their needs identified. Need to update project plan.",
  todos: "[-] Update plan\n[ ] Agree on budget\n[ ] Define priorities"
)
```

## Best Practices

| Practice | Description |
|----------|-------------|
| Preparation | Always prepare in advance |
| Recording | Record (with consent) for accuracy |
| Paraphrasing | Verify understanding |
| Follow-up | Send summary after interview |
| Triangulation | Conduct multiple interviews for confirmation |
| Empathy | Listen, don't sell |

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Too many questions | Focus on 3-5 key ones |
| Monologue | Listen 80%, talk 20% |
| Not recording | Record (with consent) |
| Making promises | Focus on gathering information |
| Not verifying understanding | Paraphrase and clarify |
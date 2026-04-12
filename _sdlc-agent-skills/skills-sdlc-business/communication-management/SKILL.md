---
name: communication-management
description: Stakeholder communication management. Use this skill for planning and managing communications throughout the project.
---

# Communication Management

## When to Use

- When planning a project
- To ensure effective communication
- When stakeholder composition changes
- To manage expectations
- When resolving communication problems
- At all project phases

## Core Concepts

**Communication Management** is the process of planning, creating, distributing, and managing communications between project stakeholders.

### Communication Model

```
Source → Encoding → Message → Channel → Decoding → Receiver
                     ↑                              ↓
                    Noise ←─────────────────────── Feedback
```

### Communication Types

| Type | Description | Channel | Frequency |
|------|-------------|---------|-----------|
| **Formal** | Official documents | Email, Meetings | As needed |
| **Informal** | Informal communication | Chat, Calls | As needed |
| **Vertical** | Hierarchical communication | Reports | Regularly |
| **Horizontal** | Between peers | Meetings | Regularly |
| **External** | With external parties | Press, Website | As planned |
| **Internal** | Within team | Standups, Email | Daily |

## Communication Planning

### Communication Matrix

```markdown
# Communication Matrix

**Project:** [Name]
**Date:** [Date]

| Message | Audience | Frequency | Channel | Format | Owner |
|---------|-----------|---------|-------|--------|---------------|
| Project status | All stakeholders | Weekly | Email | PDF report | PM |
| Requirements update | Development team | Daily | Jira | User Stories | BA |
| Technical update | IT team | Daily | Slack | Text | Tech Lead |
| Business update | Business stakeholders | Monthly | Meeting | Presentation | PO |
| Risks and issues | PM, Leadership | As needed | Email/Call | Text | BA |
```

### Communication Plan Template

```markdown
# Communication Plan

**Project:** [Name]
**Version:** 1.0
**Date:** [Date]

## Communication Objectives
1. Keep stakeholders informed
2. Gather feedback
3. Manage expectations

## Principles
- Transparency
- Regularity
- Relevance
- Audience-appropriate

## Communication Channels

| Channel | Purpose | Advantages | Limitations |
|---------|------------|-------------|-------------|
| Email | Official messages | Documented | Slow |
| Zoom/Meet | Meetings | Personal interaction | Time-consuming |
| Slack | Quick communication | Fast | Not for important decisions |
| Jira | Task management | Structured | Limited audience |
| Confluence | Documentation | Centralized | Requires maintenance |

## Regular Communications

### Weekly Status Report
- **To:** All stakeholders
- **When:** Friday, 17:00
- **Format:** Email with attachment
- **Content:**
  - Achievements for the week
  - Plan for next week
  - Risks and issues
  - Metrics

### Monthly Executive Summary
- **To:** Leadership
- **When:** First working day of month
- **Format:** Presentation + PDF
- **Content:**
  - Project status (RAG)
  - Budget burn
  - Key milestones
  - Risks

### Daily Standup
- **To:** Development team
- **When:** Daily, 10:00
- **Format:** 15-minute call
- **Content:**
  - What was done
  - What's planned
  - Blockers
```

## Managing Communication Channels

### Channel 1: Email

```
Best practices:
✓ Subject: Clear and descriptive
✓ Structure: Short paragraphs, bullet points
✓ Call to action: What is expected from recipient
✓ Time: Tuesday-Thursday morning is best
✓ Copies: Only necessary ones

Avoid:
✗ Long emails without structure
✗ Unnecessary many recipients
✗ Emotional emails
✗ CC "just for info"
```

### Channel 2: Meetings

```
Meeting types:
| Type | Frequency | Duration | Participants | Format |
|-----|---------|-------|-----------|--------|
| Standup | Daily | 15 min | Team | Sync |
| Planning | Sprint | 60 min | Team + PO | Sync |
| Review | Sprint | 60 min | Everyone | Sync/Async |
| 1:1 | Weekly | 30 min | Manager | Sync |
| Status | Monthly | 60 min | Stakeholders | Sync |
```

### Channel 3: Instant Messaging (Slack/Teams)

```
Rules:
✓ Use channels instead of DM for work questions
✓ Use reactions for acknowledgment
✓ Use threads for discussions
✓ DND outside work hours (if not urgent)

Project channels:
#project-name — main
#project-name-random — informal
#project-name-alerts — notifications
```

## Managing Expectations

### Methods

| Method | Description | When to Use |
|--------|-------------|-------------|
| Early notification | Report problems immediately | Always |
| Transparency | Open about status | Always |
| Realistic deadlines | Don't promise impossible | When planning |
| Regular updates | Frequent status updates | Always |
| Feedback | Listen to stakeholders | Periodically |

### Handling Difficult Situations

```
Situation: Schedule delay
Actions:
1. Determine actual delay
2. Notify as early as possible
3. Offer solution options
4. Update plan
5. Conduct meeting with stakeholders

Situation: Conflict between stakeholders
Actions:
1. Listen to both sides
2. Find common goal
3. Propose compromise
4. Escalate if necessary

Situation: Scope creep
Actions:
1. Document new requirements
2. Explain impact on schedule/budget
3. Propose prioritization
4. Get PM approval
```

## Templates

### Template: Status Report

```markdown
# Weekly Status Report

**Project:** [Name]
**Week:** [N]
**Date:** [Date]
**From:** [Name]

## Project Status
- **RAG Status:** 🟢/🟡/🔴
- **Overall:** [Description]

## Weekly Achievements
| Achievement | Status |
|------------|--------|
| [Achievement 1] | ✅ Done |
| [Achievement 2] | 🔄 In Progress |

## Plan for Next Week
| Task | Owner | Deadline |
|------|---------------|------|
| [Task 1] | [Name] | [Date] |
| [Task 2] | [Name] | [Date] |

## Risks and Issues
| Risk/Issue | Impact | Probability | Mitigation |
|------------|---------|-------------|------------|
| [Risk 1] | High | Medium | [Action] |

## Metrics
| Metric | Value | Trend |
|---------|----------|-------|
| Velocity | 25 SP | ↑ |
| Bug count | 5 | ↓ |

## Next Steps
- [ ] [Step 1]
- [ ] [Step 2]
```

### Template: Meeting Invite

```markdown
# Meeting: [Topic]

**Date:** [Date]
**Time:** [Time]
**Duration:** [N min]
**Location:** [Location/Link]

## Agenda
| # | Topic | Time | Owner |
|---|------|-------|---------------|
| 1 | [Topic 1] | 10 min | [Name] |
| 2 | [Topic 2] | 10 min | [Name] |

## Participants
- [Participant 1]
- [Participant 2]

## Preparation
- [ ] Material 1
- [ ] Material 2

## Expected Decisions
- [Decision 1]
- [Decision 2]

## Notes
[Filled during meeting]

## Action Items
| Task | Owner | Deadline |
|------|---------------|------|
| ... | ... | ... |
```

## Integration with Other Agents

### Coordination with Project Manager

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Need to agree on project communication plan. Proposed structure: [description].",
  todos: "[-] Agree on frequency\n[ ] Define channels\n[ ] Approve templates"
)
```

### For Status Update

```markdown
new_task(
  mode: "sdlc-project-manager",
  message: "Status report prepared. Need approval before sending to stakeholders. Report: [link].",
  todos: "[-] Verify data\n[ ] Approve\n[ ] Send"
)
```

## Tools

| Tool | Purpose |
|------|---------|
| Slack/Teams | Quick communication |
| Email | Official communications |
| Confluence | Documentation and knowledge base |
| Jira | Task tracking |
| Miro/Mural | Virtual meetings |
| Zoom/Meet | Video conferences |

## Communication Management Checklist

- [ ] Target audiences defined
- [ ] Channels selected for each audience
- [ ] Communication frequency established
- [ ] Templates created (report, meeting)
- [ ] Owners assigned
- [ ] Escalation paths defined
- [ ] Plan regularly reviewed
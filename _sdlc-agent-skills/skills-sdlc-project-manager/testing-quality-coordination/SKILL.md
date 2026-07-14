---
name: testing-quality-coordination
description: Testing coordination and quality assurance. Use for planning testing, coordinating UAT, defect management, and defining release readiness criteria.
---

# Testing Quality Coordination

> **Meta:** v2.0.0 | 09-03-2026
> **Merged from:** testing-coordination + uat-coordination

## Purpose

Comprehensive skill for organizing the testing process and ensuring software product quality. Includes test planning, UAT coordination, defect management, and defining release readiness criteria. Ensures effective interaction between development, testing, and business users.

## When to Use

Use this skill:
- When planning the testing phase of a project
- When coordinating the testing team
- When preparing and conducting UAT
- When managing the defect discovery and fixing process
- When determining product readiness for release
- When collecting and analyzing user feedback

## Functions

### 1. Test Planning

Coordinating test planning:
- Defining testing levels
- Planning testing types
- Setting testing deadlines
- Allocating resources for testing
- Defining test start criteria
- Defining acceptance criteria

### 2. Test Environment Preparation

Preparing the test environment:
- Coordinating environment setup
- Ensuring access to environments
- Maintaining data relevance
- Ensuring environment isolation
- Planning environment updates

### 3. UAT Coordination

Coordinating acceptance testing:
- Defining UAT participants
- Planning timeframes
- Preparing test scenarios
- Defining success criteria
- Planning user support

### 4. Defect Management

Managing defect tracking:
- Setting up registration process
- Defect classification and prioritization
- Tracking fix status
- Defect trend analysis
- Managing fix SLAs

### 5. Release Criteria Definition

Defining release readiness criteria:
- Defining quality thresholds
- Setting test pass criteria
- Verifying requirements compliance
- Assessing risks of remaining defects
- Approving release readiness

### 6. User Training and Feedback Collection

User preparation and feedback handling:
- Preparing training materials
- Conducting training
- Preparing user documentation
- Organizing support sessions
- Creating feedback channels

## Integration with System Analyst

- Considering non-functional requirements in test planning
- Using scenarios from System Analyst for testing
- Verifying requirements compliance
- Involving System Analyst in defect analysis
- Updating requirements based on test results

## Usage Examples

### Example 1: Web Application Testing Coordination

Testing types:
- Unit tests: 100% coverage of critical paths
- Integration tests: external API integration verification
- E2E tests: key user scenarios
- Load testing: up to 1000 concurrent users
- Security: OWASP Top 10 vulnerability check

Environments:
- Development: for developers
- Staging: for integration testing
- Pre-production: for acceptance testing
- Production: for UAT and load testing

Release criteria:
- 0 critical and 0 high defects
- 95% successful automated tests
- Response time no more than 2 seconds under load
- At least 90% test cases passed

### Example 2: Defect Management in Project

Process:
- Registration: through JIRA
- Classification: by type and priority
- Assignment: to responsible developers
- SLA: critical - 24 hours, high - 3 days, medium - 1 week
- Statuses: Open → In Progress → Resolved → Closed

Tracking:
- Daily defect status reviews
- Weekly trend reports
- Metrics: defect density, fix time
- Retrospectives: defect cause analysis

### Example 3: UAT Planning

UAT planning:
- Participants: key users and business analysts
- Scenarios: based on user stories
- Infrastructure: pre-production environment
- Duration: 2 weeks
- Success criteria: 95% of scenarios completed successfully

Coordination:
- Test data preparation
- User training on testing process
- Feedback collection and analysis
- Iterative product improvement
- Readiness conclusion preparation

### Example 4: Release Readiness Criteria

Readiness checklist:
- [ ] All critical scenarios work correctly
- [ ] User requirements met
- [ ] Performance meets SLA
- [ ] Security meets standards
- [ ] Documentation provided

Approvers:
- Product Owner: business functionality
- Security Officer: security aspects
- Compliance Manager: regulatory compliance
- Key users: usability

Decision:
- Conditions: no more than 5 unresolved high-priority comments
- Time: 3 days for decision
- Process: electronic approval with comments

## Related Skills

- [`quality-assurance`](quality-assurance/SKILL.md) — quality assurance and metrics
- [`development-tracking`](development-tracking/SKILL.md) — progress tracking
- [`project-metrics`](project-metrics/SKILL.md) — project metrics
- [`stakeholder-reporting`](stakeholder-reporting/SKILL.md) — stakeholder reporting

---

*Part of Project Manager SDLC Skills — Phase 5: Testing*
*Merged: testing-coordination + uat-coordination (v2.0, 09-03-2026)*
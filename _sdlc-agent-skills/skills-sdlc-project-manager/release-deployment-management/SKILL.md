---
name: release-deployment-management
description: Release and deployment management. Use for planning and coordinating releases, managing deployment, defining rollback procedures, and version control.
---

# Release Deployment Management

> **Meta:** v2.0.0 | 09-03-2026
> **Merged from:** deployment-planning + release-management

## Purpose

Comprehensive skill for effective release and deployment management of software products. Includes deployment strategy planning, version control, rollback procedure coordination, and ensuring smooth transition from development to production. Minimizes deployment risks and downtime.

## When to Use

Use this skill:
- When planning deployment strategy
- When coordinating release cycle
- When managing update rollout process
- When defining rollback procedures
- When controlling product versions
- When managing release kanban or backlog
- When coordinating multiple development teams

## Deployment Strategies

### 1. Blue-Green Deployment

Parallel deployment:
- Two identical environments (blue — current, green — new)
- Fast switching between versions
- Instant rollback on problems
- Requires double resources

### 2. Canary Release

Gradual deployment:
- Start with small percentage of users
- Gradual increase of share
- Early problem detection
- Requires good monitoring

### 3. Rolling Deployment

Phased deployment:
- Sequential component updates
- Minimal resource usage
- Longer process
- More complex rollback

### 4. Feature Flags

Feature management:
- Enable/disable without deploy
- A/B testing in production
- Fast disabling of problematic features
- Requires infrastructure

### 5. Immutable Infrastructure

Immutable infrastructure:
- Complete environment replacement on deploy
- Reproducibility
- Initial setup complexity
- Great for containers/K8s

## Functions

### 1. Deployment Planning

Developing strategy and plan:
- Selecting deployment strategy
- Defining deployment environments
- Planning deployment sequence
- Risk assessment and mitigation
- Defining deployment time window
- Stakeholder communication

### 2. Version Control

Product version control:
- Semantic versioning (semver)
- Version naming convention
- Changelog management
- Release branches strategy
- Tagging and versioning in CI/CD

### 3. Environment Preparation

Preparing for deployment:
- Production/staging environment setup
- Environment configuration
- Data preparation
- Backup
- Environment requirements verification

### 4. Deployment Coordination

Managing rollout process:
- Cross-team coordination
- Scheduled maintenance windows
- Multi-stage deployment
- Process monitoring
- Status communication

### 5. Rollback Procedures

Planning and executing rollback:
- Clear criteria for rollback
- Step-by-step instructions
- Automated rollback
- Rollback execution time (MTTR)
- Post-rollback analysis

### 6. Release Management

Release cycle management:
- Release planning
- Release scheduling
- Release coordination
- Release communication
- Release sign-off
- Post-release monitoring

### 7. Post-Deployment Validation

Post-deployment verification:
- Smoke tests in production
- Metrics monitoring
- Integration verification
- User acceptance verification
- Rollback if necessary

## Integration with Other Skills

- [`testing-quality-coordination`](testing-quality-coordination/SKILL.md) — pre-release validation
- [`project-metrics`](project-metrics/SKILL.md) — release metrics
- [`stakeholder-reporting`](stakeholder-reporting/SKILL.md) — release reporting

## Usage Examples

### Example 1: Web Application Release with Blue-Green

Deployment plan:
1. **Preparation:** Apply changes to green environment
2. **Pre-deployment:** Smoke tests, backup database
3. **Deployment:** Switch traffic (load balancer)
4. **Validation:** Check main user flows (5 minutes)
5. **Success:** Leave green as active, blue becomes standby
6. **Failure:** Switch back to blue, investigate

Execution time: 15-30 minutes
Rollback time: < 5 minutes

### Example 2: Canary Release for Mobile Application

Strategy:
- 1% users: v1.1
- 10% users: v1.1 (after 24h)
- 50% users: v1.1 (after 48h)
- 100% users: v1.1 (after 72h)

Promotion criteria:
- Crash rate < 0.1%
- API error rate < 1%
- User reports < 5
- Performance metrics normal

Rollback: Disable feature flag, push hotfix

### Example 3: Kubernetes Deployment

Deployment strategy: RollingUpdate
- maxSurge: 1 (additional pod)
- maxUnavailable: 0 (no unavailable pods)

Process:
1. Image built and pushed to registry
2. Deployment manifest updated
3. kubectl apply -f deployment.yaml
4. Kubernetes rolling update
5. Health checks on each pod
6. Post-deployment checks

### Example 4: Release Calendar Management

Release calendar:
- Minor releases: monthly (second Tuesday)
- Patch releases: as needed (critical bugs)
- Major releases: quarterly

Release criteria:
- All tests passing
- QA sign-off
- Security review passed
- Documentation updated
- Stakeholder approval

## Release Metrics

### Deployment Metrics

| Metric | Description | Target |
|--------|-------------|--------|
| Deployment Frequency | Release frequency | > 1/week |
| Lead Time for Changes | Time from commit to production | < 1 day |
| Mean Time to Recovery (MTTR) | Recovery time | < 1 hour |
| Change Failure Rate | % of failed releases | < 5% |

### Release Quality Metrics

- Post-deployment bugs
- Rollback frequency
- Hotfix frequency
- Production incidents
- User satisfaction

## Pre-release Checklist

- [ ] All tests passed
- [ ] QA gave sign-off
- [ ] Security review passed
- [ ] Documentation updated
- [ ] Changelog prepared
- [ ] Rollback plan ready
- [ ] Stakeholders notified
- [ ] Monitoring configured
- [ ] Support team prepared
- [ ] Communication plan ready

## Common Mistakes

1. **Insufficient testing** — bugs in production
2. **Poor rollback planning** — long downtime
3. **No monitoring** — unnoticed problems
4. **Insufficient communication** — unhappy stakeholders
5. **Skipping documentation** — support issues

---

*Part of Project Manager SDLC Skills — Phase 6: Deployment*
*Merged: deployment-planning + release-management (v2.0, 09-03-2026)*
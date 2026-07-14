---
name: rollback-procedures
description: Rollback and recovery. Use for defining rollback strategies, automating rollbacks, and incident recovery across blue-green, canary, and rolling update deployments.
---

# Rollback Procedures

> **Meta:** v1.0.0 | 06-07-2026

## Purpose

Skill for designing and operating rollback and recovery procedures. Covers rollback triggers, strategy selection, automation levels, verification, and post-incident review.

## When to Use

Use this skill:
- When defining rollback strategy for a release
- When automating rollback in CI/CD
- When recovering from failed deployments
- When designing runbooks for incident response
- When setting up health-based rollback gates
- When validating rollback time objectives

## Rollback Strategies

### 1. Blue-Green Rollback

```yaml
# Switch traffic back to previous stable version
# Strategy: instant cutover to previous environment
apiVersion: v1
kind: Service
metadata:
  name: myapp
spec:
  selector:
    version: blue  # revert from green to blue
```

### 2. Canary Rollback

```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: myapp
spec:
  http:
  - route:
    - destination:
        host: myapp-v1
        subset: stable
      weight: 100   # revert from partial to full stable
    - destination:
        host: myapp-v2
        subset: canary
      weight: 0
```

### 3. Rolling Update Rollback

```bash
# Kubernetes native rollback
kubectl rollout undo deployment/myapp -n production

# Rollback to specific revision
kubectl rollout undo deployment/myapp -n production --to-revision=3
```

### 4. Database Rollback

```sql
-- Example: reversible migration pattern
BEGIN;

-- Forward migration
ALTER TABLE users ADD COLUMN email_verified BOOLEAN DEFAULT false;

-- Save rollback SQL for manual execution if needed
-- ROLLBACK: ALTER TABLE users DROP COLUMN email_verified;

COMMIT;
```

## Automation Levels

### Level 1: Manual Rollback

```bash
# Operator-triggered rollback
kubectl rollout undo deployment/myapp -n production
kubectl rollout status deployment/myapp -n production --timeout=300s
```

### Level 2: CI/CD Automated Rollback

```yaml
# GitLab CI example
rollback:
  stage: deploy
  image: bitnami/kubectl
  script:
    - kubectl rollout undo deployment/myapp -n production
    - kubectl rollout status deployment/myapp -n production --timeout=300s
  only:
    - main
  when: manual
```

### Level 3: Automatic Health-Based Rollback

```yaml
# Argo Rollouts automated rollback
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: myapp
spec:
  replicas: 3
  strategy:
    canary:
      steps:
      - setWeight: 20
      - pause: {duration: 5m}
      - setWeight: 100
  # Automatic rollback on analysis
  analysis:
    templates:
    - templateName: success-rate
    args:
    - name: service-name
      value: myapp
    # Rollback automatically if success rate < 99%
```

## Rollback Runbook Template

```markdown
# Rollback Runbook: [Service Name]

## Trigger Criteria
- Error rate > 1% for 5 minutes
- Latency p99 > 2s for 3 minutes
- Health check failures > 50%
- Manual decision by on-call

## Decision Tree
1. Detect issue via monitoring
2. Assess scope: full vs partial rollback
3. Notify stakeholders
4. Execute rollback
5. Verify healthy state
6. Document incident

## Commands
kubectl rollout undo deployment/myapp -n production
kubectl rollout status deployment/myapp -n production --timeout=300s

## Verification
- Health endpoint returns HTTP 200
- Error rate below baseline
- Smoke tests pass
```

## Verification Checklist

- [ ] Service health endpoint returns 200
- [ ] No error rate spike in monitoring
- [ ] Smoke tests pass in production
- [ ] Data consistency verified if schema changed
- [ ] Rollback time within RTO
- [ ] Incident documented and reviewed

## Quality Criteria

- [ ] Rollback strategy documented per service
- [ ] Automated rollback tested in staging
- [ ] RTO/RPO defined and accepted
- [ ] Rollback runbook exists
- [ ] On-call trained on rollback procedure
- [ ] Post-rollback review completed

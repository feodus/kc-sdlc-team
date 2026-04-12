---
name: deployment-automation
description: Application deployment automation. Use for setting up automated deployment, blue-green, canary releases, and release management.
---

# Deployment Automation

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for automating the application deployment process. Includes various deployment strategies (blue-green, canary, rolling), automation, and rollbacks.

## When to Use

Use this skill:
- When setting up automated deployment
- For implementing blue-green deployment
- When setting up canary releases
- For rollback procedures
- When managing releases in multiple environments
- For deployment orchestration

## Deployment Strategies

### 1. Rolling Update

```yaml
# Kubernetes RollingUpdate - default
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
```

### 2. Blue-Green Deployment

```yaml
# Production version (blue)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-blue
spec:
  replicas: 3
  selector:
    matchLabels:
      version: blue

---
# New version (green)  
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-green
spec:
  replicas: 0
  selector:
    matchLabels:
      version: green

---
# Service switching
apiVersion: v1
kind: Service
metadata:
  name: myapp
spec:
  selector:
    version: blue  # change to green for switching
```

### 3. Canary Deployment

```yaml
# Istio VirtualService for canary
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: myapp
spec:
  hosts:
  - myapp.example.com
  http:
  - route:
    - destination:
        host: myapp-v1
        subset: stable
      weight: 90
    - destination:
        host: myapp-v2
        subset: canary
      weight: 10
```

### 4. Argo Rollouts

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: myapp
spec:
  replicas: 3
  strategy:
    canary:
      maxSurge: "25%"
      maxUnavailable: 0
      steps:
      - setWeight: 10
      - pause: {duration: 10m}
      - setWeight: 30
      - pause: {duration: 10m}
      - setWeight: 50
      - pause: {duration: 10m}
      - setWeight: 100
```

## Automation Scripts

### Deployment Script (Bash)

```bash
#!/bin/bash
set -e

NAMESPACE=${1:-production}
VERSION=${2:-latest}
REGISTRY="myregistry.com/myapp"

echo "Deploying $VERSION to $NAMESPACE..."

# Tagging
docker tag myregistry.com/myapp:latest $REGISTRY:$VERSION
docker push $REGISTRY:$VERSION

# Update deployment
kubectl set image deployment/myapp \
  myapp=$REGISTRY:$VERSION \
  -n $NAMESPACE

# Wait for rollout
kubectl rollout status deployment/myapp \
  -n $NAMESPACE \
  --timeout=300s

echo "Deployment completed!"
```

### GitOps Deployment (ArgoCD)

```yaml
# application.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp
  namespace: argocd
spec:
  project: production
  source:
    repoURL: https://github.com/myorg/myapp.git
    targetRevision: main
    path: k8s/overlays/production
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## Pre-Deployment Checklist

```bash
#!/bin/bash
# pre-deploy-check.sh

echo "Running pre-deployment checks..."

# Tests passed?
if ! npm test -- --coverage > /dev/null 2>&1; then
    echo "❌ Tests failed"
    exit 1
fi

# Security scan passed?
if snyk test > /dev/null 2>&1; then
    echo "✅ Security scan passed"
else
    echo "⚠️ Security issues found"
fi

# Docker build successful?
docker build -t myapp . || { echo "❌ Build failed"; exit 1; }

# No high/critical vulnerabilities in image?
trivy image --severity HIGH,CRITICAL myapp || { 
    echo "❌ Critical vulnerabilities found"
    exit 1 
}

echo "✅ All checks passed"
```

## Post-Deployment Verification

```bash
#!/bin/bash
# post-deploy-check.sh

HEALTH_ENDPOINT="https://myapp.example.com/health"

# Health check
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $HEALTH_ENDPOINT)

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ Health check passed"
else
    echo "❌ Health check failed (HTTP $HTTP_CODE)"
    exit 1
fi

# Smoke tests
npm run test:smoke || { echo "❌ Smoke tests failed"; exit 1; }

# Metrics availability
curl -s myapp.example.com/metrics | grep -q "app_version" || {
    echo "⚠️ Metrics not available"
}
```

## Quality Criteria

- [ ] Automated deployment configured
- [ ] Pre-checks run automatically
- [ ] Post-verification configured
- [ ] Rollback procedure works
- [ ] Blue-green or canary configured
- [ ] Logging is complete
- [ ] Notifications configured
- [ ] Rollback time < 5 minutes

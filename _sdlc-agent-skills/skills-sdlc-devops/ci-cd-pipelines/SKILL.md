---
name: ci-cd-pipelines
description: Designing and managing CI/CD pipelines. Use for creating, optimizing, and maintaining automated pipelines for building, testing, and deployment.
---

# CI/CD Pipelines

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for designing and managing full CI/CD pipelines. Includes tool selection, pipeline structure, best practices, and process optimization.

## When to Use

Use this skill:
- When setting up CI/CD from scratch
- For optimizing existing pipelines
- When selecting CI/CD tools
- For implementing GitOps
- When setting up automated testing
- For managing secrets in pipeline

## Pipeline Components

### Typical structure

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   BUILD     │───▶│   TEST      │───▶│   STAGE     │───▶│  PRODUCTION │
│             │    │             │    │             │    │             │
│ - Compile   │    │ - Unit      │    │ - UAT       │    │ - Deploy    │
│ - Package   │    │ - Integration│   │ - Performance│  │ - Smoke     │
│ - Docker    │    │ - Security  │    │ - Security  │    │ - Canary    │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

### Stages

| Stage | Description | Tools |
|-------|-------------|-------|
| Build | Compilation, artifact creation | Maven, Gradle, npm, dotnet |
| Test | Running tests | pytest, Jest, JUnit |
| Security | SAST, SCA, DAST | SonarQube, Snyk, OWASP ZAP |
| Package | Creating Docker images | Docker, Buildpacks |
| Deploy | Deploying to environments | ArgoCD, Spinnaker, Helm |
| Verify | Smoke tests, health checks | curl, kubectl |

## GitLab CI/CD

### Basic example

```yaml
stages:
  - build
  - test
  - security
  - deploy

variables:
  DOCKER_REGISTRY: registry.example.com
  IMAGE_TAG: $CI_COMMIT_SHORT_SHA

build:
  stage: build
  image: docker:24
  services:
    - docker:24-dind
  script:
    - docker build -t $IMAGE_NAME:$IMAGE_TAG .
    - docker push $IMAGE_NAME:$IMAGE_TAG
  only:
    - main
    - develop

test:unit:
  stage: test
  image: node:20
  script:
    - npm ci
    - npm run test:unit
  coverage: '/Coverage: \d+\.\d+%%/'

test:integration:
  stage: test
  image: node:20
  services:
    - postgres:15
  script:
    - npm ci
    - npm run test:integration
  allow_failure: false

security:scan:
  stage: security
  image: sonarsource/sonar-scanner-cli
  script:
    - sonar-scanner -Dsonar.projectKey=$CI_PROJECT_NAME
  allow_failure: true

deploy:staging:
  stage: deploy
  image: bitnami/kubectl:latest
  environment:
    name: staging
  script:
    - kubectl apply -f k8s/staging/
  only:
    - develop

deploy:production:
  stage: deploy
  image: bitnami/kubectl:latest
  environment:
    name: production
  script:
    - kubectl apply -f k8s/production/
  when: manual
  only:
    - main
```

### Template for reuse

```yaml
# .gitlab-ci-template.yml
.template:
  image: node:20
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - node_modules/

test:node:
  extends: .template
  script:
    - npm ci
    - npm run test
  coverage: '/Coverage: \d+\.\d+%%/'
  artifacts:
    reports:
      junit: junit.xml
```

## GitHub Actions

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Run linter
        run: npm run lint
        
  test:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          
      - name: Run tests
        run: npm test
        
      - name: Upload coverage
        uses: codecov/codecov-action@v4

  security:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Run Snyk
        uses: snyk/actions/node@master
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

  deploy:
    needs: [test, security]
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      
      - name: Deploy to production
        run: |
          echo "Deploying to production"
```

## Best Practices

### Performance

```yaml
# Caching dependencies
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
    - .gradle/caches/
    - ~/.cache/pip/

# Parallel test execution
test:unit:
  parallel: 3
  script:
    - npm run test -- --split-by=class

# Docker layer caching
build:
  image: docker:24
  services:
    - docker:24-dind
  before_script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
  script:
    - docker build --cache-from $IMAGE_NAME:latest ...
```

### Security

```yaml
# Secrets management
variables:
  SECRETS: masked

# Don't store secrets in code
# Use CI/CD variables instead

# Container scanning
container-scan:
  image: aquasec/trivy:latest
  script:
    - trivy image --exit-code 1 --severity HIGH,CRITICAL $IMAGE
```

### Quality Gates

```yaml
# Quality gates
quality gate:
  stage: verify
  script:
    - |
      COVERAGE=$(cat coverage/coverage.txt | grep -oP '\d+%')
      if [ ${COVERAGE%\%} -lt 80 ]; then
        echo "Coverage $COVERAGE is below 80%"
        exit 1
      fi
  allow_failure: false
```

## Pipeline Monitoring

### Key Metrics

| Metric | Description | Target |
|--------|-------------|--------|
| Build Time | Build time | < 10 min |
| Success Rate | % successful runs | > 90% |
| MTTR | Mean time to recovery | < 30 min |
| Coverage | Test coverage | > 80% |

### Dashboard

```yaml
# Prometheus metrics
- pipeline_duration_seconds
- pipeline_success_total
- pipeline_failure_total
- test_coverage_percent
```

## Quality Criteria

- [ ] Pipeline documented
- [ ] All stages tested
- [ ] Secrets not in code
- [ ] Quality gates configured
- [ ] Logs are informative
- [ ] Pipeline is fast
- [ ] Rollback works

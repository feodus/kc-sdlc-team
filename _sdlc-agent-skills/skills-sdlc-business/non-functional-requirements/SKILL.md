---
name: non-functional-requirements
description: Non-functional requirements definition. Use this skill for documenting system quality requirements — performance, security, scalability, availability, and other NFRs.
---

# Non-Functional Requirements

## When to Use

- When defining system quality characteristics
- For setting SLA (Service Level Agreement)
- When designing architecture
- For defining constraints and environment requirements
- When assessing performance and security

## Key Concepts

**Non-Functional Requirement (NFR)** — requirement that defines quality criteria for system operation, not a specific function. Answers "How should the system work?"

### NFR Categories

| Category | Description | Examples |
|-----------|-------------|----------|
| **Performance** | Performance | Response time, throughput |
| **Scalability** | Scalability | Users, data |
| **Availability** | Availability | Uptime, downtime |
| **Security** | Security | Encryption, authentication |
| **Reliability** | Reliability | MTBF, MTTR |
| **Maintainability** | Maintainability | Time to fix |
| **Usability** | Usability | User satisfaction |
| **Capacity** | Capacity | Max users, data size |

## Main NFR Types

### 1. Performance

```markdown
## Performance Requirements

| Metric | Requirement | Notes |
|--------|--------------|-------|
| Response Time | < 200ms (p95) | For 90% of requests |
| Response Time | < 500ms (p99) | Peak load |
| Throughput | 1000 req/s | Peak load |
| Database Query | < 100ms | Average queries |
| File Upload | < 5MB file | Max size |
```

### 2. Scalability

```markdown
## Scalability Requirements

| Dimension | Requirement | Strategy |
|-----------|-------------|----------|
| Concurrent Users | 10,000 | Horizontal scaling |
| Daily Active Users | 100,000 | Load balancing |
| Data Volume | 10TB | Database sharding |
| API Calls | 1M/day | Rate limiting |
```

### 3. Availability

```markdown
## Availability Requirements

| Metric | Requirement | Notes |
|--------|-------------|-------|
| Uptime | 99.9% | ~= 8.76 hours/year |
| Planned Downtime | 4 hours/month | Maintenance window |
| Recovery Time | < 30 minutes | RTO |
| Recovery Point | < 1 hour | RPO |
```

### 4. Security

```markdown
## Security Requirements

| Category | Requirement |
|----------|-------------|
| Authentication | OAuth 2.0, JWT |
| Password | bcrypt, min 8 chars, complexity |
| Data at Rest | AES-256 encryption |
| Data in Transit | TLS 1.3 |
| Session | 24h expiration, refresh token |
| Rate Limiting | 100 req/min per user |
| Compliance | GDPR, PCI-DSS |
```

### 5. Reliability

```markdown
## Reliability Requirements

| Metric | Requirement |
|--------|--------------|
| MTBF | > 2000 hours |
| MTTR | < 30 minutes |
| Error Rate | < 0.1% |
| Data Loss | Zero tolerance |
```

## NFR Template

```markdown
# NFR-[ID]: [Name]

**Category:** [Performance/Scalability/Availability/Security/etc.]
**Priority:** Critical/High/Medium/Low

## Requirement
[Specific requirement in measurable terms]

## Measurement
- How measured: [Metric]
- Tools: [Monitoring tools]

## Verification
- [ ] Performance test
- [ ] Load testing
- [ ] Production monitoring

## Constraints
- [Constraint 1]
- [Constraint 2]

## Dependencies
- [Related FR or NFR]
```

## NFR Examples by Category

### Example 1: API Performance

```markdown
# NFR-001: API Performance

**Category:** Performance
**Priority:** Critical

## Requirements
- p95 latency < 200ms for all API endpoints
- p99 latency < 500ms
- Throughput: min 1000 req/s
- Error rate: < 0.1%

## Measurement
- Prometheus + Grafana for monitoring
- JMeter/Artillery for load testing

## Verification
- [ ] Weekly load testing
- [ ] p95/p99 monitoring in production
- [ ] Alert when threshold exceeded
```

### Example 2: Data Security

```markdown
# NFR-002: Data Security

**Category:** Security
**Priority:** Critical

## Requirements
- All passwords: bcrypt hash, cost factor 12
- Sensitive data: AES-256 encryption at rest
- All traffic: TLS 1.3
- Session tokens: JWT, 24h lifetime
- Rate limiting: 100 req/min per user
- Audit log: All data access events

## Verification
- [ ] Security audit quarterly
- [ ] Pen testing annually
- [ ] Vulnerability scanning monthly
```

### Example 3: Mobile App Usability

```markdown
# NFR-003: Mobile Usability

**Category:** Usability
**Priority:** High

## Requirements
- App launch: < 2 seconds
- Screen navigation: < 300ms
- Crash-free sessions: > 99.5%
- Battery usage: < 5% per hour active use
- Offline mode: Core features available

## Verification
- [ ] UX testing with real users
- [ ] Crash reporting (Firebase/Sentry)
- [ ] Beta testing program
```

## NFR Verification Methods

| NFR Type | Testing Method | Tools |
|----------|----------------|-------|
| Performance | Load testing, stress testing | JMeter, k6, Gatling |
| Scalability | Capacity testing | k6, Locust |
| Security | Penetration testing, vulnerability scan | OWASP ZAP, Nessus |
| Availability | Chaos engineering | Chaos Monkey |
| Reliability | Fault injection | Pumba |
| Usability | User testing, surveys | UserTesting, Hotjar |

## Templates

### NFR Specification Document Template

```markdown
# Non-Functional Requirements Specification

**Project:** [Name]
**Version:** 1.0
**Date:** [Date]

## 1. Performance

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| PERF-001 | API response time | < 200ms p95 | APM |
| PERF-002 | Page load time | < 3 seconds | Lighthouse |
| PERF-003 | Database query | < 100ms | Query analyzer |

## 2. Scalability

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| SCALE-001 | Concurrent users | 10,000 | Load test |
| SCALE-002 | API throughput | 1000 rps | Load test |

## 3. Availability

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| AVAIL-001 | System uptime | 99.9% | Uptime monitor |
| AVAIL-002 | Recovery time | < 30 min | DR test |

## 4. Security

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| SEC-001 | Encryption | TLS 1.3 | Audit |
| SEC-002 | Password policy | 8+ chars | Config check |

## 5. Usability

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| USE-001 | Task completion | > 90% | User testing |
| USE-002 | Error recovery | < 30 sec | UX testing |
```

### NFR vs Constraints

```
NFR (quality requirements):       Constraints:
────────────────────────────────   ──────────────────────────────
"System must be fast"              "Use Python + PostgreSQL"
                                   "Budget: 1000 person-hours"
                                   "Deadline: Q2 2026"

"Must be reliable"                 "Integration with existing CRM"
                                   "Training: max 4 hours"
```

## Integration with Other Agents

### For System Analyst

```markdown
new_task(
  mode: "sdlc-system-analyst",
  message: "NFRs defined. Need to consider in architecture design. NFRs: [list].",
  todos: "[-] Validate architecture against NFRs\n[ ] Define technical solutions\n[ ] Assess infrastructure"
)
```

### For DevOps

```markdown
new_task(
  mode: "sdlc-devops",
  message: "NFRs ready. Need to set up monitoring and alerts. Requirements: [NFRs list].",
  todos: "[-] Set up performance monitoring\n[ ] Set up alerting\n[ ] Set up logging"
)
```

## Tools

| Tool | NFR Category | Purpose |
|------|--------------|---------|
| JMeter/k6 | Performance | Load testing |
| Prometheus + Grafana | All | Monitoring |
| OWASP ZAP | Security | Security testing |
| Snyk | Security | Vulnerability scanning |
| Lighthouse | Usability | Performance auditing |
| Sentry | Reliability | Error tracking |

## Non-Functional Requirements Checklist

- [ ] All NFR categories defined
- [ ] Each NFR is measurable
- [ ] Target values exist
- [ ] Verification methods defined
- [ ] NFRs agreed with stakeholders
- [ ] Constraints considered
- [ ] NFRs don't contradict each other
- [ ] Monitoring plan exists

---
name: security-auditing
description: Conducting security audits, compliance checking, infrastructure security assessment. Use for comprehensive security checks and preparing conclusions.
---

# Security Auditing

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for conducting comprehensive security audits. Includes compliance checking (ISO 27001, PCI-DSS, SOC 2), infrastructure security assessment, documentation, and generating conclusions.

## When to Use

Use this skill:
- When conducting security audit of information system
- For compliance verification
- When assessing infrastructure security
- For preparing for certification
- When identifying non-compliance and risks
- For generating improvement recommendations

## Audit Types

### By Scope

| Type | Description |
|------|-------------|
| Comprehensive | Full system check |
| Functional | Single function check |
| Technical | Deep technical check |
| Process | Security process check |

### By Standards

| Standard | Application Area |
|----------|-----------------|
| ISO 27001 | ISMS |
| PCI-DSS | Payment systems |
| SOC 2 | Data processing services |
| GDPR | Personal data protection |
| ГОСТ Р 57264-2016 | Information security requirements in Russia |

## Audit Process

### 1. Planning

```
1. DEFINE audit goal and scope
2. GATHER documentation
3. DEVELOP audit program
4. NOTIFY stakeholders
5. PREPARE checklists
```

### 2. Information Collection

- Staff interviews
- Documentation analysis
- Technical testing
- Process observation

### 3. Assessment

- Comparison with requirements
- Non-compliance identification
- Risk assessment
- Findings documentation

### 4. Conclusion

- Report generation
- Improvement recommendations
- Action plan

## Audit Checklist

### Security Management

- [ ] IS policy approved and current
- [ ] Responsible person assigned
- [ ] Periodic policy review conducted
- [ ] Staff informed about policy
- [ ] IS budget allocated

### Access Management

- [ ] Password policy meets requirements
- [ ] Multi-factor authentication used
- [ ] Privileged access limited
- [ ] Credentials revoked on termination
- [ ] Access logs analyzed

### Data Protection

- [ ] Data classified
- [ ] Encryption used
- [ ] Backup configured
- [ ] Data deletion secure
- [ ] DLP solutions implemented

### Physical Security

- [ ] Room access control
- [ ] Video surveillance functional
- [ ] Fire and water protection
- [ ] Media disposal secure

### Network Security

- [ ] Firewall configured
- [ ] IDS/IPS deployed
- [ ] Network segmentation implemented
- [ ] VPN used for remote access
- [ ] Security updates applied

### Incident Management

- [ ] Response procedure documented
- [ ] Response team defined
- [ ] Drills conducted
- [ ] Incident journal maintained

## Report Template

```markdown
# Security Audit Report

**Organization:** [Name]
**System:** [System Name]
**Date:** [Date]
**Auditor:** [Name]
**Standard:** [ISO 27001 / PCI-DSS / etc.]

## Executive Summary
[Overall assessment summary]

## Scope
- Systems audited: [List]
- Methods used: [Interviews, Testing, Review]
- Limitations: [Any limitations]

## Findings

### Critical
| ID | Finding | Recommendation | Status |
|----|---------|----------------|--------|
| C01 | [Finding] | [Recommendation] | Open |

### High
| ID | Finding | Recommendation | Status |
|----|---------|----------------|--------|
| H01 | [Finding] | [Recommendation] | Open |

### Medium
...

## Compliance Status

| Control | Requirement | Status | Evidence |
|---------|-------------|--------|----------|
| A.5.1 | Information security policies | Compliant | Policy v2.1 |

## Risk Assessment

| Risk | Likelihood | Impact | Score | Treatment |
|------|------------|--------|-------|------------|
| [Risk] | High | Critical | 25 | Mitigate |

## Recommendations

1. **Immediate** (0-30 days)
   - [Action 1]
   - [Action 2]

2. **Short-term** (30-90 days)
   - [Action 1]

3. **Long-term** (90+ days)
   - [Action 1]

## Conclusion
[Overall conclusion with next steps]
```

## Quality Criteria

- [ ] All areas covered
- [ ] Evidence collected
- [ ] Non-compliance confirmed
- [ ] Risks assessed
- [ ] Recommendations practical
- [ ] Report structured

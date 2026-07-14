---
name: owasp-compliance
description: OWASP Top 10 compliance checking, implementing security controls, preparing for audit. Use for ensuring OWASP compliance and passing security assessment.
---

# OWASP Compliance

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for ensuring compliance with OWASP Top 10 and related security standards. Includes current state assessment, control implementation, documentation, and audit preparation.

## When to Use

Use this skill:
- For checking OWASP Top 10 compliance
- When implementing security controls
- For preparing for security audit
- When assessing web application risks
- For documenting security posture
- When creating remediation plans

## Quick Reference

- **OWASP Top 10 details:** `references/owasp-top10.md`
- **Checklists:** `references/checklists.md`
- **Scan scripts:** `assets/scan-dependencies.sh`
- **Header templates:** `assets/security-headers-templates.md`

## OWASP Top 10

Full details and controls: `references/owasp-top10.md`

## Compliance Checklist

Pre-deployment and production checklists: `references/checklists.md`

## Tools

| Category | Tools |
|----------|-------|
| DAST | OWASP ZAP, Burp Suite |
| SAST | Semgrep, SonarQube |
| SCA | Snyk, Dependabot, Trivy |
| WAF | ModSecurity, Cloudflare |
| Headers | securityheaders.com |

## Quality Criteria

- [ ] All OWASP categories assessed
- [ ] Controls implemented
- [ ] Testing conducted
- [ ] Documentation up-to-date
- [ ] Regular reviews scheduled

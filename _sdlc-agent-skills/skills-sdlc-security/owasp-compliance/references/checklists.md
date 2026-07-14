# OWASP Compliance Checklists

## Pre-Deployment Checklist

- [ ] All Critical/High vulnerabilities fixed
- [ ] Security headers configured (HSTS, CSP, X-Frame-Options)
- [ ] Logging configured for security events
- [ ] Error handling doesn't expose sensitive data
- [ ] Dependencies checked and up-to-date
- [ ] Authentication is secure (MFA, password policy)
- [ ] Authorization tested (IDOR, privilege escalation)
- [ ] Input validation implemented
- [ ] Output encoding applied
- [ ] Cryptographic controls reviewed

## Production Checklist

- [ ] Monitoring configured
- [ ] WAF configured
- [ ] Regular scanning scheduled
- [ ] Updates applied within SLA
- [ ] Backup tested
- [ ] Incident response plan ready
- [ ] Security headers validated
- [ ] Logging and alerting active

## Audit Preparation Checklist

- [ ] OWASP Top 10 assessment completed
- [ ] Controls documented
- [ ] Evidence collected
- [ ] Remediation plan defined
- [ ] Security posture report ready

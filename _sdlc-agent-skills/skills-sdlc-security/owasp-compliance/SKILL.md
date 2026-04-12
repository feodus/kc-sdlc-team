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

## OWASP Top 10 (2021)

| ID | Category | Description |
|----|---------|-------------|
| A01 | Broken Access Control | Access control violation |
| A02 | Cryptographic Failures | Cryptographic failures |
| A03 | Injection | Injections |
| A04 | Insecure Design | Insecure design |
| A05 | Security Misconfiguration | Security misconfiguration |
| A06 | Vulnerable Components | Vulnerable components |
| A07 | Auth Failures | Authentication failures |
| A08 | Software Integrity | Software integrity violation |
| A09 | Logging Failures | Logging failures |
| A10 | Server-Side Request Forgery | SSRF |

## Detailed Description and Controls

### A01: Broken Access Control

**Risks:**
- Violation of principle of least privilege
- IDOR vulnerabilities
- Privilege escalation
- Insecure direct object references

**Controls:**
```yaml
Authorization:
   - Role-based access control (RBAC)
   - Attribute-based access control (ABAC)
   - Default deny all
   
API Security:
   - Validate user identity
   - Verify ownership of resources
   - Disable directory listing
   - Rate limiting
   
Session:
   - Invalid session after logout
   - Session timeout
   - Secure session cookies
```

**Testing:**
```bash
# Test IDOR
curl -u user:pass http://app/api/user/1
curl -u user:pass http://app/api/user/2  # Should fail for user 1
```

### A02: Cryptographic Failures

**Risks:**
- Weak cryptography
- Insufficient encryption
- Hardcoded keys
- Missing data encryption in transit

**Controls:**
```yaml
Data Protection:
   - AES-256 for encryption
   - TLS 1.2+ for transit
   - Key management (HSM, Vault)
   - Proper IV generation

Crypto:
   - Don't use: MD5, SHA1, DES, 3DES
   - Use: AES-GCM, ChaCha20
   - PBKDF2, bcrypt, scrypt for passwords
   
Key Management:
   - Separate keys from code
   - Regular key rotation
   - Secure storage (env vars, secrets manager)
```

### A03: Injection

**Risks:**
- SQL Injection
- NoSQL Injection
- Command Injection
- LDAP Injection
- XPath Injection
- Template Injection

**Controls:**
```yaml
Prevention:
   - Parameterized queries
   - Stored procedures
   - ORM
   - Input validation (whitelist)
   - Output encoding

Command Injection:
   - Avoid system calls
   - If needed: whitelist, no user input in commands
   
NoSQL:
   - Use parameterized queries
   - Validate input types
```

**Testing:**
```sql
-- SQL Injection test payloads
' OR '1'='1
' UNION SELECT * FROM users--
'; DROP TABLE users--
```

### A04: Insecure Design

**Risks:**
- Missing threat modeling
- Business logic vulnerabilities
- Insecure patterns
- Missing security by design

**Controls:**
```yaml
Process:
   - Threat modeling (STRIDE, DREAD)
   - Secure design patterns
   - Code review
   - Security testing in SDLC
   
Business Logic:
   - Validate business rules
   - Rate limiting on operations
   - Transaction limits
   - State validation
```

### A05: Security Misconfiguration

**Risks:**
- Debug mode enabled
- Default credentials
- Verbose error messages
- Insecure configurations

**Controls:**
```yaml
Configuration:
   - Hardened OS and frameworks
   - Disable unnecessary features
   - Secure defaults
   - Regular audits

Error Handling:
   - Generic error messages
   - No stack traces in production
   - Custom error pages
   
Security Headers:
   - HSTS
   - X-Frame-Options
   - Content-Security-Policy
   - X-Content-Type-Options
```

### A06: Vulnerable Components

**Risks:**
- Outdated dependencies
- Known vulnerabilities
- Unsupported components

**Controls:**
```yaml
Dependency Management:
   - Regular scanning (Snyk, Dependabot)
   - SBOM (Software Bill of Materials)
   - Immediate patching critical
   - Remove unused components

Monitoring:
   - CVE alerts
   - Security advisories
   - Regular audits
```

### A07: Authentication Failures

**Risks:**
- Weak passwords
- Credential stuffing
- Session management issues
- Missing MFA

**Controls:**
```yaml
Password Policy:
   - Min 12 chars, complexity
   - No common passwords
   - Secure storage (bcrypt, Argon2)
   
Authentication:
   - MFA for all accounts
   - Account lockout after 5 attempts
   - Secure session management
   - OAuth 2.0 / OpenID Connect
   
Protection:
   - CAPTCHA on failed attempts
   - Rate limiting on login
   - Secure password reset flow
```

### A08: Software Integrity

**Risks:**
- Insecure deserialization
- CI/CD vulnerabilities
- Untrusted dependencies

**Controls:**
```yaml
Deserialization:
   - Avoid deserialization of untrusted data
   - Use JSON instead of pickle/yaml
   - Type checking on deserialized data
   
CI/CD:
   - Validate signatures
   - SBOM generation
   - Security scanning in pipeline
   - Access controls on pipelines
```

### A09: Logging Failures

**Risks:**
- PII leakage in logs
- Missing logging
- Insufficient monitoring

**Controls:**
```yaml
Logging:
   - Log security events
   - Include correlation IDs
   - Secure log storage
   
Data Protection:
   - Sanitize PII from logs
   - Mask sensitive data
   - GDPR compliance

Monitoring:
   - Real-time alerts
   - SIEM integration
   - Dashboard for security events
```

### A10: SSRF

**Risks:**
- Server makes requests to external URLs
- Cloud metadata exposure
- Internal network scanning

**Controls:**
```yaml
Prevention:
   - Validate all URLs
   - Use blocklists/allowlists
   - Disable HTTP redirects
   - Timeout external requests
   
Network:
   - Segment external traffic
   - Block internal IPs from server
   - Cloud: deny metadata access
```

## Compliance Checklist

### Pre-Deployment

- [ ] All Critical/High vulnerabilities fixed
- [ ] Security headers configured
- [ ] Logging configured
- [ ] Error handling doesn't expose sensitive data
- [ ] Dependencies checked
- [ ] Authentication is secure

### Production

- [ ] Monitoring configured
- [ ] WAF configured
- [ ] Regular scanning
- [ ] Updates applied
- [ ] Backup tested

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

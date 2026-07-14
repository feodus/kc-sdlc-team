# OWASP Top 10 (2021) Reference

> Source: OWASP Top 10 2021 RC1 / Final Release

| ID | Category | Description |
|----|----------|-------------|
| A01 | Broken Access Control | Access control violations, IDOR, privilege escalation |
| A02 | Cryptographic Failures | Weak crypto, insufficient encryption, hardcoded keys |
| A03 | Injection | SQL, NoSQL, Command, LDAP, XPath, Template injection |
| A04 | Insecure Design | Missing threat modeling, business logic flaws |
| A05 | Security Misconfiguration | Debug mode, default creds, verbose errors |
| A06 | Vulnerable Components | Outdated dependencies, known CVEs, unsupported libs |
| A07 | Auth Failures | Weak passwords, credential stuffing, session issues |
| A08 | Software Integrity | Insecure deserialization, CI/CD vulns |
| A09 | Logging Failures | PII leakage, missing logging, insufficient monitoring |
| A10 | SSRF | Server-side request forgery, cloud metadata exposure |

## Controls by Category

### A01: Broken Access Control

**Risks:**
- Violation of least privilege
- IDOR vulnerabilities
- Privilege escalation
- Insecure direct object references

**Controls:**
- Role-based access control (RBAC)
- Attribute-based access control (ABAC)
- Default deny all
- Validate user identity and resource ownership
- Disable directory listing
- Rate limiting
- Invalid session after logout
- Session timeout and secure cookies

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
- Missing encryption in transit

**Controls:**
- AES-256 for encryption
- TLS 1.2+ for transit
- Key management (HSM, Vault)
- Proper IV generation
- Avoid MD5, SHA1, DES, 3DES
- Use AES-GCM, ChaCha20
- PBKDF2, bcrypt, scrypt for passwords
- Separate keys from code
- Regular key rotation
- Secure storage (env vars, secrets manager)

### A03: Injection

**Risks:**
- SQL Injection
- NoSQL Injection
- Command Injection
- LDAP Injection
- XPath Injection
- Template Injection

**Controls:**
- Parameterized queries
- Stored procedures
- ORM
- Input validation (whitelist)
- Output encoding
- Avoid system calls
- Use parameterized queries for NoSQL
- Validate input types

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
- Threat modeling (STRIDE, DREAD)
- Secure design patterns
- Code review
- Security testing in SDLC
- Validate business rules
- Rate limiting on operations
- Transaction limits
- State validation

### A05: Security Misconfiguration

**Risks:**
- Debug mode enabled
- Default credentials
- Verbose error messages
- Insecure configurations

**Controls:**
- Hardened OS and frameworks
- Disable unnecessary features
- Secure defaults
- Regular audits
- Generic error messages
- No stack traces in production
- Custom error pages
- HSTS
- X-Frame-Options
- Content-Security-Policy
- X-Content-Type-Options

### A06: Vulnerable Components

**Risks:**
- Outdated dependencies
- Known vulnerabilities
- Unsupported components

**Controls:**
- Regular scanning (Snyk, Dependabot)
- SBOM (Software Bill of Materials)
- Immediate patching for critical
- Remove unused components
- CVE alerts
- Security advisories
- Regular audits

### A07: Authentication Failures

**Risks:**
- Weak passwords
- Credential stuffing
- Session management issues
- Missing MFA

**Controls:**
- Min 12 chars, complexity
- No common passwords
- Secure storage (bcrypt, Argon2)
- MFA for all accounts
- Account lockout after 5 attempts
- Secure session management
- OAuth 2.0 / OpenID Connect
- CAPTCHA on failed attempts
- Rate limiting on login
- Secure password reset flow

### A08: Software Integrity

**Risks:**
- Insecure deserialization
- CI/CD vulnerabilities
- Untrusted dependencies

**Controls:**
- Avoid deserialization of untrusted data
- Use JSON instead of pickle/yaml
- Type checking on deserialized data
- Validate signatures in CI/CD
- SBOM generation
- Security scanning in pipeline
- Access controls on pipelines

### A09: Logging Failures

**Risks:**
- PII leakage in logs
- Missing logging
- Insufficient monitoring

**Controls:**
- Log security events
- Include correlation IDs
- Secure log storage
- Sanitize PII from logs
- Mask sensitive data
- GDPR compliance
- Real-time alerts
- SIEM integration
- Dashboard for security events

### A10: SSRF

**Risks:**
- Server makes requests to external URLs
- Cloud metadata exposure
- Internal network scanning

**Controls:**
- Validate all URLs
- Use blocklists/allowlists
- Disable HTTP redirects
- Timeout external requests
- Segment external traffic
- Block internal IPs from server
- Cloud: deny metadata access

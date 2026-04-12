---
name: code-security-review
description: Code vulnerability and security issue checking. Use for conducting security-focused code review and identifying potential issues.
---

# Code Security Review

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for conducting source code security reviews. Includes architecture analysis, vulnerability pattern search, dependency assessment, and generating recommendations.

## When to Use

Use this skill:
- When conducting security-focused PR reviews
- For code analysis before release
- When auditing application security
- For checking third-party code
- When searching for vulnerabilities in code
- When training team on secure coding

## Review Process

### 1. Preparation

```
1. DEFINE review scope
2. GATHER application context
3. IDENTIFY languages and frameworks
4. PREPARE analysis tools
```

### 2. Static Analysis

```bash
# Python - Bandit
bandit -r ./src

# JavaScript/TypeScript - Semgrep
semgrep --config=auto ./src

# Java - SpotBugs
spotbugs -textui ./build

# Go - gosec
gosec ./...
```

### 3. Manual Analysis

Key areas to check:
- Authentication and authorization
- Input data handling
- Cryptographic operations
- Session management
- Logging and error handling
- Security configuration

## Typical Vulnerabilities

### By Language

#### Python

| Pattern | Vulnerability | Fix |
|---------|---------------|-----|
| `eval(x)` | Code injection | Use ast.literal_eval |
| `os.system(x)` | Command injection | Use subprocess with list |
| `pickle.load(x)` | Deserialization | Use JSON |
| `format(x)` | Format string | Use f-string |
| `sql.execute(f"...")` | SQL injection | Use parameterization |

#### JavaScript

| Pattern | Vulnerability | Fix |
|---------|---------------|-----|
| `eval(x)` | Code injection | Avoid eval |
| `innerHTML = x` | XSS | Use textContent |
| `dangerouslySetInnerHTML` | XSS | Sanitize HTML |
| `eval()` in Node | RCE | Avoid eval |
| `crypto.random()` | Weak PRNG | Use crypto.randomUUID() |

#### SQL

| Pattern | Vulnerability | Fix |
|---------|---------------|-----|
| `SELECT * FROM ${input}` | SQL Injection | Parameterization |
| `INSERT INTO ${table}` | SQL Injection | Whitelist tables |
| `ORDER BY ${col}` | SQL Injection | Whitelist columns |

## Security Checks

### Authentication

```python
# ❌ Insecure
def login(username, password):
    user = db.query(f"SELECT * FROM users WHERE username='{username}'")
    if user.password == password:
        return user

# ✅ Secure
def login(username, password):
    user = db.query("SELECT * FROM users WHERE username = ?", (username,))
    if user and bcrypt.check(password, user.hash):
        return user
```

### Cryptography

```python
# ❌ Insecure
import hashlib
hash = hashlib.md5(password)

# ✅ Secure
import bcrypt
hash = bcrypt.hashpw(password, bcrypt.gensalt())

# ❌ Insecure - predictable IV
cipher = AES.new(key, AES.MODE_CBC, iv)

# ✅ Secure
cipher = AES.new(key, AES.MODE_CBC, os.urandom(16))
```

### Input Validation

```python
# ❌ Insecure
def upload(filename):
    save_to_disk(filename)

# ✅ Secure
def upload(filename):
    safe_name = secure_filename(filename)
    ext = Path(safe_name).suffix
    if ext not in ALLOWED_EXTENSIONS:
        raise ValueError("Invalid extension")
```

## OWASP Top 10 (2021) in Code

| Category | What to Check |
|---------|---------------|
| A01 Broken Access Control | Permission checks, IDOR |
| A02 Crypto Failures | Weak algorithms, hardcoded keys |
| A03 Injection | SQL, Command, Code injection |
| A04 Insecure Design | Business logic, race conditions |
| A05 Misconfiguration | DEBUG=true, verbose errors |
| A06 Vulnerable Components | Outdated dependencies |
| A07 Auth Failures | Weak passwords, missing MFA |
| A08 Integrity Failures | Insecure deserialization |
| A09 Logging | Data leakage in logs |
| A10 SSRF | URL validation before request |

## Review Report Template

```markdown
# Code Security Review Report

**Project:** [Name]
**Commit:** [Hash]
**Reviewer:** [Name]
**Date:** [Date]

## Files Reviewed
- [File 1]
- [File 2]

## Findings

### Critical

| ID | File | Line | Issue | Fix |
|----|------|------|-------|-----|
| C01 | auth.py | 42 | SQL Injection | Use parameterized query |

### High

| ID | File | Line | Issue | Fix |
|----|------|------|-------|-----|
| H01 | crypto.py | 15 | Weak PRNG | Use os.urandom |

### Medium

...

## Summary

| Severity | Count |
|----------|-------|
| Critical | 2 |
| High | 5 |
| Medium | 8 |
| Low | 12 |

## Recommendations
1. [Recommendation 1]
2. [Recommendation 2]
```

## Tools

| Language | SAST | SCA |
|----------|------|-----|
| Python | Bandit, Semgrep, Pylint | Safety, pip-audit |
| JavaScript | Semgrep, ESLint | npm audit, Snyk |
| Java | SpotBugs, SonarQube | OWASP Dependency Check |
| Go | gosec, staticcheck | govulncheck |
| C# | Security Code Scan | OWASP .NET |

## Quality Criteria

- [ ] All files reviewed
- [ ] False positives filtered
- [ ] Context considered
- [ ] Recommendations applicable
- [ ] Priorities assigned
- [ ] Educational comments added

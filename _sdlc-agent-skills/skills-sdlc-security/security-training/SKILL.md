---
name: security-training
description: Team training on secure coding, increasing security awareness. Use for conducting training sessions and creating security materials.
---

# Security Training

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for conducting security awareness training. Includes developing training programs, creating materials, and evaluating effectiveness.

## When to Use

Use this skill:
- When conducting developer training
- For improving team security awareness
- During new employee onboarding
- For creating educational materials
- When assessing team knowledge
- For implementing security culture

## Training Types

### By Audience

| Audience | Focus | Format |
|----------|-------|--------|
| Developers | Secure coding | Workshop, Code review |
| DevOps | Infrastructure security | Lab, Infrastructure review |
| QA | Security testing | Hands-on, Test cases |
| Product | Threat modeling | Presentation, Workshop |
| All | Security awareness | eLearning, Phishing simulation |

### By Format

| Format | Duration | Effectiveness |
|--------|----------|---------------|
| eLearning | 15-30 min | Medium |
| Workshop | 2-4 hours | High |
| Bootcamp | 1-5 days | Very high |
| CTF | 1-2 days | High |
| Phishing simulation | Ongoing | Medium |

## Training Programs

### 1. Secure Coding Fundamentals

**Duration:** 4 hours
**Audience:** All developers

```
Module 1: Introduction to Security (30 min)
  - Why security matters
  - Typical vulnerabilities
  - Cost of security breaches

Module 2: Input Validation (45 min)
  - Why validation is critical
  - Blacklist vs Whitelist
  - Practical examples

Module 3: Authentication & Authorization (45 min)
  - Secure authentication
  - Authorization patterns
  - Session management

Module 4: Cryptography Basics (45 min)
  - When to use crypto
  - Common mistakes
  - Best practices

Module 5: Secure APIs (45 min)
  - API security principles
  - Common API vulnerabilities
  - Best practices

Practice: Code review (30 min)
```

### 2. Threat Modeling Workshop

**Duration:** 3 hours
**Audience:** Product, Architects

```
Introduction to threat modeling (30 min)
STRIDE methodology (45 min)
Practice: Modeling application (90 min)
Discussion and recommendations (30 min)
```

### 3. Security Testing Basics

**Duration:** 2 hours
**Audience:** QA, Developers

```
Introduction to security testing (30 min)
OWASP Top 10 overview (45 min)
Tool demo: ZAP (30 min)
Practice: Finding vulnerabilities (30 min)
```

## Content Examples

### Example: Secure Coding Guide

```markdown
# Secure Coding Guide

## Python

### SQL Injection
❌ Don't do:
```python
query = f"SELECT * FROM users WHERE name = '{name}'"
```

✅ Do instead:
```python
query = "SELECT * FROM users WHERE name = ?"
cursor.execute(query, (name,))
```

### Command Injection
❌ Don't do:
```python
os.system(f"ping {host}")
```

✅ Do instead:
```python
subprocess.run(["ping", host], check=True)
```

### Input Validation
✅ Do:
```python
import re

def validate_email(email):
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None
```

## JavaScript

### XSS Prevention
❌ Don't do:
```javascript
element.innerHTML = userInput;
```

✅ Do instead:
```javascript
element.textContent = userInput;
// Or for HTML:
element.innerHTML = DOMPurify.sanitize(userInput);
```

### Dependency Security
✅ Do:
```bash
npm audit
npm audit fix
```

## Checklist

- [ ] Input validation on all entry points
- [ ] Parameterized queries
- [ ] No eval() with user input
- [ ] Output encoding
- [ ] Secure session management
- [ ] HTTPS only
- [ ] Dependencies updated
- [ ] Secrets not in code
```

## Effectiveness Metrics

### Quantitative

| Metric | Target |
|--------|--------|
| Training completion | 100% |
| Assessment score | > 80% |
| Security bugs in code | < 5% of total |
| Time to fix critical | < 24 hours |
| Phishing click rate | < 5% |

### Qualitative

- Security culture maturity
- Knowledge retention
- Behavior change

## Knowledge Assessment

### Testing

```python
# Example question
question = {
    "question": "What is the most secure way to store passwords?",
    "options": [
        "A) Plain text",
        "B) MD5 hash",
        "C) bcrypt with salt",
        "D) Base64 encoding"
    ],
    "correct": "C"
}
```

### Practical Tasks

```
Task 1: Find vulnerability
Given: code snippet
Task: Find and fix the vulnerability

Task 2: Secure code review
Given: Pull request
Task: Find security issues
```

## Resources

### External

| Resource | Link |
|----------|------|
| OWASP | https://owasp.org |
| Mozilla Security Guidelines | https://wiki.mozilla.org/Security |
| Google Security | https://security.googleblog.com |
| Microsoft Security | https://docs.microsoft.com/en-us/windows/security/ |

### Internal

- Security Champions program
- Office hours (weekly)
- Security documentation wiki

## Quality Criteria

- [ ] All developers trained
- [ ] Materials up-to-date
- [ ] Assessments validated
- [ ] Metrics tracked
- [ ] Continuous improvement

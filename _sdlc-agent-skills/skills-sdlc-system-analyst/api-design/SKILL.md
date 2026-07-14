---
name: api-design
description: Designing RESTful API and OpenAPI specifications. Use this skill for high-level API architecture and coordination. For detailed implementation, refer to subskills: api-design-core, api-design-openapi, api-design-security, api-design-operations.
---

# API Design (Orchestrator)

> **Meta:** v1.1.0 | 05-07-2026
> **Decomposed:** This skill has been decomposed into focused subskills for better maintainability.

## Purpose

High-level orchestrator skill for RESTful API design. Provides references to decomposed subskills for specific concerns: core REST principles, OpenAPI specifications, security, and operational patterns.

## When to Use

Use this skill:
- When planning overall API architecture and strategy
- For coordinating multiple API design concerns
- When you need to identify which specialized subskill to activate
- During initial API design discussions

## Subskills

| Concern | Subskill | Path |
|---------|----------|------|
| Core REST principles, URL structure, HTTP methods, status codes | `api-design-core` | `skills-sdlc-system-analyst/api-design-core/SKILL.md` |
| OpenAPI 3.0 specifications, schemas, parameters, responses | `api-design-openapi` | `skills-sdlc-system-analyst/api-design-openapi/SKILL.md` |
| Authentication, authorization, rate limiting, OAuth 2.0, JWT | `api-design-security` | `skills-sdlc-system-analyst/api-design-security/SKILL.md` |
| Versioning, pagination, error handling, deprecation | `api-design-operations` | `skills-sdlc-system-analyst/api-design-operations/SKILL.md` |

## Usage

For most API design tasks, activate one of the subskills directly:
- Designing resources and HTTP methods → `api-design-core`
- Creating OpenAPI specs → `api-design-openapi`
- Configuring auth/scopes → `api-design-security`
- Implementing pagination/versioning → `api-design-operations`

## Related Skills

- `integration-patterns` — designing integration patterns
- `data-modeling` — designing data models for API
- `sql-development` — writing SQL queries for API
- `bpmn-modeling` — modeling API business processes
- `c4-architecture` — system architecture with API
- `workflow-design` — designing API workflows

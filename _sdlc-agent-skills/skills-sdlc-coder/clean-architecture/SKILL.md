---
name: clean-architecture
description: Clean Architecture and design patterns. Use this skill for high-level architecture strategy and coordination. For detailed implementation, refer to subskills: clean-architecture-core, clean-architecture-patterns, clean-architecture-testing.
---

# Clean Architecture (Orchestrator)

> **Meta:** v1.1.0 | 05-07-2026
> **Decomposed:** This skill has been decomposed into focused subskills for better maintainability.

## Purpose

High-level orchestrator for Clean Architecture. Provides references to decomposed subskills for core principles, design patterns, and testing strategies.

## When to Use

Use this skill:
- When planning overall Clean Architecture adoption strategy
- For coordinating architecture concerns across teams
- When you need to identify which specialized subskill to activate
- During architecture reviews and onboarding

## Quick Reference

- **Standards:** `references/general-standards.md`
- **Subskills:** `clean-architecture-core`, `clean-architecture-patterns`, `clean-architecture-testing`

## Subskills

| Concern | Subskill | Path |
|---------|----------|------|
| Principles, layer structure, dependency rule | `clean-architecture-core` | `skills-sdlc-coder/clean-architecture-core/SKILL.md` |
| Repository, Service, Factory, DTO, Mapper, DI | `clean-architecture-patterns` | `skills-sdlc-coder/clean-architecture-patterns/SKILL.md` |
| Unit testing, mocks, test organization | `clean-architecture-testing` | `skills-sdlc-coder/clean-architecture-testing/SKILL.md` |

## Usage

For most Clean Architecture tasks, activate one of the subskills directly:
- Designing layers and boundaries → `clean-architecture-core`
- Implementing Repository/Service/Factory → `clean-architecture-patterns`
- Writing unit tests for domain/use cases → `clean-architecture-testing`

## Related Skills

- `rest-api-design` — REST API endpoint design
- `dependency-injection` — DI frameworks and patterns
- `testing-quality-coordination` — QA coordination

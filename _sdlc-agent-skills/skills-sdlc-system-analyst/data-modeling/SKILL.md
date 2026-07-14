---
name: data-modeling
description: Designing data models and ER diagrams. Use this skill for high-level data architecture strategy and coordination. For detailed implementation, refer to subskills: data-modeling-erd, data-modeling-normalization, data-modeling-indexing.
---

# Data Modeling (Orchestrator)

> **Meta:** v1.1.0 | 05-07-2026
> **Decomposed:** This skill has been decomposed into focused subskills for better maintainability.

## Purpose

High-level orchestrator for data modeling. Provides references to decomposed subskills for ERD design, normalization, and indexing strategy.

## When to Use

Use this skill:
- When planning overall data architecture strategy
- For coordinating data modeling concerns across teams
- When you need to identify which specialized subskill to activate
- During data model reviews and architecture discussions

## Subskills

| Concern | Subskill | Path |
|---------|----------|------|
| Entities, attributes, relationships, Mermaid erDiagram | `data-modeling-erd` | `skills-sdlc-system-analyst/data-modeling-erd/SKILL.md` |
| Normalization (1NF-3NF, BCNF) and denormalization | `data-modeling-normalization` | `skills-sdlc-system-analyst/data-modeling-normalization/SKILL.md` |
| Index types, composite/partial indexes, constraints | `data-modeling-indexing` | `skills-sdlc-system-analyst/data-modeling-indexing/SKILL.md` |

## Usage

For most data modeling tasks, activate one of the subskills directly:
- Visualizing database structure → `data-modeling-erd`
- Optimizing for integrity/performance → `data-modeling-normalization`
- Designing indexes and constraints → `data-modeling-indexing`

## Related Skills

- `sql-development` — writing SQL queries
- `api-design` — API design based on data model
- `nosql-design` — NoSQL schema design
- `c4-architecture` — system architecture considering data

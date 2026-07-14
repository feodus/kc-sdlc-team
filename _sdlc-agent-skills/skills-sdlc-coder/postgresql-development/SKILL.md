---
name: postgresql-development
description: PostgreSQL database development and optimization. Use this skill for high-level PostgreSQL strategy and coordination. For detailed implementation, refer to subskills: postgresql-schema-design, postgresql-query-optimization, postgresql-advanced-features.
---

# PostgreSQL Development (Orchestrator)

> **Meta:** v1.1.0 | 05-07-2026
> **Decomposed:** This skill has been decomposed into focused subskills for better maintainability.

## Purpose

High-level orchestrator skill for PostgreSQL development. Provides references to decomposed subskills for schema design, query optimization, and advanced features.

## When to Use

Use this skill:
- When planning overall PostgreSQL architecture and strategy
- For coordinating multiple PostgreSQL development concerns
- When you need to identify which specialized subskill to activate
- During initial database design discussions

## Quick Reference

- **Subskills:** `postgresql-schema-design`, `postgresql-query-optimization`, `postgresql-advanced-features`
- **Reference:** `references/postgresql-reference.md`
- **Checklists:** `references/checklists.md`
- **Config templates:** `assets/postgresql-config-templates.conf`
- **Migration example:** `assets/example-migration.sql`

## Usage

For most PostgreSQL tasks, activate one of the subskills directly:
- Designing tables and relationships → `postgresql-schema-design`
- Tuning slow queries → `postgresql-query-optimization`
- Implementing advanced server-side logic → `postgresql-advanced-features`

## Related Skills

- `data-modeling` — ERD design and normalization
- `sql-development` — writing complex SQL queries
- `database-optimization` — database performance tuning

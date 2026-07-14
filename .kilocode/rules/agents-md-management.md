---
title: "AGENTS.md Management Rule"
source: "Custom rule for automatic AGENTS.md management"
author: "KiloCode System"
published: ""
created: 2026-02-14
description: "Rule for automatic initialization and updates of AGENTS.md file as a concise navigator. Enforces modular knowledge system through skills and references."
version: "2.0.0"
tags:
  - "documentation"
  - "agents-md"
  - "auto-update"
  - "navigator"
---

> **Meta:** v2.0.0 | 05-07-2026

## Table of Contents

1. [Purpose](#purpose)
2. [When to Use](#when-to-use)
3. [Quick Start](#quick-start)
4. [Core Features](#core-features)
5. [Execution Process](#execution-process)
6. [Metadata](#metadata)
7. [Change Classification](#change-classification-for-agentsmd)
8. [Automation](#automation)
9. [Common Mistakes](#common-mistakes)
10. [Quality Check](#quality-check)
11. [Related Rules & Artifacts](#related-rules--artifacts)

---

# AGENTS.md Management Rule v2

## Purpose

This rule defines the process of automatically managing the `AGENTS.md` file as a **concise navigator**, aligned with modular knowledge architecture introduced in v1.33.0+.

**Core principle:** `AGENTS.md` is NOT the source of detailed knowledge. It is a lightweight entry point — a table of contents for AI agents — that references:

- `_sdlc-agent-skills/` — modular knowledge base (skills with `references/` and `assets/` subdirectories)
- `.kilocode/rules/` — behavioral rules
- `.kilo/agent/` — agent definitions and autoload skill lists
- `CHANGELOG.md` — separate versioned change log

The rule ensures AI agent documentation stays current by automatically initializing and updating `AGENTS.md` whenever changes occur in the project.

---

## Quick Start

| Situation | Action |
|-----------|--------|
| AGENTS.md doesn't exist | Create using the **Concise Navigator template** below |
| User requests update | Perform full project analysis, update metadata |
| New commits since last update | Determine change type → update relevant navigation sections |
| New skill added | Update `_sdlc-agent-skills/index.md` and AGENTS.md → Knowledge & Standards reference |
| Rule referenced in commit | Validate CHANGELOG.md entry and metadata update |

**Pre-commit checklist:**
- [ ] Metadata is current (date, commit, semver version)
- [ ] All required sections are present
- [ ] Links to skills registry (`_sdlc-agent-skills/index.md`) are valid
- [ ] Branch name is `main` (not `master`)

---

## When to Use

This rule is activated in the following cases:

- When first launching a project or if `AGENTS.md` doesn't exist
- When any changes occur in the project (adding dependencies, changing configurations, updating structure)
- When user explicitly requests documentation update (phrases like "update AGENTS.md", "update agents", "refresh agents-md", "sync agents")
- When starting a new task if `AGENTS.md` is missing or outdated (freshness check)
- When significant changes are detected in the git repository since last `AGENTS.md` update
- When new skills or capabilities are added to the project
- When `.kilocode/rules/` files are modified (requires AGENTS.md → Guidelines update)

---

## Core Features

### 1. Concise Navigator Structure

After v1.33.0, `AGENTS.md` is a **concise navigator**, NOT a monolith. The full template is available in `AGENTS.md` itself. The structure:

```
AGENTS.md
├── Metadata (header)        → auto-updated on every change
├── Project Overview         → static, updated on major changes
├── Vision                   → static, updated on milestones
├── Architecture             → compact, references skill details
├── Knowledge & Standards    → navigator links to skills + rules
├── Troubleshooting          → curated diagnostics
└── Contributing & Changelog → links to CHANGELOG.md
```

#### Required Sections (v2 — Concise Navigator)

1. **Metadata (Header)**
   - Last updated date and time (UTC+3)
   - Git branch name (`main` by default)
   - Commit hash (short form)
   - Document version (SemVer: `vMAJOR.MINOR.PATCH`)

2. **Project Overview**
   - Project name
   - Purpose (1–3 sentences)
   - Core functionality (bullet list)
   - Target audience
   - Problem statement (brief)
   - Solution (brief)

3. **Vision**
   - Current status (2–3 bullets)
   - Roadmap (numbered list, 3–5 items)
   - Recent changes (versioned by SemVer)

4. **Architecture**
   - Compact directory tree (with essential comments)
   - Agent Interaction Model table (SDLC flow)
   - Main components (short descriptions only; detail in skills)

5. **Knowledge & Standards (Navigator)**
   - Link to technical standards: `clean-architecture` skill → `references/general-standards.md`
   - Link to language rules: `.kilocode/rules/language-communication-rule.md`
   - Link to operational workflows: `kilo-config` skill → `references/repository-workflows.md`
   - Link to full skills registry: `_sdlc-agent-skills/index.md`
   - Link to conflict resolution: `.kilocode/rules/file-conflict-resolution-rule.md`

6. **Troubleshooting** (curated, not exhaustive)
   - 3–5 most common problems
   - Links to relevant skills for deeper troubleshooting

7. **Contributing & Changelog**
   - Change submission process
   - Commit requirements (refer to commit-eng/rus workflows)
   - Link to `CHANGELOG.md` (separate SemVer-tracked file)

**Note:** Sections like "Common Tasks", "Detailed Workflows", "Resources" are **removed**. Their content is now in skills and rules.

#### Concise Navigator Template (v2)

```markdown
# AGENTS.md — [Project Name]

> **Last Updated:** DD-MM-YYYY HH:MM:SS UTC+3 | Branch: main | Commit: HASH | Version: vA.B.C
> **Description:** [One-sentence project description for AI agents]

---

## Project Overview

### Project Name
[Name]

### Purpose
[1–3 sentences]

### Core Functionality
- [Feature 1]
- [Feature 2]

### Target Audience
- [Audience 1]

---

## Vision

### Current Status
- [Status 1]
- [Status 2]

### Roadmap
1. [Item 1]
2. [Item 2]

### Recent Changes
#### vA.B.C (DD-MM-YYYY)
- [Change 1]

---

## Architecture

### Project Structure
```[directory tree with comments]```

### Agent Interaction Model
| Phase | Primary Agent | Secondary Agents | Inputs | Outputs |
|-------|---------------|------------------|--------|---------|

### Main Components
- **[Component]:** [Short description] *(Full details: skill name)*

---

## Knowledge & Standards (Navigator)

### Technical Standards
- **Clean Architecture & Code Quality:** `clean-architecture` skill → `references/general-standards.md`
- **Language Communication:** `.kilocode/rules/language-communication-rule.md`
- **File Conflict Resolution:** `.kilocode/rules/file-conflict-resolution-rule.md`

### Operational Workflows
- **Git, Commits, Skills Creation, Sync, Cleanup:** `kilo-config` skill → `references/repository-workflows.md`

### Full Skills Reference
> Full registry of all 10 SDLC roles and their skills:
> → `_sdlc-agent-skills/index.md`

---

## Troubleshooting

| Problem | Cause | Solution |
|---------|-------|----------|
| [Problem] | [Cause] | [Step 1], then [tool/skill reference] |
| [Problem] | [Cause] | [Step 1], then [tool/skill reference] |

---

## Contributing & Changelog

### Change Submission Process
1. [Step 1]
2. [Step 2]

### Commit Requirements
- Use Conventional Commits format
- Reference plan/spec PRs for feature changes

### Changelog
> Full versioned history: → `CHANGELOG.md`

---
*Last Updated: DD-MM-YYYY HH:MM:SS UTC+3*
```

---

### 2. Automatic Change Tracking

The rule should automatically track the following types of changes. Map them to AGENTS.md sections and skill files.

#### Tracked Change Types

| Change Type | Files Affected | AGENTS.md Section | Skill/Artifact to Update |
|-------------|----------------|-------------------|--------------------------|
| Adding new skill | `_sdlc-agent-skills/skills-<role>/<name>/SKILL.md` | Knowledge & Standards | `_sdlc-agent-skills/index.md` + agent `.kilo/agent/*.md` |
| Dependency added | `requirements.txt`, `package.json`, etc. | Architecture → Tech Stack (compact) | Relevant skills in registry |
| Config change | `.yml`, `.json`, `.toml` | Architecture (if structural) | Dev/Ops skills |
| Code structure | `src/`, new module | Architecture (compact tree) | `clean-architecture` skill |
| AGENTS.md change | `AGENTS.md` itself | — | Self-reference, metadata only |
| New rule added | `.kilocode/rules/*.md` | Knowledge & Standards → Rules | Update list of rules in navigator |
| Agent change | `.kilo/agent/*.md` | Knowledge & Standards | Verify skills list matches actual skill folders |
| CHANGELOG update | `CHANGELOG.md` | Vision → Recent Changes | Link already present |

---

### 3. Skill Knowledge Architecture (v2 Standard)

Per v1.33.0+ and optimization Stage 2, skills must follow this structure:

```
_sdlc-agent-skills/
├── index.md                          ← canonical registry (HERE)
├── skills-<role>/
│   ├── <skill-name>/
│   │   ├── SKILL.md                  ← YAML frontmatter + instructions
│   │   ├── references/               ← abstract concepts, standards
│   │   │   └── <doc>.md
│   │   └── assets/                   ← code examples, templates
│   │       └── <example>.<ext>
```

Rules for update:
1. **index.md is the source of truth** for roles and skills counts
2. Every new skill folder MUST be added to `index.md`
3. Every new skill folder MUST be listed in `.kilo/agent/<agent>.md` frontmatter skills array
4. Every new skill reference in agent files must have a matching physical folder in `skills-<role>/`
5. `CHANGELOG.md` in root tracks all skills additions separately

---

### 4. Semantic Versioning

All versioned artifacts use SemVer (`vMAJOR.MINOR.PATCH`):

| Artifact | Version Field | Increment On |
|----------|--------------|---------------|
| `AGENTS.md` | Metadata `Version:` | Major: restructure. Minor: new section/nav update. Patch: typo, link fix |
| `CHANGELOG.md` | File header | All changes |
| Skills (individual) | SKILL.md frontmatter (optional `version:`) | Skill content changes |
| This rule | frontmatter `version:` | Rule scope changes |

**Version examples:**
- `v1.33.0` — milestone release (optimization complete)
- `v1.33.1` — patch (fixed link in navigator)
- `v2.0.0` — breaking change (rule structure overhaul)

---

### 5. Behavioral Rules in `.kilocode/rules/`

The following rules are part of the behavioral system and **MUST** be referenced in `AGENTS.md` → Knowledge & Standards:

| Rule | Purpose | Location |
|------|---------|----------|
| `language-communication-rule.md` | Default Russian communication, documentation language | `.kilocode/rules/` |
| `file-conflict-resolution-rule.md` | Conflict detection + user confirmation before file writes | `.kilocode/rules/` |
| `agents-md-management.md` (this rule) | AGENTS.md lifecycle management | `.kilocode/rules/` |

**Note:** `sync-to-github-universal.md` is **NOT a behavioral rule** — it is technical documentation. It SHOULD NOT be in `.kilocode/rules/`. Move it to root level or `docs/sync/`.

---

### 6. Update Format

When updating `AGENTS.md`, the following requirements must be met:

#### Accuracy Requirements
- Use exact SemVer for all versions
- Specify exact paths to files (e.g., `_sdlc-agent-skills/skills-sdlc-coder/rest-api-design/SKILL.md`)
- Use `main` as branch name (not `master`)

#### Completeness Requirements
- This rule itself + AGENTS.md must be self-sufficient
- All knowledge links must be resolvable
- All referenced skills must have physical `SKILL.md` files

#### Structure Requirements
- Maintain heading hierarchy (H1 → H2 → H3)
- Use tables for structured data
- Apply Markdown formatting for code and commands
- Include metadata with date, commit, SemVer version

#### Consistency Requirements
- Maintain consistent styling
- `.kilocode/rules/` references use forward slashes and full paths from project root
- When adding a skill, update both `_sdlc-agent-skills/index.md` AND `.kilo/agent/<agent>.md`

---

### 7. Section Priorities

Most important sections for coding agents (in priority order):

1. **Knowledge & Standards (Navigator)** — primary lookup for standards and skills
2. **Architecture** — compact structure + agent interaction model
3. **Tech Stack** — exact versions (languages, frameworks, tools)
4. **Project Overview** — purpose and functionality
5. **Vision** — roadmap and recent changes

Sections NOT needed in AGENTS.md (moved to skills or separate files):
- ~~Detailed Workflows~~ → `kilo-config` skill → `references/repository-workflows.md`
- ~~Common Tasks~~ → individual skills
- ~~Detailed API docs~~ → `api-design` / `rest-api-design` skills
- ~~Resources~~ → `_sdlc-agent-skills/index.md`

---

### 8. Operation Modes

| Mode | Trigger | Action |
|------|---------|--------|
| **Background** | New task start, detected changes | Check AGENTS.md freshness → target update |
| **Active** | User request ("update AGENTS.md") | Full project analysis → update all affected navigator sections |
| **Initialization** | AGENTS.md missing | Create from concise navigator template → full analysis |
| **Skill Sync** | New/renamed skill folder | Update `_sdlc-agent-skills/index.md` + relevant agent file + navigator link |

---

## Execution Process

### On New Task Start

1. Check if `AGENTS.md` exists in project root
2. If file doesn't exist → **create** (perform initialization)
3. If file exists:
   - Check last update date from metadata
   - Get info about recent commits (`git log --oneline -5`)
   - Determine if there are changes since last update
   - If changes exist → **update relevant navigator sections only** (do NOT regenerate detailed content)

### On Explicit Update Request

1. Perform full project analysis:
   - Scan `_sdlc-agent-skills/` for new/modified/removed skill folders
   - Verify `.kilo/agent/*.md` list matches physical skill folders
   - Check `.kilocode/rules/` for rule changes needing navigator update
   - Verify `CHANGELOG.md` exists and is current
2. Determine all changes since last update (use `CHANGELOG.md`)
3. Update affected navigator sections
4. Update metadata (date, commit hash, SemVer version)
5. Verify all internal links resolve correctly

### On Skill Added/Removed/Renamed

1. Update `_sdlc-agent-skills/index.md`:
   - Add/remove/rename entry in appropriate role table
   - Update role skill count
   - Regenerate Total count
   - Bump index.md version in frontmatter/description
2. Update `.kilo/agent/<agent>.md`:
   - Add/remove/rename skill in frontmatter `skills:` array
   - Verify agent description still accurate
3. No structured content changes needed in `AGENTS.md` (navigator links to index.md)

### On Significant Changes Detected

1. Analyze change type against tracked change types table
2. Determine affected AGENTS.md sections
3. Perform targeted update (navigation only)
4. Update metadata (date, commit, SemVer version bump: minor or major as appropriate)

---

## Metadata

Each `AGENTS.md` file must contain metadata in the following format:

```markdown
> **Last Updated:** DD-MM-YYYY HH:MM:SS UTC+3 | Branch: main | Commit: HASH | Version: vA.B.C
```

Metadata update rules:
- Update on ANY content change
- Use current date and time (UTC+3 local timezone)
- Specify current git branch (always `main`)
- Specify last commit hash (short form: first 8 chars)
- Use **Semantic Versioning**: `vMAJOR.MINOR.PATCH`
  - `MAJOR` — structural changes, section reorganization
  - `MINOR` — new navigation links, new skill references
  - `PATCH` — typo fixes, link corrections, date updates

---

## Change Classification for AGENTS.md

| Change Type | Examples | Version Bump | Sections Affected |
|-------------|----------|--------------|-------------------|
| **Major** | Restructure to modular system, new root directory | v2.0.0 | All |
| **Minor** | New skill added, new rule in `.kilocode/rules/`, new nav link | vX.Y+1.0 | Knowledge & Standards |
| **Patch** | Typo fix, broken link, date/commit correction | vX.Y.Z+1 | Metadata |

---

## Automation

### Required Artifacts

| Artifact | Type | Purpose | Status |
|----------|------|---------|--------|
| `.kilocode/rules/agents-md-management.md` | KiloCode Rule | This document | ✅ Active |
| `.kilocode/rules/file-conflict-resolution-rule.md` | KiloCode Rule | File write conflict handling | ✅ Active |
| `.kilocode/rules/language-communication-rule.md` | KiloCode Rule | Language defaults | ✅ Active |
| `CHANGELOG.md` | Project File | Versioned change log | ✅ Required |
| `_sdlc-agent-skills/index.md` | Skills Registry | Canonical skill inventory | ✅ Required |

### Automation Mechanisms

1. **Pre-commit hook** (recommended):
   - Verify AGENTS.md metadata is current
   - Run `_sdlc-agent-skills/index.md` consistency check

2. **Scripts:**
   - `check-agents-freshness.sh` / `.ps1` — verify AGENTS.md metadata vs latest commit
   - `sync-skills-index.sh` / `.ps1` — rebuild `_sdlc-agent-skills/index.md` from filesystem
     - `scripts/sync/sync-to-github-universal.sh` — documented separately, NOT a KiloCode rule

3. **CI/CD:**
   - Freshness check in pipeline
   - Auto PRs with updates when skills change

### Script Paths (Cross-Platform)

- **Unix/macOS/Linux/Git Bash (Windows):** `.sh` scripts
- **Windows PowerShell:** `.ps1` equivalents
- Both should be maintained in `.kilocode/scripts/` or root scripts directory

---

## Common Mistakes

1. **Treating AGENTS.md as a knowledge vault** — keep it concise; move detail to skills
2. **Branch name "master"** — always use `main` in this project
3. **Not updating index.md** — when adding skills, always update `_sdlc-agent-skills/index.md` AND `.kilo/agent/*.md`
4. **Using old version format** — use SemVer (`v1.33.0` not `1.33`)
5. **Duplicate information** — store data in one place (skills or rules), reference from AGENTS.md
6. **Forgetting language-communication-rule.md link** — must be in Knowledge & Standards
 7. **Moving sync-to-github-universal.md into `.kilocode/rules/`** — it is NOT a behavioral rule; keep it in `sync/` (or root)
8. **Skipping CHANGELOG.md** — major/minor changes must appear there

---

## Important Notes

1. `AGENTS.md` is a **navigator**, not an encyclopedia — details live in skills and rules
2. Avoid external resource links unless absolutely necessary (links should be internal)
3. Update documentation in parallel with code/skill changes
4. Semantic versioning is mandatory for all tracked artifacts
5. Use examples for complex concepts but defer to skill files
6. Document non-obvious decisions in `CHANGELOG.md`, not in AGENTS.md

---

## Quality Check

After each `AGENTS.md` update, verify:

- [ ] All required sections are present (7 sections for v2 navigator)
- [ ] Metadata is current (date, commit hash, semver version, `main` branch)
- [ ] All knowledge links resolve: `_sdlc-agent-skills/index.md`, `.kilocode/rules/`, `.kilo/agent/`
- [ ] `CHANGELOG.md` exists and is referenced
- [ ] No broken internal links
- [ ] Code examples are correct
- [ ] Structure matches concise navigator template
- [ ] Information is consistent with `.kilocode/rules/` and actual AGENTS.md content
- [ ] No spelling errors

---

## Related Rules & Artifacts

| Artifact | Type | Relation |
|----------|------|----------|
| `.kilocode/rules/language-communication-rule.md` | Behavioral Rule | Referenced in Knowledge & Standards |
| `.kilocode/rules/file-conflict-resolution-rule.md` | Behavioral Rule | Referenced in Knowledge & Standards |
| `sync/SYNC.md` | Technical Documentation | NOT a rule; stored in `sync/` |
| `_sdlc-agent-skills/index.md` | Registry | Primary skills inventory |
| `CHANGELOG.md` | Project File | Separate SemVer-tracked change history |
| `.kilo/agent/*.md` | Agent Definitions | Skills autoload lists (frontmatter) |

---

*Last Updated: 05-07-2026 20:00:00 UTC+3*
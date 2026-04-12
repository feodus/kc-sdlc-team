---
title: "AGENTS.md Management Rule"
source: "Custom rule for automatic AGENTS.md management"
author:
published:
created: 2026-02-14
description: "Rule for automatic initialization and updates of AGENTS.md file"
tags:
  - "documentation"
  - "agents-md"
  - "auto-update"
---

> **Meta:** v1.4.0 | 12-04-2026

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

---

# Automatic AGENTS.md Management Rule

## Purpose

This rule defines the process of automatically managing the AGENTS.md file, similar to how Memory Bank works. The rule ensures that AI agent documentation stays current by automatically initializing and updating the AGENTS.md file whenever changes occur in the project.

## Quick Start

| Situation | Action |
|-----------|--------|
| AGENTS.md doesn't exist | Create using the template from "Initial Setup" section |
| User requests update | Perform full project analysis, update metadata |
| New commits since last update | Determine change type → update relevant sections |
| New skill added | Update Skills Reference section in AGENTS.md |

**Pre-commit checklist:**
- [ ] Metadata is current (date, commit, version)
- [ ] All required sections are present
- [ ] Links are valid

---

## When to Use

This rule is activated in the following cases:

- When first launching a project or if AGENTS.md doesn't exist
- When any changes occur in the project (adding dependencies, changing configurations, updating structure)
- When user explicitly requests documentation update (phrases like "update AGENTS.md", "update agents", "refresh agents-md")
- When starting a new task if AGENTS.md is missing or outdated
- When significant changes are detected in the git repository since last AGENTS.md update
- When new skills or capabilities are added to the project

## Core Features

### 1. Initial AGENTS.md Setup

If AGENTS.md doesn't exist or on first project launch, create it with the following structure:

#### Required Sections

1. **Metadata (Header)**
   - Last updated date
   - Git branch
   - Commit hash
   - Document version

2. **Project Overview**
   - Project name
   - Detailed purpose description
   - Problem statement
   - Proposed solution
   - Core functionality
   - Target audience

3. **Architecture**
   - Project structure (directory tree with explanations)
   - Main components and their purpose
   - File access control
   - Integration points

4. **Tech Stack**
   - Main technologies and versions
   - Development tools
   - Supported languages and frameworks
   - Development environment

5. **Guidelines**
   - Coding style
   - Documentation standards
   - Testing requirements
   - Security rules

6. **Workflows**
   - Main workflows
   - Commit instructions
   - Deployment processes

7. **Common Tasks**
   - Frequently performed tasks
   - Step-by-step instructions

8. **Troubleshooting**
   - Known issues
   - Solutions

9. **Contributing**
   - Change submission process
   - Commit requirements
   - Pull Request requirements

10. **Changelog**
    - Change history

11. **Resources**
    - Documentation links
    - External resources

#### Initialization Template

```markdown
# AGENTS.md — [Project Name]

> **Last Updated:** DD-MM-YYYY HH:MM:SS UTC+3 | Branch: master | Commit: HASH | Version: 1.0

> **Description:** [Brief project description for AI agents]

---

## Project Overview

### Project Name
[Full project name]

### Purpose
[Detailed project purpose]

### Problem Statement
[Problem the project solves]

### Solution
[How the project solves the problem]

### Core Functionality
- [Feature 1]
- [Feature 2]
- [Feature N]

### Target Audience
- [Audience 1]
- [Audience 2]

---

## Vision

### Current Status
- [Project status]
- [Number of implemented features]
- [Development activity]

### Roadmap
1. [Item 1]
2. [Item 2]
3. [Item N]

### Recent Changes
- [Change 1]
- [Change 2]

---

## Architecture

### Project Structure
```
[Directory tree with comments]
```

### Main Components

#### [Component 1]
**Location:** `path/to/component`

**Description:** [Component purpose]

**Key Features:**
- [Feature 1]
- [Feature 2]

#### [Component N]
[Similar structure]

### File Access Control
| Component | Allowed File Types |
|-----------|-------------------|
| [Module 1] | [.ext1, .ext2] |
| [Module N] | [.ext1, .ext2] |

---

## Tech Stack

### Main Technologies
- **[Technology 1]:** [Usage description]
- **[Technology 2]:** [Usage description]

### Development Tools
- [Tool 1]: [Purpose]
- [Tool 2]: [Purpose]

### Supported Languages and Frameworks
- [Language 1]: [Frameworks]
- [Language 2]: [Frameworks]

### Development Environment
- Operating System: [OS]
- IDE: [IDE]
- Additional Requirements: [Requirements]

---

## Guidelines

### Coding Style
- [Rule 1]
- [Rule 2]

### Documentation
- [Requirement 1]
- [Requirement 2]

### Testing
- [Requirement 1]
- [Requirement 2]

### Security
- [Rule 1]
- [Rule 2]

---

## Workflows

### [Workflow 1]
1. [Step 1]
2. [Step 2]
3. [Step N]

### [Workflow N]
[Similar structure]

---

## Common Tasks

### [Task 1]
**When to use:** [Description]

**Files to modify:**
- `path/to/file1` - [Change description]
- `path/to/file2` - [Change description]

**Steps:**
1. [Step 1]
2. [Step 2]
3. [Step N]

**Important notes:**
- [Note 1]
- [Note 2]

---

## Troubleshooting

### Problem: [Description]
**Cause:** [Cause]

**Solution:**
- [Step 1]
- [Step 2]

---

## Contributing

### Change Submission Process
1. [Step 1]
2. [Step 2]
3. [Step N]

### Commit Requirements
- [Type]: [Description]
- [Type]: [Description]

### Pull Request Requirements
- [Requirement 1]
- [Requirement 2]

---

## Changelog

### v1.0.0 (DD-MM-YYYY)
- Initial AGENTS.md version
- [Change description]

---

## Resources
- [Link 1]
- [Link 2]

---

*Last Updated: DD-MM-YYYY HH:MM:SS UTC+3*
```

### 2. Automatic Change Tracking

The rule should automatically track the following types of changes:

#### Tracked Change Types

1. **Adding new dependencies**
   - Changes in `package.json`, `requirements.txt`, `pom.xml`, `go.mod`, etc.
   - Need to update Tech Stack section

2. **Configuration changes**
   - Changes in config files (.yml, .json, .toml, etc.)
   - Need to update corresponding Architecture sections

3. **Project structure updates**
   - Adding/removing directories and files
   - Need to update Architecture → Project Structure section

4. **Adding new components**
   - New modules, services, libraries
   - Need to add description to Main Components section

5. **API changes**
   - New endpoints
   - Contract changes
   - Need to update API section (if applicable)

6. **Technology updates**
   - Version changes for languages, frameworks, libraries
   - Need to update Tech Stack section

#### Change Detection Process

1. **Git-based tracking:**
   - Get list of commits since last AGENTS.md update
   - Determine files changed in each commit
   - Map changes to corresponding AGENTS.md sections

2. **Filesystem analysis:**
   - Check for new directories
   - Discover new configuration files
   - Track dependency changes

3. **Change classification:**
   - Major: architecture changes, adding new components
   - Minor: config updates, parameter changes
   - Patch: fixes, documentation updates

### 3. Update Format

When updating AGENTS.md, the following requirements must be met:

#### Accuracy Requirements

- Use exact versions of all technologies
- Specify exact paths to files and directories
- Provide specific examples of commands and scripts

#### Completeness Requirements

- Include all necessary sections
- Provide exhaustive explanations for each component
- Ensure new agents can understand current project state

#### Structure Requirements

- Maintain heading hierarchy
- Use tables for structured data
- Apply Markdown formatting for code and commands
- Include metadata with date and commit

#### Consistency Requirements

- Maintain consistent styling
- Use consistent terminology
- Update all related sections when something changes

### 4. Section Priorities

Most important sections for coding agents (in priority order):

1. **Exact technology versions**
   - All programming languages with versions
   - All frameworks and libraries with versions
   - Development tools with versions

2. **Project structure**
   - Complete directory tree
   - Purpose of each directory
   - Key files in each directory

3. **Configuration files**
   - Main configurations
   - Environment parameters
   - Linter and formatter settings

4. **Setup and run instructions**
   - Environment requirements
   - Dependency installation commands
   - Run commands

5. **Available commands and scripts**
   - List of npm/yarn/pip scripts
   - Build commands
   - Test commands

6. **Architectural decisions**
   - Used patterns
   - Design principles
   - Constraints and conventions

### 5. Operation Modes

The rule works in the following modes:

#### Background Mode

- Automatic change tracking for each task
- Check for freshness on new task start
- Update when significant changes detected

#### Active Mode

- User explicitly requests update
- Forced update of all sections
- Complete documentation restructuring

#### Initialization Mode

- Create AGENTS.md from scratch
- Analyze project structure
- Fill in all sections

## Execution Process

### On New Task Start

1. Check if AGENTS.md exists in project root
2. If file doesn't exist → create (perform initialization)
3. If file exists:
   - Check last update date
   - Get info about recent commits
   - Determine if there are changes since last update
   - If changes exist → update relevant sections

### On Explicit Update Request

1. Perform full project analysis
2. Determine all changes since last update
3. Update all affected sections
4. Update metadata (date, commit)
5. Verify link integrity

### On Significant Changes Detected

1. Analyze change type
2. Determine affected sections
3. Perform targeted update
4. Update metadata

## Metadata

Each AGENTS.md file must contain metadata in the following format:

```markdown
> **Last Updated:** DD-MM-YYYY HH:MM:SS UTC+3 | Branch: master | Commit: HASH | Version: X.X
```

Metadata update rules:
- Update on any content change
- Use current date and time
- Specify current git branch
- Specify last commit hash
- Increment version on significant changes

## Change Classification for AGENTS.md

### Major Changes (require full update)

- Project architecture changes
- Adding new main component
- Tech stack change
- Significant project structure change

### Minor Changes (require partial update)

- Adding new dependency
- Configuration change
- Adding new API endpoint
- Technology version update

### Patch Changes (minimal update)

- Documentation fixes
- Adding examples
- Link updates
- Minor clarifications

## Automation

For process automation, the following can be used:

1. **Git hooks:**
   - pre-commit: check AGENTS.md freshness
   - post-commit: auto-update when significant changes present

2. **Scripts:**
   - check-agents-freshness.sh: check freshness
   - update-agents.sh: update documentation

3. **CI/CD:**
   - Freshness check in pipeline
   - Auto PRs with updates

## Common Mistakes

1. **Not updating metadata** — always specify current date, branch, and commit
2. **Skipping required sections** — all 11 sections must be present
3. **Using vague formulations** — use exact technology versions, specific paths
4. **Leaving broken links** — verify all links are valid after update
5. **Updating only part of related data** — when changing technology, update both Tech Stack and Architecture
6. **Copying outdated information** — verify freshness before copying from old versions
7. **Duplicating information** — store data in one place, use references

---

## Important Notes

1. AGENTS.md must be self-sufficient for new agents to understand the project
2. Avoid external resource links unless absolutely necessary
3. Update documentation in parallel with code changes
4. Maintain balance between completeness and readability
5. Use examples for complex concepts
6. Document non-obvious decisions and patterns

## Quality Check

After each AGENTS.md update, verify:

- [ ] All required sections are present
- [ ] Metadata is current
- [ ] Links are valid
- [ ] Code examples are correct
- [ ] Structure matches template
- [ ] Information is consistent
- [ ] No spelling errors
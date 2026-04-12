---
name: create-custom-agent
description: Create custom agents for KiloCode using the new .kilo/agent/ format with YAML frontmatter, permission system, and skills integration
---

# Skill: Creating Custom Agents for KiloCode

## Description

This skill provides step-by-step instructions for creating custom agents in KiloCode using the modern `.kilo/agent/*.md` format. It covers file structure, YAML frontmatter configuration, permission system, and best practices.

## When to use

Use this skill when you need to:
- Create a new custom agent for KiloCode
- Update an existing agent configuration
- Configure agent permissions and skill access
- Migrate from deprecated `.kilocodemodes` format

## New Agent Format (Recommended)

### File Location

Create agent files in `.kilo/agent/` directory:

```
.kilo/agent/
└── my-agent.md    # One agent per file
```

### Required Frontmatter Fields

| Field | Description |
|-------|-------------|
| `description` | When to use this agent |
| `mode` | `primary` / `subagent` / `all` |
| `permission` | Tool permissions (see below) |

### Optional Frontmatter Fields

| Field | Description |
|-------|-------------|
| `color` | Hex color for UI (e.g., `"#FF5733"`) |
| `skills` | List of skill names to activate |

### Example: Complete Agent

```yaml
---
description: A powerful coding agent with Python expertise
mode: primary
color: "#FF5733"
skills:
  - fastapi-development
  - python-project-setup
  - python-testing
permission:
  bash: allow
  edit:
    "*.py": allow
    "src/**": allow
  read:
    "*": allow
  glob:
    "*": allow
  grep:
    "*": allow
  task: allow
  webfetch: allow
  websearch: allow
  codesearch: allow
  external_directory: allow
---

# Python Developer Agent

You are an expert Python developer specializing in FastAPI, Django, and data processing.
```

## Permission System

### Permission Fields

| Tool | Description |
|------|-------------|
| `bash` | Command execution |
| `edit` | File editing |
| `read` | File reading |
| `glob` | File search |
| `grep` | Content search |
| `task` | Subagent tasks |
| `webfetch` | Web fetch |
| `websearch` | Web search |
| `codesearch` | Code search |
| `external_directory` | External directories |

### Permission Values

- `allow` - Allow access
- `deny` - Deny access
- `ask` - Ask for confirmation

### File Restrictions

Use glob patterns to restrict file access:

```yaml
permission:
  edit:
    "src/**": allow      # Allow src directory
    "*.{py,js}": allow   # Allow specific extensions
    "*": deny            # Deny everything else
```

## Skill Integration

### Adding Skills to Agent

1. Define skills in frontmatter:
```yaml
skills:
  - fastapi-development
  - django-development
  - react-nextjs-development
```

2. Configure skill paths in `kilo.json`:
```jsonc
{
  "skills": {
    "paths": [
      "./_sdlc-agent-skills/skills-sdlc-coder/"
    ]
  }
}
```

## Migration from Old Format

### Old Format (Deprecated)

```yaml
customModes:
  - slug: my-agent
    name: My Agent
    roleDefinition: ...
    groups:
      - read
      - edit
```

### New Format

```yaml
---
description: Agent description
mode: primary
permission:
  read: allow
  edit:
    "*": allow
---

# System prompt
```

## Agent Locations

| Scope | Path |
|-------|------|
| Project | `.kilo/agent/*.md` |
| Global | `~/.config/kilo/agent/*.md` |

## Configuration Precedence

1. **Project agents** (`.kilo/agent/*.md`)
2. **Global agents** (`~/.config/kilo/agent/*.md`)
3. **Default built-in agents**

**Note:** The old `.kilocodemodes` format is deprecated but still works for backward compatibility.

## Best Practices

1. **One agent per file** - Each agent in separate `.md` file
2. **Clear permissions** - Use glob patterns for file restrictions
3. **Minimal skills** - Only list skills the agent actually needs
4. **Versioning** - Update description with version and date
5. **Test agents** - Verify agent works after creation

## Common Issues

| Issue | Solution |
|-------|----------|
| Agent not appearing | Reload VS Code window |
| Permission denied | Check glob patterns |
| Skills not loading | Verify paths in `kilo.json` |

## Templates

### Minimal Agent

```yaml
---
description: Simple coding agent
mode: primary
permission:
  bash: allow
  edit:
    "*": allow
  read:
    "*": allow
---

# Agent Name

Your system prompt here.
```

### Read-Only Agent

```yaml
---
description: Code review agent
mode: primary
permission:
  read: allow
  glob: allow
  grep: allow
---

# Code Reviewer

You review code for issues.
```

### Mode-Specific Agent

```yaml
---
description: Subtask agent for data tasks
mode: subagent
permission:
  edit:
    "*.py": allow
  read:
    "*": allow
---

# Data Processing Agent

You process and analyze data.
```
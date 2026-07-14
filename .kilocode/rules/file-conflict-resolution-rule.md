---
title: "File Conflict Resolution Rule"
source: "Global rule for handling file conflicts with user confirmation"
author: "KiloCode System"
published: 
created: 2026-05-07
description: "Rule defines the process for resolving file conflicts with user confirmation options when attempting to write files that already exist"
tags:
  - "file-handling"
  - "conflict-resolution"
  - "user-confirmation"
  - "file-management"
---

> **Meta:** v1.0.0 | 07-05-2026

## Table of Contents

1. [Purpose](#purpose)
2. [Scope](#scope)
3. [Basic Principles](#basic-principles)
4. [Conflict Detection](#conflict-detection)
5. [Resolution Options](#resolution-options)
6. [User Confirmation Process](#user-confirmation-process)
7. [Implementation Control](#implementation-control)
8. [Examples](#examples)

---

# File Conflict Resolution Rule

## Purpose

This rule defines the standardized process for handling file conflicts when attempting to write files that already exist. The main goal is to ensure consistency in conflict resolution and provide users with clear options to resolve conflicts with explicit confirmation.

## Scope

The rule applies to all agents and subagents within any KiloCode projects when using file writing operations that may encounter existing files.

## Basic Principles

1. **Detection First**: Always detect file conflicts before attempting write operations
2. **User Choice**: Provide users with clear options for conflict resolution
3. **Explicit Confirmation**: Require explicit user confirmation before taking any action
4. **Transparency**: Clearly communicate what will happen with each option
5. **Safety**: Preserve user data by default, avoiding accidental loss

## Conflict Detection

### When to Check for Conflicts

1. Before using the `write` tool to create or overwrite a file
2. Before using the `edit` tool on files that may not exist
3. Before any operation that would modify the filesystem structure

### Conflict Detection Process

1. Use the `read` tool or `glob` tool to check if the target file exists
2. If the file exists, immediately halt the operation and initiate conflict resolution
3. Do not attempt to write or overwrite without explicit user permission

## Resolution Options

When a file conflict is detected, present the user with these standard options:

### Option 1: Use Different Filename
- **Action**: Add a version prefix or timestamp to the filename
- **Example**: `document.md` becomes `v2_document.md` or `document_20260507.md`
- **Result**: Preserves both the original file and creates the new file

### Option 2: Remove/Rename Existing File First
- **Action**: Delete or rename the existing file before proceeding
- **Sub-options**:
  - Delete the existing file permanently
  - Rename the existing file with a backup suffix (e.g., `document.md.bak`)
- **Result**: Original file is removed or archived, new file is created with the original name

### Option 3: Replace/Overwrite Existing File
- **Action**: Directly replace the existing file with the new content
- **Warning**: This will permanently delete the original file content
- **Result**: Original file is replaced with new content

### Option 4: Cancel Operation
- **Action**: Abort the file operation entirely
- **Result**: No changes are made to the filesystem

## User Confirmation Process

### Presentation Format

Present the options in a clear, structured format:

```
File Conflict Detected:
- Target file: [filename] already exists

Please choose one of the following options:
[1] Use different filename (add version prefix)
[2] Remove/rename existing file first
[3] Replace/overwrite existing file
[4] Cancel operation

Enter your choice (1-4):
```

### Detailed Option Descriptions

For each option, provide a detailed explanation:

1. **Use Different Filename**:
   - The new file will be saved with a modified name
   - The existing file will remain unchanged
   - Example: `[original_filename]` will become `[version_prefix]_[original_filename]`

2. **Remove/Rename Existing File First**:
   - Choose to either delete or rename the existing file
   - If renamed, it will have a `.bak` extension
   - The new file will be saved with the original name

3. **Replace/Overwrite Existing File**:
   - The existing file will be permanently deleted
   - The new file will be saved with the same name
   - WARNING: This action cannot be undone

4. **Cancel Operation**:
   - No files will be modified
   - The operation will be aborted

### Confirmation Requirement

1. Wait for explicit user input selecting one of the options
2. If the user input is invalid or unclear, ask again with clarification
3. Once a valid option is selected, confirm the choice with the user:
   ```
   You selected option [X]. Proceed with this action? (yes/no):
   ```

## Implementation Control

### Agent Self-Control

1. Agents must implement conflict detection before all file write operations
2. When a conflict is detected, agents must stop and request user input
3. Agents must not proceed with any file modification without explicit user confirmation
4. Agents should explain the consequences of each option clearly

### Error Handling

1. If user input is invalid, provide a clear error message and show options again
2. If user cancels the operation, cleanly exit the file operation without errors
3. If an error occurs during the execution of the chosen option, report it clearly

### Logging

1. Log all conflict detection events
2. Log the user's choice for audit purposes
3. Log the outcome of the operation

## Examples

### Example 1: Simple Document Creation Conflict

```
File Conflict Detected:
- Target file: project_plan.md already exists

Please choose one of the following options:
[1] Use different filename (add version prefix)
[2] Remove/rename existing file first
[3] Replace/overwrite existing file
[4] Cancel operation

Enter your choice (1-4): 1

You selected option 1. Proceed with this action? (yes/no): yes

Saving file as v2_project_plan.md
```

### Example 2: Configuration File Overwrite

```
File Conflict Detected:
- Target file: .env already exists

Please choose one of the following options:
[1] Use different filename (add version prefix)
[2] Remove/rename existing file first
[3] Replace/overwrite existing file
[4] Cancel operation

Enter your choice (1-4): 2

You selected option 2. Would you like to:
[a] Delete the existing file permanently
[b] Rename the existing file as .env.bak

Enter your choice (a/b): b

Renaming existing file to .env.bak and creating new .env file
```

### Example 3: Direct Replacement with Warning

```
File Conflict Detected:
- Target file: README.md already exists

Please choose one of the following options:
[1] Use different filename (add version prefix)
[2] Remove/rename existing file first
[3] Replace/overwrite existing file
[4] Cancel operation

Enter your choice (1-4): 3

WARNING: This will permanently delete the existing README.md file.
Are you sure you want to replace it? (yes/no): yes

Replacing existing README.md with new content
```
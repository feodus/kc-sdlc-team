# Workflow: Clean Project Artifacts

You are an assistant that helps clean the `project_artifacts/` directory by removing all files while preserving the folder structure. Follow these steps precisely.

### 1. Check Directory Exists
- Use `execute_command` to run `ls -la project_artifacts`.
- If the directory does not exist, inform the user and stop the workflow.

### 2. Analyze Contents
- Use `execute_command` to run a recursive scan of `project_artifacts/` to list all files.
- Store the total count of files and directories.
- Do not modify anything yet.

### 3. Confirm with User
- Use `ask_followup_question` to confirm the cleanup.
- The question should:
  - State the target directory: `project_artifacts/`
  - Report the number of files found and number of directories
  - State that ALL files will be permanently deleted
  - State that hidden/system files will also be removed
  - State that the folder structure itself will be preserved
  - State this does NOT include git operations
- Provide three suggested replies:
    1. "Yes, proceed with cleanup."
    2. "No, cancel."
    3. "Show me the files to be deleted."

### 4. Execute Cleanup
- If the user chooses "Yes, proceed with cleanup":
  - Use `execute_command` to remove ALL files under `project_artifacts/` recursively, preserving directories.
  - Optional: remove empty parent directories only if they become empty, but keep the top-level `project_artifacts/` directory and all known subdirectories.
  - Hidden/system files (e.g., `.DS_Store`, `Thumbs.db`) must also be removed.

### 5. Verify Result
- Use `execute_command` to recursively list remaining files in `project_artifacts/`.
- Report:
  - Remaining file count (should be 0)
  - Preserved directory structure summary
  - Any errors encountered

### 6. Finish
- Inform the user that cleanup is complete.

### Prerequisites
- This workflow can be executed by any agent with filesystem permissions.
- Run from the project root.

### Behavior Notes
- This is a destructive operation. Deleted files are permanently removed.
- No files will be moved to trash or recycle bin.
- No git operations are performed automatically.
- `.gitkeep` is NOT created automatically.
- No files are excluded from deletion.

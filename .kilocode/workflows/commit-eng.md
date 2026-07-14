# Workflow: English Commit

You are an assistant that helps with creating Git commits. Follow these steps precisely.

### 1. Check for Changes
- Use `execute_command` to run `git status --porcelain`.
- If the output is empty, inform the user that there are no changes to commit and stop the workflow.

### 2. Get Diffs
- Use `execute_command` to run `git add . && git diff --staged` to stage all files and get the diff.
- Store the output of the diff.

### 3. Generate Commit Message
- Based on the diff from the previous step, act as an expert developer and generate a concise, conventional commit message in English.
- The message MUST follow the Conventional Commits specification (e.g., `feat: add new login button`).
- **Do not ask the user for the message.** Generate it yourself based on the code changes.

### 4. Commit
- Use `execute_command` to run `git commit -m "{generated_message}"`.

### 5. Push to Remote
- After the commit is successful, automatically use `execute_command` to run `git push`.
- Report the outcome of the push to the user.

### 6. Finish
- Inform the user that the commit has been successfully created and pushed.
---
name: update-readmes
description: Scan all README files in the repository and update any that are outdated based on the current state of the codebase.
argument-hint: "[optional: specific file that changed]"
---

## Task

Find all README files in the current repository and ensure they accurately reflect the current state of the codebase.

## Steps

1. **Find all README files** in the repository using Glob (`**/README.md`)
2. **Read each README** and identify what it documents
3. **Verify accuracy** by reading the actual source files referenced in each README:
   - Directory structures and file listings
   - API references, commands, keymaps, or configuration options
   - Setup or installation instructions
   - Examples and code snippets
4. **If $ARGUMENTS is provided**, pay special attention to changes related to that file but still check all READMEs
5. **Update only the READMEs that have discrepancies** — do not modify READMEs that are already accurate
6. **Report** which READMEs were updated and which were already up to date

---
name: personalize
description: Create a new vault and rename it and publish it as your own private GitHub repo, while keeping the original primordial-brain template intact.
---

You are helping the user spin up a personalized copy of this primordial-brain vault. Follow these steps exactly, pausing for confirmation at each decision point.

1. Ask the user: "What would you like to name your brain? This will become the folder name and the GitHub repo name. (e.g. `work-brain`, `research-brain`)"

2. Wait for their answer. Validate that the name:
   - Contains only letters, numbers, hyphens, and underscores
   - Is not empty
   If invalid, explain why and ask again.

3. Confirm with the user before proceeding:
   "I'll do the following:
   - Rename this folder to `<new-name>`
   - Preserve the primordial-brain template remote as `upstream`
   - Create a new private GitHub repo named `<new-name>`
   - Push this vault to that repo as `origin`
   - The original `primordial-brain` folder stays untouched as your template.

   Ready to go? (yes/no)"

4. If the user says no — stop and tell them they can run `/personalize` again whenever they're ready.

5. If the user says yes — run the setup script by executing:
   ```
   bash .claude/scripts/setup-repo.sh <new-name>
   ```

6. Once the script completes successfully, tell the user:
   "Your brain has been personalized and pushed to GitHub.

   **Next step:** Close Claude Code and reopen it pointing at the renamed folder (`<new-name>/`). All your skills and settings will be waiting for you there.

   The original `primordial-brain` folder is still intact — clone or copy it any time to spin up another brain."

If the script fails, show the error output and suggest the user check:
- They have the `gh` CLI installed and authenticated (`gh auth status`)
- The folder name isn't already taken on GitHub
- They have write access to create repos under their account

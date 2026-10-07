# GitHub MCP
Use GitHub MCP for GitHub repository operations.
## Rules
* Use GitHub MCP for repository, branch, commit, PR, issue, and Actions operations.
* Use Karate MCP for Karate test execution and validation.
* Read existing GitHub state before modifying it.
* Inspect only the files/state required for the task.
* Write only when the requested change is explicit.
* Validate changes/tests before creating a PR.
* Never auto-merge PRs.
* Do not delete repositories/branches or change security/settings unless explicitly requested.
* Never expose or store GitHub credentials.
## Workflow
READ → PLAN → VALIDATE → WRITE → REPORT

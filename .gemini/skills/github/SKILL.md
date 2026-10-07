---
name: github
description: Use GitHub MCP for repository, branch, commit, PR, issue, and Actions operations.
---

# GitHub

Use GitHub MCP for GitHub operations.

Rules:
- Read existing GitHub state before modifying.
- Use Karate MCP for Karate test execution and validation.
- Inspect only required files/state.
- Write only when explicitly requested.
- Validate before creating a PR.
- Never auto-merge.
- Never delete repositories/branches or change security/settings unless explicitly requested.
- Never expose or store credentials.

Workflow:
READ -> PLAN -> VALIDATE -> WRITE -> REPORT
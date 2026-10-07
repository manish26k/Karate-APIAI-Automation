# Karate AI Automation

## Role

You are an API automation agent.
Use Gemini for reasoning and Karate MCP for Karate knowledge.
Use Karate DSL for all API automation.

## Source of Truth

* `features/` = executable tests
* `reusable/` = shared Karate flows
* `test-data/` = test data
* `config/` = configuration support artifacts
* `plans/` = approved test plans
* `evidence/` = execution evidence
* `reports/` = execution reports
* `karate-config.js` = runtime configuration
* Git = source of truth

## Domains

* `auth`
* `user`
* `product`
* `cart`
* `e2e` = cross-domain business flows

## Before Generation

1. Understand the requirement.
2. Inspect existing related tests, reusable flows and test data.
3. Use Karate MCP for Karate syntax/patterns when needed.
4. Verify API endpoint, method, request and expected response before generating.
5. Reuse existing components before creating new ones.

Never invent API behavior, endpoints, schemas, locators, data or business rules.

## Test Rules

* Use native Karate DSL.
* Use `baseUrl` from `karate-config.js`.
* Keep test logic separate from test data.
* Use `read()` for external data where appropriate.
* Use `call` for reusable flows.
* Use `callonce` only for feature-scoped one-time setup.
* Use `match` for assertions.
* Use tags for execution classification.
* Do not duplicate tests for different suites.
* Do not use another HTTP client.
* Do not add arbitrary sleeps or retries.
* Retry only when eventual consistency requires it.

## Tags

Execution:
`@smoke` `@regression` `@integration` `@e2e`

Domain:
`@auth` `@user` `@product` `@cart`

Folder = domain.
Tag = execution classification.

## Generation
Create the smallest valid Karate artifact that satisfies the requirement.
Do not rewrite working tests unnecessarily.
Do not introduce new dependencies, libraries, MCP servers or frameworks without explicit approval.

## Data and Configuration
- `karate-config.js` = runtime configuration.
- `karate.env` = environment selection.
- `test-data/<domain>/<env>/` = environment-specific test data.
- `reusable/` = reusable behavior.
- Features = test logic.
- Use `baseUrl` from configuration; never hard-code environment URLs.
- Use `read('classpath:...')` for shared external test data.
- JSON is the default test-data format.
- Keep request bodies outside feature files.
- Use runtime variables for tokens; never persist tokens as test data.
- Never put real secrets in Git.
- Read secrets from runtime environment/CI.
- Reuse existing data/configuration before creating new artifacts.
- Do not create a second configuration framework.
- `call` = normal reuse; `callonce` = feature-scoped setup; `callSingle` = suite-wide setup only.

## Validation
Every generated or modified test must be executed with Karate CLI before being considered complete.
Flow:
Generate → Execute → Analyze → Repair if required → Execute again.
Never declare success without execution evidence.

## Failure Healing

When a test fails:

1. Read the actual failure.
2. Identify the root cause.
3. Inspect relevant application/API behavior.
4. Make the smallest valid correction.
5. Re-execute.

Never weaken assertions or rewrite working tests merely to obtain PASS.

## CI Boundary

CI executes committed Karate tests with Karate CLI.
Normal CI execution must not depend on Gemini, an LLM or MCP.

## Change Boundary

You may create or modify:

* Karate features
* reusable Karate flows
* test data
* plans
* required evidence/report artifacts

Do not arbitrarily modify framework architecture, configuration, dependencies or tooling.

## Output

Keep generated artifacts minimal, deterministic, reusable and maintainable.
Prefer existing framework patterns over new patterns.

## GitHub

* Use the `github` skill for GitHub repository operations.
* Use Karate MCP for Karate execution/validation.
* Use GitHub MCP for repository, branch, commit, PR, issue, and Actions operations.
* Read/inspect before modifying.
* Validate changes before creating a PR.
* Never auto-merge.

## Git Workflow Rules
* Never modify or commit directly to `main`.
* Validate Karate changes before GitHub write actions.
* Use a feature branch for changes.
* Commit only validated requested changes.
* Create PR only after validation passes.
* Never merge PRs automatically.
* Require explicit user approval before commit, push, or PR creation.



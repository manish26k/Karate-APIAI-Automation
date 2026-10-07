# Auth Me Test Plan

- **Purpose:** Validate GET /auth/me authenticated user profile retrieval using reusable auth login flow.
- **Endpoint / Method:** GET /auth/me
- **Authentication:** Bearer token (obtained via `reusable/auth/login.feature`)
- **Environment:** dev (via karate-config.js / karate.env)
- **Test Data / Reuse:** Reuses `reusable/auth/login.feature` which loads `test-data/auth/dev/login.json`
- **Validations:** HTTP 200 status, `response.id` (#number), `response.username` (#string), `response.email` (#string), `response.firstName` (#string), `response.lastName` (#string)
- **Execution Command:** `karate.exe features/auth/me.feature`

# Karate AI Automation POC

## 1. POC Objective & Business Value
Demonstrate an AI-driven API test automation workflow combining natural-language requirements with native Karate DSL, specialized MCP context servers, and robust GitHub CI quality gates. This POC reduces test authoring friction while enforcing strict architectural standards, security scans, and deterministic test validation across API domains.

---

## 2. Architecture
- **Gemini CLI:** AI reasoning and orchestration assistant.
- **Karate MCP:** Model Context Protocol server providing domain expertise for Karate DSL syntax and assertions.
- **Karate DSL / CLI (`karate-2.1.3.jar`):** Native API test execution engine.
- **GitHub MCP:** Secure repository, branch, commit, issue, and PR operations.
- **GitHub Actions (`karate-ci.yml`):** Automated CI pipeline executing tests, Gitleaks security scans, and GitHub Pages reporting.

---

## 3. End-to-End Workflow
1. **Requirement Analysis:** Interpret natural-language API requirements or bug reports.
2. **Context Inspection:** Inspect existing domain features (`features/`), reusable flows (`reusable/`), test data (`test-data/`), and runtime configuration (`karate-config.js`).
3. **Artifact Generation:** Produce minimal, idiomatic Karate feature files and reusable components.
4. **Local Validation:** Execute tests locally using the Karate CLI JAR (`java -jar karate-2.1.3.jar run ...`) to verify behavioral correctness.
5. **PR Lifecycle:** Create feature branches, submit PRs, and orchestrate automated CI validation via GitHub MCP.
6. **CI Quality Gates:** Execute tests in GitHub Actions, run Gitleaks security scans on test reports with full repository history (`fetch-depth: 0`), and publish HTML test reports.
7. **Review & Merge:** Synchronize branches, verify passing checks, and merge into `main`.

---

## 4. Project Directory Overview
- `features/`: Executable Karate test suites structured by domain (`auth`, `user`, `product`, `cart`, `e2e`).
- `reusable/`: Shared Karate behavior flows (`call` targets).
- `test-data/`: Environment-specific test data payload JSON files (`dev/`, `qa/`).
- `config/`: Configuration support artifacts.
- `plans/`: Approved test plans and execution records (e.g., `github-ci-validation.md`).
- `evidence/`: Execution evidence and logs.
- `reports/`: Test execution report artifacts.
- `karate-config.js`: Runtime configuration (`baseUrl`).

---

## 5. Prerequisites & Verified Test Commands
- **Local Karate Execution Prerequisites:**
  - Java 21 runtime.
  - Karate CLI JAR (`karate-2.1.3.jar`).
- **Gemini & MCP Orchestration Prerequisites:**
  - Gemini CLI installation and configured MCP endpoints (Karate MCP & GitHub MCP).
- **Verified Local Test Execution Command:**
  ```bash
  java -jar karate-2.1.3.jar run -f html,junit:xml features/
  ```

---

## 6. CI/Security Checks & Published Reports
- **CI Pipeline (`karate-ci.yml`):** Executes Karate tests on Java 21 with zero-scenario regression detection.
- **Security Scan:** Integrates Gitleaks (`gitleaks/gitleaks-action@v2`) with full repository checkout (`fetch-depth: 0`) to scan downloaded test reports and repository history for exposed secrets.
- **Published Karate Reports:** [https://manish26k.github.io/Karate-APIAI-Automation/](https://manish26k.github.io/Karate-APIAI-Automation/)

---

## 7. Evidence of Completed Validation
- **PR #4:** Added product 4 regression test (`features/product/get_product_4.feature`), resolved repository checkout context for Gitleaks security scan, and successfully merged into `main`.
- **PR #5:** Documented verified CI execution results in `plans/github-ci-validation.md`, successfully validated via GitHub Actions, and merged into `main`.

---

## 8. Current Limitations & Human Governance
- **Deterministic Test Validation Required:** AI-generated or modified test artifacts must be executed and validated locally via Karate CLI prior to submission.
- **Human Review & Approval:** All PRs require passing CI checks and mandatory human review/approval before merging into production branches.

# Incremental task: composable audit policies

Copy `seed/` to an isolated work directory and implement this change there without rewriting or weakening old behavior. The baseline is an intentionally incomplete `auditor_core` multi-package auditor with 59 legacy behavior tests and fixed CLI report/exit contracts. Do not edit `seed/`, `frozen/**`, the hash manifest, or acceptance scripts in the task directory.

## Required API

Add package `auditor_core.policy` with immutable `AuditPolicy(minimum: Severity, enabledCodes: Array<String>, excludedPrefixes: Array<String>)`. Normalize duplicate/blank codes, `./` and trailing-slash prefixes, and sort all stored/output collections deterministically. Empty `enabledCodes` means every currently enabled rule; unknown codes never become runnable. Implement `allowsPath`, `allowsRule`, `allowsFinding`, and stable `summary()`.

Add `auditWithPolicy(units, policy)` and `renderPolicyReport(root, policy)` in `auditor_core.scan`. The scan pipeline must filter path before analysis, select rules before invoking analyzers, then apply the minimum severity. Do not render a full report and filter strings. Re-export policy and policy scan functions from the root facade. Add policy-aware `auditExitCode(findings, policy)` while preserving the one-argument API and byte-for-byte legacy CLI output.

All new and old tests must pass. Collections, rule order, and report/summary output are deterministic and cannot depend on hash-map or reflection iteration order. The supplied baseline intentionally lacks the production implementation, so its 17 new frozen tests should initially be red.

Run `python accept.py --project <work-directory>` for final acceptance. It restores frozen tests and fixtures into the work directory, builds the native library, checks the project scale, runs all 76 tests, validates the legacy CLI contracts, and executes the formatting/lint/XML quality gates.

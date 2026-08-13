package auditor_app

import auditor_core.policy.AuditPolicy
import auditor_core.Finding
import auditor_core.FindingSet
import auditor_core.Severity

@Test
func policyExitCodeHonorsThresholdTest(): Unit {
    let p = AuditPolicy(Severity.Fatal, [], [])
    let warn = FindingSet([Finding("R.NAM.01", "a.cj", "X", Severity.Warn, "m")])
    @Expect(auditExitCode(warn, p), 0)
    let fatal = FindingSet([Finding("R.SIZE.01", "a.cj", "X", Severity.Fatal, "m")])
    @Expect(auditExitCode(fatal, p), 4)
}

@Test
func policyExitCodeKeepsLegacySemanticsTest(): Unit {
    let p = AuditPolicy(Severity.Fatal, ["R.NAM.01"], [])
    let fatal = FindingSet([Finding("R.SIZE.01", "a.cj", "X", Severity.Fatal, "m")])
    @Expect(auditExitCode(fatal), 4)
    @Expect(auditExitCode(fatal, p), 0)
}

@Test
func policyExitCodeEmptyFindingsTest(): Unit {
    @Expect(auditExitCode(FindingSet([]), AuditPolicy(Severity.Info, [], [])), 0)
}

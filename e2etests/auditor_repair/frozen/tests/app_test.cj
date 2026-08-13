package auditor_app

import auditor_core.Finding
import auditor_core.FindingSet
import auditor_core.Severity

@Test
func auditExitCodeCleanTest(): Unit {
    @Expect(auditExitCode(FindingSet([])), 0)
    let warnOnly = FindingSet([Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase")])
    @Expect(auditExitCode(warnOnly), 0)
}

@Test
func auditExitCodeFatalTest(): Unit {
    let fatal = FindingSet(
        [
            Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker"),
            Finding("R.SIZE.01", "c.cj", "unit", Severity.Fatal, "declaration budget exceeded")
        ]
    )
    @Expect(auditExitCode(fatal), 4)
}

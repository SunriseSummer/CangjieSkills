package auditor_core

import auditor_core.policy.AuditPolicy
import auditor_core.model.Severity

@Test
func facadePolicyReexportTest(): Unit {
    let p = AuditPolicy(Severity.Warn, ["R.NAM.01"], [])
    @Expect(p.allowsRule("R.NAM.01"), true)
}

@Test
func facadePolicyConvenienceEntryTest(): Unit {
    let p = AuditPolicy(Severity.Fatal, [], [])
    @Expect(auditWithPolicy(loadUnits("fixtures/sources"), p).size, 1)
}

@Test
func facadePolicyConvenienceReportTest(): Unit {
    let p = AuditPolicy(Severity.Info, [], [])
    @Expect(renderPolicyReport("fixtures/sources", p).contains("policy "), true)
}

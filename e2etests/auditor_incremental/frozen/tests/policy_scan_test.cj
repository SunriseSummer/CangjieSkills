package auditor_core.scan

import auditor_core.policy.AuditPolicy
import auditor_core.model.Severity

@Test
func policyAuditEmptyRuleSetMatchesAuditAllTest(): Unit {
    let p = AuditPolicy(Severity.Info, [], [])
    @Expect(auditWithPolicy(loadUnits("fixtures/sources"), p).size, auditAll(loadUnits("fixtures/sources")).size)
}

@Test
func policyAuditSelectsRuleBeforeAnalysisTest(): Unit {
    let p = AuditPolicy(Severity.Info, ["R.NAM.01"], [])
    let f = auditWithPolicy(loadUnits("fixtures/sources"), p)
    @Expect(f.size, 1)
    @Expect(f[0].code, "R.NAM.01")
}

@Test
func policyAuditFiltersSeverityAfterRulesTest(): Unit {
    let p = AuditPolicy(Severity.Fatal, [], [])
    let f = auditWithPolicy(loadUnits("fixtures/sources"), p)
    @Expect(f.size, 1)
    @Expect(f[0].severity.label(), "fatal")
}

@Test
func policyAuditExcludesRelativePathPrefixTest(): Unit {
    let p = AuditPolicy(Severity.Info, [], ["gamma_legacy.cj"])
    @Expect(auditWithPolicy(loadUnits("fixtures/sources"), p).size, 4)
}

@Test
func policyReportContainsPolicySummaryTest(): Unit {
    let p = AuditPolicy(Severity.Warn, ["R.NAM.01"], [])
    let report = renderPolicyReport("fixtures/sources", p)
    @Expect(report.contains("policy min=warn,rules=R.NAM.01,exclude="), true)
    @Expect(report.contains("finding warn|R.NAM.01"), true)
}

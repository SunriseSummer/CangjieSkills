package auditor_core.policy

import auditor_core.model.Finding
import auditor_core.model.Severity

@Test
func policyNormalizesAndSortsTest(): Unit {
    let p = AuditPolicy(Severity.Warn, ["R.TODO.01", "R.NAM.01", "R.TODO.01"], ["./src/", "vendor", "src"])
    @Expect(p.summary(), "min=warn,rules=R.NAM.01|R.TODO.01,exclude=src|vendor")
}

@Test
func policyAllowsEmptyRulesTest(): Unit {
    let p = AuditPolicy(Severity.Info, [], [])
    @Expect(p.allowsRule("R.NAM.01"), true)
    @Expect(p.allowsRule("UNKNOWN"), false)
}

@Test
func policyUnknownRuleExplicitTest(): Unit {
    let p = AuditPolicy(Severity.Info, ["UNKNOWN", "R.NAM.01"], [])
    @Expect(p.allowsRule("UNKNOWN"), false)
    @Expect(p.allowsRule("R.NAM.01"), true)
}

@Test
func policyPathBoundaryTest(): Unit {
    let p = AuditPolicy(Severity.Info, [], ["src"])
    @Expect(p.allowsPath("src/a.cj"), false)
    @Expect(p.allowsPath("src"), false)
    @Expect(p.allowsPath("src2/a.cj"), true)
    @Expect(p.allowsPath("x/src/a.cj"), true)
}

@Test
func policyFindingCombinesAllChecksTest(): Unit {
    let p = AuditPolicy(Severity.Warn, ["R.NAM.01"], ["vendor"])
    @Expect(p.allowsFinding(Finding("R.NAM.01", "a.cj", "x", Severity.Warn, "m")), true)
    @Expect(p.allowsFinding(Finding("R.TODO.01", "a.cj", "x", Severity.Fatal, "m")), false)
    @Expect(p.allowsFinding(Finding("R.NAM.01", "vendor/a.cj", "x", Severity.Fatal, "m")), false)
    @Expect(p.allowsFinding(Finding("R.NAM.01", "a.cj", "x", Severity.Info, "m")), false)
}

@Test
func policySummaryStableAcrossInputOrderTest(): Unit {
    let a = AuditPolicy(Severity.Fatal, ["R.TODO.01", "R.NAM.01"], ["z", "a"])
    let b = AuditPolicy(Severity.Fatal, ["R.NAM.01", "R.TODO.01"], ["a", "z"])
    @Expect(a.summary(), b.summary())
}

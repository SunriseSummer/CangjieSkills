package auditor_core.rules

import auditor_core.model.AuditException
import auditor_core.model.Severity
import auditor_core.syntax.SourceUnit

let namingSource: String = "package s\npublic func Beta_helper(value: Int64): Int64 {\n    return value\n}\n\npublic func betaScale(value: Int64): Int64 {\n    return value\n}\n"
let bigSource: String = "package s\npublic class Big {\n    public var a: Int64 = 1\n    public var b: Int64 = 2\n    public var c: Int64 = 3\n\n    public func one(): Int64 {\n        return a\n    }\n\n    public func two(): Int64 {\n        return b\n    }\n\n    public func three(): Int64 {\n        return c\n    }\n}\n"
let todoSource: String = "package s\n// TODO(DOC): document\n// TODO(PERF): speed up\npublic func ok(): Unit {\n    return\n}\n"

@Test
func macroInjectedMembersTest(): Unit {
    @Expect(NamingRule().code(), "R.NAM.01")
    @Expect(NamingRule().severity().label(), "warn")
    @Expect(NamingRule().weight(), 2)
    @Expect(SizeRule().code(), "R.SIZE.01")
    @Expect(SizeRule().severity().label(), "fatal")
    @Expect(SizeRule().weight(), 5)
    @Expect(TodoRule().code(), "R.TODO.01")
    @Expect(TodoRule().severity().label(), "info")
    @Expect(TodoRule().weight(), 1)
    @Expect(LegacyRule().code(), "R.LEG.01")
    @Expect(LegacyRule().weight(), 1)
}

@Test
func ruleIdTest(): Unit {
    @Expect(NamingRule().id(), "naming")
    @Expect(SizeRule().id(), "size")
    @Expect(TodoRule().id(), "todo")
    @Expect(LegacyRule().id(), "legacy")
}

@Test
func ruleRegistryTest(): Unit {
    let registry = ruleRegistry()
    @Expect(registry.size, 3)
    @Expect(registry[0].id(), "naming")
    @Expect(registry[1].id(), "size")
    @Expect(registry[2].id(), "todo")
}

@Test
func ruleCodesTest(): Unit {
    @Expect(ruleCodes(), ["R.NAM.01", "R.SIZE.01", "R.TODO.01"])
}

@Test
func enabledRuleIdsTest(): Unit {
    @Expect(enabledRuleIds(), ["naming", "size", "todo"])
}

@Test
func tagOfTest(): Unit {
    @Expect(tagOf("naming").id, "naming")
    @Expect(tagOf("naming").enabled, true)
    @Expect(tagOf("legacy").enabled, false)
}

@Test
func tagOfUnknownTest(): Unit {
    var caught = "none"
    try {
        caught = tagOf("nope").id
    } catch (e: AuditException) {
        caught = "audit"
    }
    @Expect(caught, "audit")
}

@Test
func declarationBudgetTest(): Unit {
    @Expect(declarationBudget(), 6)
}

@Test
func namingRuleTest(): Unit {
    let findings = NamingRule().analyze(SourceUnit("s.cj", namingSource))
    @Expect(findings.size, 1)
    @Expect(findings[0].render(), "warn|R.NAM.01|s.cj|Beta_helper|expected lowerCamelCase")
}

@Test
func namingRuleCleanTest(): Unit {
    let findings = NamingRule().analyze(SourceUnit("s.cj", todoSource))
    @Expect(findings.size, 0)
}

@Test
func sizeRuleTest(): Unit {
    let findings = SizeRule().analyze(SourceUnit("big.cj", bigSource))
    @Expect(findings.size, 1)
    @Expect(findings[0].render(), "fatal|R.SIZE.01|big.cj|unit|declaration budget exceeded")
    @Expect(findings[0].severity.rank(), 2)
}

@Test
func sizeRuleUnderBudgetTest(): Unit {
    @Expect(SizeRule().analyze(SourceUnit("s.cj", namingSource)).size, 0)
    @Expect(SizeRule().analyze(SourceUnit("s.cj", todoSource)).size, 0)
}

@Test
func todoRuleTest(): Unit {
    let findings = TodoRule().analyze(SourceUnit("t.cj", todoSource))
    @Expect(findings.size, 2)
    @Expect(findings[0].symbol, "DOC")
    @Expect(findings[1].symbol, "PERF")
    @Expect(findings[1].render(), "info|R.TODO.01|t.cj|PERF|unresolved marker")
}

@Test
func legacyRuleNeverFiresTest(): Unit {
    @Expect(LegacyRule().analyze(SourceUnit("s.cj", namingSource)).size, 0)
    @Expect(LegacyRule().analyze(SourceUnit("t.cj", todoSource)).size, 0)
    for (rule in ruleRegistry()) {
        @Expect(rule.id() == "legacy", false)
    }
}

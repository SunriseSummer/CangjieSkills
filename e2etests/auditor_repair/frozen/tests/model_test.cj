package auditor_core.model

@Test
func severityLabelTest(): Unit {
    @Expect(Severity.Info.label(), "info")
    @Expect(Severity.Warn.label(), "warn")
    @Expect(Severity.Fatal.label(), "fatal")
}

@Test
func severityRankTest(): Unit {
    @Expect(Severity.Info.rank(), 0)
    @Expect(Severity.Warn.rank(), 1)
    @Expect(Severity.Fatal.rank(), 2)
}

@Test
func findingRenderTest(): Unit {
    let finding = Finding("R.NAM.01", "beta_helper.cj", "Beta_helper", Severity.Warn, "expected lowerCamelCase")
    @Expect(finding.render(), "warn|R.NAM.01|beta_helper.cj|Beta_helper|expected lowerCamelCase")
    @Expect(finding.code, "R.NAM.01")
    @Expect(finding.path, "beta_helper.cj")
    @Expect(finding.symbol, "Beta_helper")
    @Expect(finding.message, "expected lowerCamelCase")
}

@Test
func findingSetSizeAndIndexTest(): Unit {
    let set = FindingSet(
        [
            Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker"),
            Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase")
        ]
    )
    @Expect(set.size, 2)
    @Expect(set[0].code, "R.TODO.01")
    @Expect(set[1].code, "R.NAM.01")
}

@Test
func findingSetOutOfRangeTest(): Unit {
    let set = FindingSet([Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker")])
    var caught = "none"
    try {
        let unused = set[3]
        caught = unused.code
    } catch (e: AuditException) {
        caught = "audit"
    }
    @Expect(caught, "audit")
}

@Test
func findingSetSortedTest(): Unit {
    let set = FindingSet(
        [
            Finding("R.TODO.01", "b.cj", "PERF", Severity.Info, "unresolved marker"),
            Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase"),
            Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker"),
            Finding("R.TODO.01", "a.cj", "DOC", Severity.Info, "unresolved marker")
        ]
    )
    let sorted = set.sorted()
    @Expect(sorted.codes(), ["R.NAM.01", "R.TODO.01", "R.TODO.01", "R.TODO.01"])
    @Expect(sorted[1].path, "a.cj")
    @Expect(sorted[1].symbol, "DOC")
    @Expect(sorted[2].symbol, "PERF")
    @Expect(sorted[3].path, "b.cj")
}

@Test
func findingSetFilterTest(): Unit {
    let set = FindingSet(
        [
            Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker"),
            Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase"),
            Finding("R.SIZE.01", "c.cj", "unit", Severity.Fatal, "declaration budget exceeded")
        ]
    )
    @Expect(set.filter(Severity.Info).size, 3)
    @Expect(set.filter(Severity.Warn).codes(), ["R.NAM.01", "R.SIZE.01"])
    @Expect(set.filter(Severity.Fatal).codes(), ["R.SIZE.01"])
}

@Test
func findingSetWeightTest(): Unit {
    let set = FindingSet(
        [
            Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase"),
            Finding("R.SIZE.01", "c.cj", "unit", Severity.Fatal, "declaration budget exceeded"),
            Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker")
        ]
    )
    @Expect(set.weight(), 8)
    @Expect(FindingSet([]).weight(), 0)
}

@Test
func findingSetRenderTest(): Unit {
    let set = FindingSet(
        [
            Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase"),
            Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker")
        ]
    )
    let expected = "warn|R.NAM.01|b.cj|Bad_name|expected lowerCamelCase\ninfo|R.TODO.01|a.cj|PERF|unresolved marker"
    @Expect(set.render(), expected)
    @Expect(FindingSet([]).render(), "")
}

@Test
func summarizableExtendTest(): Unit {
    let items: Array<Finding> = [
        Finding("R.SIZE.01", "c.cj", "unit", Severity.Fatal, "declaration budget exceeded"),
        Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase"),
        Finding("R.TODO.01", "a.cj", "PERF", Severity.Info, "unresolved marker"),
        Finding("R.TODO.01", "a.cj", "DOC", Severity.Info, "unresolved marker")
    ]
    @Expect(items.summary(), "total=4,fatal=1,warn=1,info=2")
    let empty: Array<Finding> = []
    @Expect(empty.summary(), "total=0,fatal=0,warn=0,info=0")
}

@Test
func auditExceptionTest(): Unit {
    var message = "none"
    try {
        throw AuditException("boom")
    } catch (e: AuditException) {
        message = e.message
    }
    @Expect(message, "boom")
}

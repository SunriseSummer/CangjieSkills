package auditor_core

@Test
func facadeVersionTest(): Unit {
    @Expect(auditorVersion(), "1.1.3")
    @Expect(auditorTarget(), "windows-x64-cjnative")
}

@Test
func facadeModelReexportTest(): Unit {
    let finding = Finding("R.NAM.01", "b.cj", "Bad_name", Severity.Warn, "expected lowerCamelCase")
    let set = FindingSet([finding])
    @Expect(set.size, 1)
    @Expect(set[0].render(), "warn|R.NAM.01|b.cj|Bad_name|expected lowerCamelCase")
    @Expect(set.weight(), 2)
}

@Test
func facadeNativeReexportTest(): Unit {
    @Expect(nativeAbiVersion(), 10005)
    @Expect(nativeDigest("abc".toArray()), 1677554)
}

@Test
func facadeSyntaxReexportTest(): Unit {
    let unit = SourceUnit("x.cj", "package x\nfunc go(): Unit {}\n")
    @Expect(indexSource(unit.text).functions, ["go"])
    @Expect(lexemeCount(unit.text), 12)
}

@Test
func facadeRulesReexportTest(): Unit {
    @Expect(ruleCodes(), ["R.NAM.01", "R.SIZE.01", "R.TODO.01"])
    @Expect(declarationBudget(), 6)
}

@Test
func facadeScanReexportTest(): Unit {
    let units = loadUnits("fixtures/sources")
    @Expect(units.size, 4)
    @Expect(auditAll(units).size, 5)
}

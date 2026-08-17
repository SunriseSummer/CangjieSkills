package auditor_core.scan

import auditor_core.model.AuditException
import auditor_core.model.Severity
import std.fs.File

let fixtureRoot: String = "fixtures/sources"

@Test
func listSourceFilesTest(): Unit {
    @Expect(
        listSourceFiles(fixtureRoot),
        ["alpha_service.cj", "beta_helper.cj", "epsilon_clean.cj", "gamma_legacy.cj"]
    )
}

@Test
func listSourceFilesMissingRootTest(): Unit {
    var caught = "none"
    try {
        caught = "${listSourceFiles("fixtures/does-not-exist").size}"
    } catch (e: AuditException) {
        caught = "audit"
    }
    @Expect(caught, "audit")
}

@Test
func readSourceTest(): Unit {
    let unit = readSource(fixtureRoot, "epsilon_clean.cj")
    @Expect(unit.path, "epsilon_clean.cj")
    @Expect(unit.text.startsWith("package sample.epsilon"), true)
    @Expect(unit.text.size, 71)
}

@Test
func loadUnitsTest(): Unit {
    let units = loadUnits(fixtureRoot)
    @Expect(units.size, 4)
    @Expect(units[0].path, "alpha_service.cj")
    @Expect(units[3].path, "gamma_legacy.cj")
}

@Test
func todoMarkersTest(): Unit {
    @Expect(todoMarkers("// TODO(DOC): a\n// TODO(PERF): b\n"), ["DOC", "PERF"])
    let none: Array<String> = []
    @Expect(todoMarkers("no markers here\n"), none)
    @Expect(todoMarkers("TODO(lower) is not matched\n"), none)
}

@Test
func markerHistogramTest(): Unit {
    let histogram = markerHistogram(loadUnits(fixtureRoot))
    @Expect(histogram.size, 2)
    @Expect(histogram[0][0], "DOC")
    @Expect(histogram[0][1], 1)
    @Expect(histogram[1][0], "PERF")
    @Expect(histogram[1][1], 2)
}

@Test
func auditAllTest(): Unit {
    let findings = auditAll(loadUnits(fixtureRoot))
    @Expect(findings.size, 5)
    @Expect(findings.weight(), 10)
    @Expect(findings.filter(Severity.Fatal).size, 1)
    @Expect(findings[0].render(), "warn|R.NAM.01|beta_helper.cj|Beta_helper|expected lowerCamelCase")
    @Expect(findings[1].render(), "fatal|R.SIZE.01|gamma_legacy.cj|unit|declaration budget exceeded")
    @Expect(findings[4].render(), "info|R.TODO.01|beta_helper.cj|PERF|unresolved marker")
}

@Test
func ignoresNonCangjieFilesTest(): Unit {
    for (unit in loadUnits(fixtureRoot)) {
        @Expect(unit.path.endsWith(".cj"), true)
    }
    let findings = auditAll(loadUnits(fixtureRoot))
    @Expect(findings.size, 5)
    for (code in findings.codes()) {
        @Expect(code.startsWith("R."), true)
    }
    for (finding in [findings[0], findings[1], findings[2], findings[3], findings[4]]) {
        @Expect(finding.path.endsWith(".cj"), true)
        @Expect(finding.symbol == "IGNORED", false)
    }
    for (entry in markerHistogram(loadUnits(fixtureRoot))) {
        @Expect(entry[0] == "IGNORED", false)
    }
}

@Test
func renderReportGoldenTest(): Unit {
    let expected = String.fromUtf8(File.readFrom("fixtures/expected/report.txt"))
    let actual = renderReport(fixtureRoot)
    @Expect(actual, expected)
    @Expect(actual.endsWith("\n"), true)
    @Expect(actual.split("\n", removeEmpty: true).size, 16)
}

@Test
func renderReportShapeTest(): Unit {
    let lines = renderReport(fixtureRoot).split("\n", removeEmpty: true)
    @Expect(lines[0], "auditor 1.1.3 windows-x64-cjnative")
    @Expect(lines[1], "abi 10005")
    @Expect(lines[2], "rules R.NAM.01,R.SIZE.01,R.TODO.01")
    @Expect(lines[3], "units 4")
    @Expect(lines[4], "unit alpha_service.cj digest=540626055 lex=63 funcs=2 vars=2 classes=1 decls=5")
    @Expect(lines[7], "unit gamma_legacy.cj digest=293321898 lex=82 funcs=3 vars=3 classes=1 decls=7")
    @Expect(lines[13], "marker DOC=1")
    @Expect(lines[15], "summary total=5 fatal=1 warn=1 info=3 weight=10")
}

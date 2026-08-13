package cli_log_report

import std.env.*
import std.fs.*
import std.time.*

private func sampleText(): String {
    "2026-01-02 03:04:05 [INFO] api: ready\n" +
        "2026-01-02 03:04:06 [WARN] worker-1: retry\n" +
        "2026-01-02 03:04:07 [ERROR] api: failed"
}

private func expectLogError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected LogToolException")
    } catch (_: LogToolException) {
        @Assert(true)
    }
}

@Test
class TestLogParsing {
    @TestCase
    func parsesAllFields() {
        let entry = parseLogLine("2026-01-02 03:04:05 [INFO] api.v1: hello world")
        @Assert(entry.timestamp.format("yyyy-MM-dd HH:mm:ss"), "2026-01-02 03:04:05")
        @Assert(entry.level, "INFO")
        @Assert(entry.component, "api.v1")
        @Assert(entry.message, "hello world")
    }

    @TestCase
    func acceptsEmptyMessage() {
        @Assert(parseLogLine("2026-01-02 03:04:05 [WARN] worker: ").message, "")
    }

    @TestCase
    func rejectsUnknownLevel() {
        expectLogError { => parseLogLine("2026-01-02 03:04:05 [NOTICE] api: x") }
    }

    @TestCase
    func rejectsBadComponent() {
        expectLogError { => parseLogLine("2026-01-02 03:04:05 [INFO] bad component: x") }
    }

    @TestCase
    func rejectsImpossibleTimestamp() {
        expectLogError { => parseLogLine("2026-02-30 03:04:05 [INFO] api: x") }
    }

    @TestCase
    func rejectsTrailingJunk() {
        expectLogError { => parseLogLine("x 2026-01-02 03:04:05 [INFO] api: x") }
    }
}

@Test
class TestAnalysis {
    @TestCase
    func countsValidAndMatched() {
        let report = analyzeText(sampleText())
        @Assert(report.valid, 3)
        @Assert(report.matched, 3)
        @Assert(report.invalid, 0)
        @Assert(report.levelCount("INFO"), 1)
        @Assert(report.levelCount("WARN"), 1)
        @Assert(report.levelCount("ERROR"), 1)
    }

    @TestCase
    func appliesMinimumLevel() {
        let report = analyzeText(sampleText(), minLevel: "WARN")
        @Assert(report.valid, 3)
        @Assert(report.matched, 2)
        @Assert(report.levelCount("INFO"), 0)
    }

    @TestCase
    func appliesFullComponentRegex() {
        let report = analyzeText(sampleText(), componentPattern: "api")
        @Assert(report.matched, 2)
        @Assert(report.componentCount("api"), 2)
        @Assert(report.componentCount("worker-1"), 0)
    }

    @TestCase
    func appliesInclusiveTimeWindow() {
        let boundary = DateTime.parse("2026-01-02 03:04:06", "yyyy-MM-dd HH:mm:ss")
        let report = analyzeText(sampleText(), since: Some(boundary), until: Some(boundary))
        @Assert(report.matched, 1)
        @Assert(report.levelCount("WARN"), 1)
    }

    @TestCase
    func findsChronologicalExtremes() {
        let text = "2026-01-02 03:04:07 [ERROR] z: later\n" +
            "2026-01-02 03:04:05 [INFO] a: earlier"
        let report = analyzeText(text)
        @Assert(report.first.getOrThrow().format("yyyy-MM-dd HH:mm:ss"), "2026-01-02 03:04:05")
        @Assert(report.last.getOrThrow().format("yyyy-MM-dd HH:mm:ss"), "2026-01-02 03:04:07")
    }

    @TestCase
    func strictModeRejectsInvalidLine() {
        expectLogError { => analyzeText("bad\n" + sampleText()) }
    }

    @TestCase
    func lenientModeCountsInvalidLine() {
        let report = analyzeText("bad\n\n" + sampleText(), strict: false)
        @Assert(report.valid, 3)
        @Assert(report.invalid, 1)
        @Assert(report.matched, 3)
    }

    @TestCase
    func noMatchesUsesNoneAndDash() {
        let report = analyzeText(sampleText(), minLevel: "ERROR", componentPattern: "missing")
        @Assert(report.first.isNone())
        @Assert(report.last.isNone())
        @Assert(report.render().contains("first=-\nlast=-"))
    }

    @TestCase
    func sortsComponentNames() {
        let names = analyzeText(sampleText()).componentNames()
        @Assert(names, ["api", "worker-1"])
    }

    @TestCase
    func renderIsDeterministic() {
        let expected = "valid=3\nmatched=2\ninvalid=0\n" +
            "first=2026-01-02 03:04:06\nlast=2026-01-02 03:04:07\n" +
            "level\tTRACE\t0\nlevel\tDEBUG\t0\nlevel\tINFO\t0\n" +
            "level\tWARN\t1\nlevel\tERROR\t1\ncomponent\tapi\t1\ncomponent\tworker-1\t1"
        @Assert(analyzeText(sampleText(), minLevel: "WARN").render(), expected)
    }

    @TestCase
    func rejectsInvalidMinimumLevel() {
        expectLogError { => analyzeText(sampleText(), minLevel: "NOTICE") }
    }

    @TestCase
    func rejectsInvalidRegex() {
        expectLogError { => analyzeText(sampleText(), componentPattern: "[") }
    }
}

@Test
class TestCliEnvironmentAndIo {
    @TestCase
    func readsEnvironmentDefault() {
        let key = "CJ_LOG_REPORT_TEST_LEVEL"
        removeVariable(key)
        try {
            setVariable(key, "WARN")
            let config = parseCli(["input.log"], envKey: key)
            @Assert(config.minLevel, "WARN")
            @Assert(config.outputPath, "-")
            @Assert(config.strict)
        } finally {
            removeVariable(key)
        }
    }

    @TestCase
    func explicitLevelOverridesEnvironment() {
        let key = "CJ_LOG_REPORT_TEST_OVERRIDE"
        removeVariable(key)
        try {
            setVariable(key, "WARN")
            @Assert(parseCli(["--level", "ERROR", "input.log"], envKey: key).minLevel, "ERROR")
        } finally {
            removeVariable(key)
        }
    }

    @TestCase
    func parsesAllCliOptions() {
        let config = parseCli([
            "--output", "report.txt", "--level", "DEBUG", "--component", "api.*",
            "--lenient", "--probe", "cmd.exe", "input.log"
        ])
        @Assert(config.inputPath, "input.log")
        @Assert(config.outputPath, "report.txt")
        @Assert(config.minLevel, "DEBUG")
        @Assert(config.componentPattern, "api.*")
        @Assert(!config.strict)
        @Assert(config.probeCommand, "cmd.exe")
    }

    @TestCase
    func preservesDoubleDashSemantics() {
        @Assert(parseCli(["--", "--looks-like-option"]).inputPath, "--looks-like-option")
    }

    @TestCase
    func rejectsMissingInput() {
        expectLogError { => parseCli(["--level", "INFO"]) }
    }

    @TestCase
    func rejectsUnknownOption() {
        expectLogError { => parseCli(["--unknown", "input.log"]) }
    }

    @TestCase
    func fileRoundTrip() {
        let input = Path("./.cli_log_report_input.txt")
        let output = Path("./.cli_log_report_output.txt")
        removeIfExists(input)
        removeIfExists(output)
        try {
            File.writeTo(input, sampleText().toArray())
            let report = analyzeFile(input.toString(), minLevel: "WARN")
            writeReport(output.toString(), report)
            @Assert(String.fromUtf8(File.readFrom(output)), report.render() + "\n")
        } finally {
            removeIfExists(input)
            removeIfExists(output)
        }
    }

    @TestCase
    func missingFileIsWrapped() {
        removeIfExists(Path("./.cli_log_report_missing.txt"))
        expectLogError { => analyzeFile("./.cli_log_report_missing.txt") }
    }

    @TestCase
    func capturesProbeOutput() {
        let result = runProbe("cmd.exe", ["/d", "/c", "echo", "local-ok"])
        @Assert(result.code, 0)
        @Assert(result.stdout.trimAscii(), "local-ok")
        @Assert(result.stderr, "")
    }

    @TestCase
    func capturesProbeExitCode() {
        let result = runProbe("cmd.exe", ["/d", "/c", "exit", "7"])
        @Assert(result.code, 7)
    }

    @TestCase
    func wrapsMissingProbeCommand() {
        expectLogError { => runProbe("definitely-not-a-real-command.exe", []) }
    }
}


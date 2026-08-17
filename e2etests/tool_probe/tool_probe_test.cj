package tool_probe

import std.env.*
import std.fs.*

private let TEST_KEY = "CJ_SKILL_TOOL_PROBE_TEST_8421"

private class MarkerException <: Exception {
    init() { super("marker") }
}

@Test
class ToolProbeTests {
    @TestCase func restoresMissingVariable() {
        removeVariable(TEST_KEY)
        let seen = ToolProbe.withVariable(TEST_KEY, "inside", { => getVariable(TEST_KEY).getOrThrow() })
        @Assert(seen, "inside")
        @Assert(getVariable(TEST_KEY).isNone())
    }

    @TestCase func restoresExistingVariable() {
        setVariable(TEST_KEY, "before")
        let seen = ToolProbe.withVariable(TEST_KEY, "inside", { => getVariable(TEST_KEY).getOrThrow() })
        @Assert(seen, "inside")
        @Assert(getVariable(TEST_KEY).getOrThrow(), "before")
        removeVariable(TEST_KEY)
    }

    @TestCase func restoresAfterException() {
        setVariable(TEST_KEY, "before")
        try {
            ToolProbe.withVariable<Unit>(TEST_KEY, "inside", { => throw MarkerException() })
            @Fail("expected MarkerException")
        } catch (_: MarkerException) {
            @Assert(getVariable(TEST_KEY).getOrThrow(), "before")
        }
        removeVariable(TEST_KEY)
    }

    @TestCase func capturesCompilerOutput() {
        let result = ToolProbe.compilerVersion()
        @Assert(result.exitCode, 0)
        @Assert(result.combined().contains("1.1.3"))
    }

    @TestCase func countsDeclarationsButNotComments() {
        let source = "package demo\nimport std.env.*\n  import std.fs.*\n// func ignored() {}\nfunc one() {}\n public func two() {}\n"
        let facts = ToolProbe.analyze(source)
        @Assert(facts.packages, 1)
        @Assert(facts.imports, 2)
        @Assert(facts.functions, 2)
    }

    @TestCase func readsAndAnalyzesFile() {
        let file = File.createTemp(getTempDirectory())
        let path = file.info.path
        file.close()
        try {
            File.writeTo(path, "package saved\nfunc load() {}\n".toArray())
            let facts = ToolProbe.analyzeFile(path)
            @Assert(facts.packages, 1)
            @Assert(facts.imports, 0)
            @Assert(facts.functions, 1)
        } finally {
            removeIfExists(path)
        }
    }
}

package scoreboard

private func expectScoreError(action: () -> Unit): Unit {
    try { action(); @Fail("expected ScoreException") } catch (_: ScoreException) { @Assert(true) }
}

@Test
class ScoreboardTests {
    @TestCase func startsEmpty() { let b = Scoreboard(); @Assert(b.ranking().size, 0); @Assert(b.render(), ""); @Assert(b.project("none").isNone()) }
    @TestCase func aggregatesOneProject() { let b = Scoreboard(); b.add(Submission("core", "ada", BuildState.Passed, 12, 1)); b.add(Submission("core", "bob", BuildState.Failed, 8, 2)); let s = b.project("core").getOrThrow(); @Assert(s.passed, 1); @Assert(s.failed, 1); @Assert(s.totalDurationMs, 20); @Assert(s.warnings, 3) }
    @TestCase func ownersAreUniqueAndSorted() { let b = Scoreboard(); b.add(Submission("core", "zoe", BuildState.Passed, 1, 0)); b.add(Submission("core", "ada", BuildState.Passed, 1, 0)); b.add(Submission("core", "zoe", BuildState.Skipped, 0, 0)); @Assert(b.project("core").getOrThrow().owners, ["ada", "zoe"]) }
    @TestCase func parsesTextAndComments() { let b = Scoreboard(); b.ingest("# build\n\n core | Ada | PASSED | 12 | 1\ncore|Bob|skipped|0|0\n"); let s = b.project("core").getOrThrow(); @Assert(s.passed, 1); @Assert(s.skipped, 1) }
    @TestCase func rankingUsesBusinessKeys() { let b = Scoreboard(); b.ingest("z|a|passed|20|0\nb|a|failed|1|0\na|a|passed|10|2\nc|a|passed|10|1\n"); let r = b.ranking(); @Assert(r.size, 4); @Assert(r[0].project, "z"); @Assert(r[1].project, "c"); @Assert(r[2].project, "a"); @Assert(r[3].project, "b") }
    @TestCase func projectSnapshotIsIndependent() { let b = Scoreboard(); b.add(Submission("core", "ada", BuildState.Passed, 1, 0)); let first = b.project("core").getOrThrow(); b.add(Submission("core", "bob", BuildState.Passed, 1, 0)); @Assert(first.passed, 1); @Assert(first.owners, ["ada"]); @Assert(b.project("core").getOrThrow().passed, 2) }
    @TestCase func rankingSnapshotIsIndependent() { let b = Scoreboard(); b.add(Submission("core", "ada", BuildState.Passed, 1, 0)); let first = b.ranking(); b.add(Submission("extra", "bob", BuildState.Passed, 1, 0)); @Assert(first.size, 1); @Assert(b.ranking().size, 2) }
    @TestCase func invalidAddIsAtomic() { let b = Scoreboard(); b.add(Submission("core", "ada", BuildState.Passed, 1, 0)); expectScoreError { => b.add(Submission(" ", "bob", BuildState.Failed, 2, 0)); () }; expectScoreError { => b.add(Submission("core", "bob", BuildState.Failed, -1, 0)); () }; @Assert(b.project("core").getOrThrow().passed, 1); @Assert(b.project("core").getOrThrow().failed, 0) }
    @TestCase func invalidTextLineKeepsPriorRows() { let b = Scoreboard(); expectScoreError { => b.ingest("core|ada|passed|2|0\nbad|line\nnext|bob|passed|1|0"); () }; @Assert(b.project("core").isSome()); @Assert(b.project("next").isNone()) }
    @TestCase func rejectsInvalidFields() { let b = Scoreboard(); expectScoreError { => b.ingest("core||passed|1|0"); () }; expectScoreError { => b.ingest("core|ada|unknown|1|0"); () }; expectScoreError { => b.ingest("core|ada|passed|x|0"); () }; expectScoreError { => b.ingest("core|ada|passed|1|-1"); () }; @Assert(b.ranking().size, 0) }
    @TestCase func renderIsDeterministic() { let b = Scoreboard(); b.ingest("api|zoe|passed|7|1\napi|ada|skipped|0|0\ncli|bob|failed|3|2\n"); @Assert(b.render(), "api|1|0|1|7|1|ada,zoe\ncli|0|1|0|3|2|bob") }
    @TestCase func stateSupportsEquality() { @Assert(BuildState.Passed == BuildState.Passed); @Assert(BuildState.Passed != BuildState.Failed) }
}

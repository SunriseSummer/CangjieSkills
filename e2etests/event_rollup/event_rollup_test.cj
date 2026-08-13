package event_rollup

private func expectEventError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected EventException")
    } catch (_: EventException) {
        @Assert(true)
    }
}

@Test
class EventRollupTests {
    @TestCase func startsEmpty() { let rollup = EventRollup(); @Assert(rollup.total(), 0); @Assert(rollup.snapshot().size, 0); @Assert(rollup.render(), "") }
    @TestCase func ingestsEverySeverity() { let r = EventRollup(); r.ingest("api|info|2"); r.ingest("api|WARN|3"); r.ingest("worker|Error|1"); @Assert(r.count("api", Severity.Info), 2); @Assert(r.count("api", Severity.Warn), 3); @Assert(r.count("worker", Severity.Error), 1) }
    @TestCase func trimsFields() { let r = EventRollup(); r.ingest(" api | warn | 4 "); @Assert(r.count("api", Severity.Warn), 4) }
    @TestCase func accumulatesRepeatedKeys() { let r = EventRollup(); r.ingest("api|info|2"); r.ingest("api|info|5"); @Assert(r.count("api", Severity.Info), 7); @Assert(r.total(), 7) }
    @TestCase func ingestAllSkipsBlankAndComments() { let r = EventRollup(); r.ingestAll("# heading\n\n api|info|2\n  # note\napi|error|1\n"); @Assert(r.total(), 3) }
    @TestCase func snapshotUsesStableBusinessOrder() { let r = EventRollup(); r.ingestAll("z|error|1\na|error|3\na|info|2\na|warn|4\n"); let s = r.snapshot(); @Assert(s.size, 4); @Assert(s[0].service, "a"); @Assert(s[0].severity, Severity.Info); @Assert(s[1].severity, Severity.Warn); @Assert(s[2].severity, Severity.Error); @Assert(s[3].service, "z") }
    @TestCase func renderIsDeterministic() { let r = EventRollup(); r.ingestAll("worker|error|1\napi|warn|3\napi|info|2\n"); @Assert(r.render(), "api|INFO|2\napi|WARN|3\nworker|ERROR|1") }
    @TestCase func snapshotIsIndependent() { let r = EventRollup(); r.ingest("api|info|2"); let copy = r.snapshot(); r.ingest("api|info|3"); @Assert(copy.size, 1); @Assert(copy[0].count, 2); @Assert(r.count("api", Severity.Info), 5) }
    @TestCase func invalidFieldCountIsAtomic() { let r = EventRollup(); r.ingest("api|info|2"); expectEventError { => r.ingest("bad|line"); () }; @Assert(r.total(), 2) }
    @TestCase func invalidSeverityIsAtomic() { let r = EventRollup(); expectEventError { => r.ingest("api|fatal|2"); () }; @Assert(r.total(), 0) }
    @TestCase func invalidCountsFail() { let r = EventRollup(); expectEventError { => r.ingest("api|info|0"); () }; expectEventError { => r.ingest("api|info|-1"); () }; expectEventError { => r.ingest("api|info|two"); () }; @Assert(r.total(), 0) }
    @TestCase func emptyServiceFails() { let r = EventRollup(); expectEventError { => r.ingest("  |info|1"); () }; @Assert(r.total(), 0) }
}

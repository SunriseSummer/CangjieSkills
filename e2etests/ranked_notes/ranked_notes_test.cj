package ranked_notes

private func expectConfigError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected NoteConfigException")
    } catch (_: NoteConfigException) {
        @Assert(true)
    }
}

@Test
class RankedNotesTests {
    @TestCase func repeatedNotesPreserveInputOrder() {
        let plan = NoteCli.parse(["-n", "first:1", "--note=second:2"])
        @Assert(plan.notes.size, 2)
        @Assert(plan.notes[0].title, "first")
        @Assert(plan.notes[1].title, "second")
    }

    @TestCase func bareOptionalDefaultUsesTen() {
        @Assert(NoteCli.parse(["-n", "x", "--default"]).defaultPriority, 10)
        @Assert(NoteCli.parse(["-n", "x", "-d"]).notes[0].priority, 10)
    }

    @TestCase func explicitEmptyDefaultUsesTen() {
        @Assert(NoteCli.parse(["-n", "x", "--default="]).defaultPriority, 10)
    }

    @TestCase func attachedDefaultsAndLastValueWin() {
        let plan = NoteCli.parse(["--default=2", "-n", "x", "-d7"])
        @Assert(plan.defaultPriority, 7)
        @Assert(plan.notes[0].priority, 7)
    }

    @TestCase func finalDefaultAppliesToEarlierNotes() {
        let plan = NoteCli.parse(["-n", "early", "--default=9", "-n", "late"])
        @Assert(plan.notes[0].priority, 9)
        @Assert(plan.notes[1].priority, 9)
    }

    @TestCase func explicitPriorityOverridesDefault() {
        let plan = NoteCli.parse(["-n", "fixed:-3", "--default=9"])
        @Assert(plan.notes[0].priority, -3)
    }

    @TestCase func terminatorPreservesOptionLikeInputs() {
        let plan = NoteCli.parse(["-n", "x", "--", "--default=8", "-n"])
        @Assert(plan.defaultPriority, 0)
        @Assert(plan.inputs, ["--default=8", "-n"])
    }

    @TestCase func snapshotSortsPriorityThenTitle() {
        let plan = NoteCli.parse(["-n", "zeta:4", "-n", "alpha:4", "-n", "top:8"])
        let rows = plan.snapshot()
        @Assert(rows.size, 3)
        @Assert(rows[0][0], "top")
        @Assert(rows[0][1], 8)
        @Assert(rows[1][0], "alpha")
        @Assert(rows[2][0], "zeta")
    }

    @TestCase func rejectsInvalidDefaultAndPriority() {
        expectConfigError { => NoteCli.parse(["-n", "x", "--default=nope"]); () }
        expectConfigError { => NoteCli.parse(["-n", "x:nope"]); () }
    }

    @TestCase func rejectsEmptyTitleAndMissingNote() {
        expectConfigError { => NoteCli.parse(["-n", ":2"]); () }
        expectConfigError { => NoteCli.parse(["--default=2"]); () }
    }

    @TestCase func translatesArgoptErrors() {
        expectConfigError { => NoteCli.parse(["--unknown"]); () }
        expectConfigError { => NoteCli.parse(["--note"]); () }
    }

    @TestCase func arraysAndSnapshotsAreIndependent() {
        let notes = [RankedNote("a", 1)]
        let inputs = ["in"]
        let plan = NotePlan(notes, 0, inputs)
        notes[0] = RankedNote("changed", 2)
        inputs[0] = "changed"
        let first = plan.snapshot()
        first[0] = ("mutated", 99)
        @Assert(plan.notes[0].title, "a")
        @Assert(plan.inputs, ["in"])
        @Assert(plan.snapshot()[0][0], "a")
    }

    @TestCase func freshPlansDoNotShareStorage() {
        let first = NoteCli.parse(["-n", "a:1"])
        let second = NoteCli.parse(["-n", "b:2"])
        @Assert(first.notes[0].title, "a")
        @Assert(second.notes[0].title, "b")
    }
}

package cli_query

private func expectQueryError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected QueryException")
    } catch (_: QueryException) {
        @Assert(true)
    }
}

@Test
class QueryPlannerTests {
    @TestCase func parsesLongOptions() {
        let plan = QueryPlanner.parse(["--pattern=api", "--ignore-case", "--limit", "2", "a.log"])
        @Assert(plan.pattern, "api")
        @Assert(plan.ignoreCase)
        @Assert(plan.limit.getOrThrow(), 2)
        @Assert(plan.inputs, ["a.log"])
    }

    @TestCase func parsesShortOptions() {
        let plan = QueryPlanner.parse(["-p", "needle", "-i", "-n3", "one", "two"])
        @Assert(plan.pattern, "needle")
        @Assert(plan.ignoreCase)
        @Assert(plan.limit.getOrThrow(), 3)
        @Assert(plan.inputs, ["one", "two"])
    }

    @TestCase func terminatorPreservesOptionLikeInputs() {
        let plan = QueryPlanner.parse(["-p", "x", "--", "--limit", "7"])
        @Assert(plan.limit.isNone())
        @Assert(plan.inputs, ["--limit", "7"])
    }

    @TestCase func repeatedPatternUsesLastValue() {
        @Assert(QueryPlanner.parse(["-p", "old", "--pattern=new"]).pattern, "new")
    }

    @TestCase func missingPatternFails() {
        expectQueryError { => QueryPlanner.parse(["--ignore-case"]); () }
    }

    @TestCase func emptyPatternFails() {
        expectQueryError { => QueryPlanner.parse(["--pattern="]); () }
    }

    @TestCase func invalidLimitFails() {
        expectQueryError { => QueryPlanner.parse(["-p", "x", "--limit=oops"]); () }
    }

    @TestCase func nonPositiveLimitFails() {
        expectQueryError { => QueryPlanner.parse(["-p", "x", "-n", "0"]); () }
    }

    @TestCase func applyIsCaseSensitiveByDefault() {
        let plan = QueryPlanner.parse(["-p", "Api"])
        @Assert(plan.apply(["Api one", "api two", "xApi"]), ["Api one", "xApi"])
    }

    @TestCase func applyCanIgnoreUnicodeCase() {
        let plan = QueryPlanner.parse(["-p", "ä", "-i"])
        @Assert(plan.apply(["Äpfel", "Apfel", "spät"]), ["Äpfel", "spät"])
    }

    @TestCase func applyStopsAtLimit() {
        let plan = QueryPlanner.parse(["-p", "a", "--limit", "2"])
        @Assert(plan.apply(["a1", "a2", "a3"]), ["a1", "a2"])
    }

    @TestCase func returnedArraysAreIndependent() {
        let args = ["-p", "x", "input"]
        let plan = QueryPlanner.parse(args)
        args[2] = "changed"
        let lines = ["x1", "x2"]
        let result = plan.apply(lines)
        lines[0] = "changed"
        @Assert(plan.inputs, ["input"])
        @Assert(result, ["x1", "x2"])
    }
}

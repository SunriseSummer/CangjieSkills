package route_cli

private func expectCliError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected CliConfigException")
    } catch (_: CliConfigException) {
        @Assert(true)
    }
}

@Test
class RouteCliTests {
    @TestCase func parsesRepeatedRulesAndInputs() {
        let plan = RouteCli.parse(["-r", "error=^E", "--route=warn=warn", "a.log", "b.log"])
        @Assert(plan.rules.size, 2)
        @Assert(plan.rules[0].name, "error")
        @Assert(plan.rules[1].pattern, "warn")
        @Assert(plan.inputs, ["a.log", "b.log"])
    }

    @TestCase func optionalDefaultWithoutValueUsesOther() {
        @Assert(RouteCli.parse(["-r", "x=x", "--default"]).defaultTag.getOrThrow(), "other")
        @Assert(RouteCli.parse(["-r", "x=x", "-d"]).defaultTag.getOrThrow(), "other")
    }

    @TestCase func optionalDefaultAttachedValueAndLastWins() {
        let plan = RouteCli.parse(["-r", "x=x", "--default=first", "-dlast"])
        @Assert(plan.defaultTag.getOrThrow(), "last")
    }

    @TestCase func terminatorPreservesOptionLikeInput() {
        let plan = RouteCli.parse(["-r", "x=x", "--", "--default", "-i"])
        @Assert(plan.defaultTag.isNone())
        @Assert(plan.inputs, ["--default", "-i"])
    }

    @TestCase func firstMatchingRuleWins() {
        let plan = RouteCli.parse(["-r", "broad=a", "-r", "exact=abc"])
        @Assert(plan.classify(["abc"]), ["broad:abc"])
    }

    @TestCase func ignoreCaseUsesRegexFlag() {
        let plan = RouteCli.parse(["-r", "err=^error:[0-9]+$", "-i"])
        @Assert(plan.classify(["ERROR:42", "error:x"]), ["err:ERROR:42"])
    }

    @TestCase func unmatchedLinesUseDefaultOrDisappear() {
        @Assert(RouteCli.parse(["-r", "x=^x$"]).classify(["x", "y"]), ["x:x"])
        @Assert(RouteCli.parse(["-r", "x=^x$", "-dfallback"]).classify(["y"]), ["fallback:y"])
    }

    @TestCase func missingRuleFails() {
        expectCliError { => RouteCli.parse(["--default"]); () }
    }

    @TestCase func malformedRulesFail() {
        expectCliError { => RouteCli.parse(["-r", "missing"]); () }
        expectCliError { => RouteCli.parse(["-r", "=x"]); () }
        expectCliError { => RouteCli.parse(["-r", "x="]); () }
    }

    @TestCase func invalidRegexFailsDuringParse() {
        expectCliError { => RouteCli.parse(["-r", "broken=["]); () }
    }

    @TestCase func explicitEmptyDefaultUsesOther() {
        @Assert(RouteCli.parse(["-r", "x=x", "--default="]).defaultTag.getOrThrow(), "other")
    }

    @TestCase func argoptErrorsAreTranslated() {
        expectCliError { => RouteCli.parse(["--unknown"]); () }
        expectCliError { => RouteCli.parse(["--route"]); () }
    }

    @TestCase func arraysAreIndependent() {
        let args = ["-r", "x=x", "input"]
        let plan = RouteCli.parse(args)
        args[2] = "changed"
        let lines = ["x"]
        let result = plan.classify(lines)
        lines[0] = "changed"
        @Assert(plan.inputs, ["input"])
        @Assert(result, ["x:x"])
    }
}

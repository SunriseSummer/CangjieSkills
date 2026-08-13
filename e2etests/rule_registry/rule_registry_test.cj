package rule_registry

private func expectIllegalArgument(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected IllegalArgumentException")
    } catch (_: IllegalArgumentException) {
        @Assert(true)
    }
}

@Test
class RuleRegistryTests {
    @TestCase
    func prefixAllowsMatch() {
        @Assert(render(PrefixRule("api", "api/").decide("api/users")), "allow:\"prefix:api/\"")
    }

    @TestCase
    func prefixDeniesWhenConfigured() {
        @Assert(render(PrefixRule("secret", "secret/", allow: false).decide("secret/key")),
            "deny:\"prefix:secret/\"")
    }

    @TestCase
    func prefixAbstains() {
        @Assert(render(PrefixRule("api", "api/").decide("web/home")), "abstain")
    }

    @TestCase
    func lengthAllowsInclusiveBounds() {
        let rule = LengthRule("length", 2, 4)
        @Assert(render(rule.decide("ab")), "allow:\"length\"")
        @Assert(render(rule.decide("abcd")), "allow:\"length\"")
    }

    @TestCase
    func lengthDeniesOutsideBounds() {
        @Assert(render(LengthRule("length", 2, 4).decide("a")), "deny:\"length\"")
    }

    @TestCase
    func lengthRejectsNegativeMinimum() {
        expectIllegalArgument { => LengthRule("bad", -1, 2) }
    }

    @TestCase
    func lengthRejectsReversedRange() {
        expectIllegalArgument { => LengthRule("bad", 3, 2) }
    }

    @TestCase
    func registryStartsEmpty() {
        @Assert(RuleRegistry<PrefixRule>().size, 0)
    }

    @TestCase
    func registryPreservesOrderAndIndexing() {
        let rules = RuleRegistry<PrefixRule>()
        rules.add(PrefixRule("first", "a"))
        rules.add(PrefixRule("second", "b"))
        @Assert(rules.size, 2)
        @Assert(rules[0].name, "first")
        @Assert(rules[1].name, "second")
    }

    @TestCase
    func indexAssignmentReplacesInPlace() {
        let rules = RuleRegistry<PrefixRule>()
        rules.add(PrefixRule("old", "a"))
        rules[0] = PrefixRule("new", "b")
        @Assert(rules.size, 1)
        @Assert(rules[0].name, "new")
    }

    @TestCase
    func registryIsIterable() {
        let rules = RuleRegistry<PrefixRule>()
        rules.add(PrefixRule("one", "a"))
        rules.add(PrefixRule("two", "b"))
        var joined = ""
        for (rule in rules) {
            if (!joined.isEmpty()) { joined += "," }
            joined += rule.name
        }
        @Assert(joined, "one,two")
    }

    @TestCase
    func genericNamesFunctionUsesConstraint() {
        let rules = RuleRegistry<PrefixRule>()
        rules.add(PrefixRule("one", "a"))
        rules.add(PrefixRule("two", "b"))
        @Assert(namesOf<PrefixRule>(rules), ["one", "two"])
    }

    @TestCase
    func renderQuotesAllowReason() {
        @Assert(render(Decision.Allow("ok")), "allow:\"ok\"")
    }

    @TestCase
    func renderQuotesDenyReason() {
        @Assert(render(Decision.Deny("no")), "deny:\"no\"")
    }

    @TestCase
    func renderAbstain() {
        @Assert(render(Decision.Abstain), "abstain")
    }
}

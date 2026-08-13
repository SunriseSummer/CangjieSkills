package typed_policy_chain

private func expectIllegalArgument(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected IllegalArgumentException")
    } catch (_: IllegalArgumentException) {
        @Assert(true)
    }
}

private func expectIndexFailure(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected index failure")
    } catch (_: IndexOutOfBoundsException) {
        @Assert(true)
    }
}

@Test
class TypedPolicyChainTests {
    @TestCase func prefixAcceptsMatch() { @Assert(render(PrefixPolicy("api", "api/").evaluate("api/users")), "accept:[prefix:api/]") }
    @TestCase func prefixRejectsWhenConfigured() { @Assert(render(PrefixPolicy("secret", "secret/", accept: false).evaluate("secret/key")), "reject:[prefix:secret/]") }
    @TestCase func prefixSkipsMiss() { @Assert(render(PrefixPolicy("api", "api/").evaluate("web/home")), "skip") }
    @TestCase func emptyPrefixMatches() { @Assert(render(PrefixPolicy("all", "").evaluate("anything")), "accept:[prefix:]") }
    @TestCase func prefixDescription() { @Assert(PrefixPolicy("gateway", "gw/").description, "gateway") }

    @TestCase func sizeAcceptsMinimum() { @Assert(render(SizePolicy("size", 2, 4).evaluate("ab")), "accept:[size]") }
    @TestCase func sizeAcceptsMaximum() { @Assert(render(SizePolicy("size", 2, 4).evaluate("abcd")), "accept:[size]") }
    @TestCase func sizeRejectsBelow() { @Assert(render(SizePolicy("size", 2, 4).evaluate("a")), "reject:[size]") }
    @TestCase func sizeRejectsAbove() { @Assert(render(SizePolicy("size", 2, 4).evaluate("abcde")), "reject:[size]") }
    @TestCase func sizeAllowsZeroBounds() { @Assert(render(SizePolicy("empty", 0, 0).evaluate("")), "accept:[size]") }
    @TestCase func sizeRejectsNegativeMinimum() { expectIllegalArgument { => SizePolicy("bad", -1, 2); () } }
    @TestCase func sizeRejectsNegativeMaximum() { expectIllegalArgument { => SizePolicy("bad", -2, -1); () } }
    @TestCase func sizeRejectsReversedRange() { expectIllegalArgument { => SizePolicy("bad", 3, 2); () } }

    @TestCase func chainStartsEmpty() { @Assert(PolicyChain<PrefixPolicy>().size, 0) }
    @TestCase func chainPreservesOrder() { let chain = PolicyChain<PrefixPolicy>(); chain.add(PrefixPolicy("first", "a")); chain.add(PrefixPolicy("second", "b")); @Assert(chain[0].description, "first"); @Assert(chain[1].description, "second") }
    @TestCase func replacementPreservesSize() { let chain = PolicyChain<PrefixPolicy>(); chain.add(PrefixPolicy("old", "a")); chain[0] = PrefixPolicy("new", "b"); @Assert(chain.size, 1); @Assert(chain[0].description, "new") }
    @TestCase func chainIterationOrder() { let chain = PolicyChain<PrefixPolicy>(); chain.add(PrefixPolicy("one", "a")); chain.add(PrefixPolicy("two", "b")); var text = ""; for (policy in chain) { if (!text.isEmpty()) { text += "," }; text += policy.description }; @Assert(text, "one,two") }
    @TestCase func genericDescriptionsUseConstraint() { let chain = PolicyChain<PrefixPolicy>(); chain.add(PrefixPolicy("one", "a")); chain.add(PrefixPolicy("two", "b")); @Assert(descriptionsOf<PrefixPolicy>(chain), ["one", "two"]) }
    @TestCase func descriptionsReturnNewArray() { let chain = PolicyChain<PrefixPolicy>(); chain.add(PrefixPolicy("one", "a")); let values = descriptionsOf<PrefixPolicy>(chain); values[0] = "changed"; @Assert(descriptionsOf<PrefixPolicy>(chain), ["one"]) }
    @TestCase func readBelowRangeFails() { let chain = PolicyChain<PrefixPolicy>(); expectIndexFailure { => let _ = chain[-1] } }
    @TestCase func readAboveRangeFails() { let chain = PolicyChain<PrefixPolicy>(); expectIndexFailure { => let _ = chain[0] } }
    @TestCase func writeAboveRangeFails() { let chain = PolicyChain<PrefixPolicy>(); expectIndexFailure { => chain[0] = PrefixPolicy("x", "x") } }

    @TestCase func bracketedExtension() { @Assert("hello".bracketed(), "[hello]") }
    @TestCase func bracketedEmpty() { @Assert("".bracketed(), "[]") }
    @TestCase func renderAccept() { @Assert(render(Verdict.Accept("ok")), "accept:[ok]") }
    @TestCase func renderReject() { @Assert(render(Verdict.Reject("no")), "reject:[no]") }
    @TestCase func renderSkip() { @Assert(render(Verdict.Skip), "skip") }
    @TestCase func polymorphicEvaluate() { let policy: Policy = PrefixPolicy("api", "api/"); @Assert(render(policy.evaluate("api/x")), "accept:[prefix:api/]") }
}

package rule_app

import rule_facade.*

private func acceptedText(result: TextResult): String {
    match (result) {
        case Accept(value) => value
        case Reject(reason) => "rejected:${reason}"
    }
}

@Test
class WorkspaceRulePipelineTests {
    @TestCase func acceptHelperTrue(): Unit { @Assert(accepted(Accept<Int64>(1)), true) }
    @TestCase func acceptHelperFalse(): Unit { @Assert(accepted(Reject<Int64>("x")), false) }
    @TestCase func rejectReasonPresent(): Unit { @Assert(rejectedReason(Reject<Int64>("bad")).getOrThrow(), "bad") }
    @TestCase func rejectReasonAbsent(): Unit { @Assert(rejectedReason(Accept<Int64>(2)).isNone(), true) }
    @TestCase func trimName(): Unit { @Assert(TrimRule().name, "trim") }
    @TestCase func trimBothSides(): Unit { @Assert(acceptedText(TrimRule().apply("  hello\t")), "hello") }
    @TestCase func trimKeepsMiddle(): Unit { @Assert(acceptedText(TrimRule().apply(" a  b ")), "a  b") }
    @TestCase func prefixName(): Unit { @Assert(PrefixRule("pre-").name, "prefix") }
    @TestCase func prefixAddsText(): Unit { @Assert(acceptedText(PrefixRule("pre-").apply("x")), "pre-x") }
    @TestCase func prefixCanBeEmpty(): Unit { @Assert(acceptedText(PrefixRule("").apply("x")), "x") }
    @TestCase func rejectEmptyName(): Unit { @Assert(RejectEmptyRule().name, "reject-empty") }
    @TestCase func rejectEmptyRejects(): Unit { @Assert(acceptedText(RejectEmptyRule().apply("")), "rejected:empty text") }
    @TestCase func rejectEmptyAcceptsNonEmpty(): Unit { @Assert(acceptedText(RejectEmptyRule().apply("x")), "x") }
    @TestCase func replaceName(): Unit { @Assert(ReplaceRule("a", "b").name, "replace") }
    @TestCase func replaceAll(): Unit { @Assert(acceptedText(ReplaceRule("a", "xy").apply("a-a")), "xy-xy") }
    @TestCase func emptyPipelineKeepsInput(): Unit { @Assert(acceptedText(TextPipeline().run("x")), "x") }
    @TestCase func emptyPipelineSize(): Unit { @Assert(TextPipeline().size, 0) }
    @TestCase func addReturnsSamePipeline(): Unit { let p = TextPipeline(); @Assert(p.add(TrimRule()).size, 1) }
    @TestCase func pipelineKeepsOrder(): Unit { let p = TextPipeline().add(TrimRule()).add(PrefixRule("v=")); @Assert(acceptedText(p.run("  7 ")), "v=7") }
    @TestCase func pipelineNames(): Unit { let n = TextPipeline().add(TrimRule()).add(RejectEmptyRule()).names(); @Assert(n[0], "trim"); @Assert(n[1], "reject-empty") }
    @TestCase func pipelineStopsAtReject(): Unit { let p = TextPipeline().add(TrimRule()).add(RejectEmptyRule()).add(PrefixRule("never")); @Assert(acceptedText(p.run("   ")), "rejected:empty text") }
    @TestCase func pipelineComposesFourRules(): Unit { let p = TextPipeline().add(TrimRule()).add(ReplaceRule("-", ":")).add(RejectEmptyRule()).add(PrefixRule("id=")); @Assert(acceptedText(p.run(" a-b ")), "id=a:b") }
}

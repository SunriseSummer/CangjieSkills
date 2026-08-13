package unicode_label_registry

import std.unicode.*

@Test
class TestCanonicalization {
    @TestCase func empty() { @Assert(canonicalizeLabel(""), "") }
    @TestCase func asciiTrim() { @Assert(canonicalizeLabel("  Alpha  "), "alpha") }
    @TestCase func asciiWhitespaceCollapse() { @Assert(canonicalizeLabel("A\t \n B"), "a b") }
    @TestCase func noBreakSpaceTrim() { @Assert(canonicalizeLabel("\u{00a0}A\u{00a0}"), "a") }
    @TestCase func ideographicSpaceCollapse() { @Assert(canonicalizeLabel("仓颉\u{3000}语言"), "仓颉 语言") }
    @TestCase func allUnicodeWhitespace() { @Assert(canonicalizeLabel("\u{00a0}\u{3000}\t"), "") }
    @TestCase func preservesPunctuation() { @Assert(canonicalizeLabel(" A-B "), "a-b") }
    @TestCase func greekCase() { @Assert(canonicalizeLabel(" ΑΒΓ "), "αβγ") }
    @TestCase func cyrillicCase() { @Assert(canonicalizeLabel(" ПРИВЕТ "), "привет") }
    @TestCase func turkishCase() { @Assert(canonicalizeLabel("Iİ", casing: CasingOption.TR), "ıi\u{0307}") }
}

@Test
class TestIdentifiers {
    @TestCase func rejectsEmpty() { @Assert(!isIdentifier("")) }
    @TestCase func acceptsAscii() { @Assert(isIdentifier("Alpha_105")) }
    @TestCase func acceptsChinese() { @Assert(isIdentifier("仓颉105")) }
    @TestCase func acceptsGreek() { @Assert(isIdentifier("Δelta2")) }
    @TestCase func acceptsArabicIndicNumberAfterLetter() { @Assert(isIdentifier("x١٢")) }
    @TestCase func rejectsLeadingNumber() { @Assert(!isIdentifier("1alpha")) }
    @TestCase func rejectsLeadingUnderscore() { @Assert(!isIdentifier("_alpha")) }
    @TestCase func rejectsHyphen() { @Assert(!isIdentifier("alpha-beta")) }
    @TestCase func rejectsWhitespace() { @Assert(!isIdentifier("alpha beta")) }
    @TestCase func rejectsEmoji() { @Assert(!isIdentifier("alpha😀")) }
}

@Test
class TestAnalysisAndRegistry {
    @TestCase
    func runeCountsNotUtf8Bytes() {
        let s = analyzeLabel("仓A1 😀")
        @Assert(s.letters, 2)
        @Assert(s.numbers, 1)
        @Assert(s.whitespace, 1)
        @Assert(s.others, 1)
    }
    @TestCase func unicodeNumberCounts() { @Assert(analyzeLabel("Ⅻ").numbers, 1) }
    @TestCase func deduplicatesAfterCaseFold() { @Assert(deduplicateLabels(["Alpha", "ALPHA", "beta"]), ["alpha", "beta"]) }
    @TestCase func deduplicatesAfterWhitespaceFold() { @Assert(deduplicateLabels(["a  b", " a\tb ", "a c"]), ["a b", "a c"]) }
    @TestCase func ignoresBlankKeys() { @Assert(deduplicateLabels([" ", "\u{3000}", "A"]), ["a"]) }
    @TestCase func preservesFirstOccurrenceOrder() { @Assert(deduplicateLabels(["Z", "a", "B", "A"]), ["z", "a", "b"]) }
    @TestCase func turkishDeduplication() { @Assert(deduplicateLabels(["I", "ı", "İ", "i"], casing: CasingOption.TR), ["ı", "i\u{0307}", "i"]) }
}

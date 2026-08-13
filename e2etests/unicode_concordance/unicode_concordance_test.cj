package unicode_concordance

@Test
class UnicodeConcordanceTests {
    @TestCase func emptyText() { let c = UnicodeConcordance.build(""); @Assert(c.totalWords, 0); @Assert(c.uniqueWords, 0); @Assert(c.render(), "") }
    @TestCase func punctuationOnly() { let c = UnicodeConcordance.build("!? ，。—"); @Assert(c.totalWords, 0); @Assert(c.entries().size, 0) }
    @TestCase func countsRepeatedAscii() { let c = UnicodeConcordance.build("one two one"); @Assert(c.totalWords, 3); @Assert(c.uniqueWords, 2); @Assert(c.countOf("one"), 2) }
    @TestCase func caseFoldsAscii() { let c = UnicodeConcordance.build("Apple APPLE apple"); @Assert(c.countOf("APPLE"), 3); @Assert(c.uniqueWords, 1) }
    @TestCase func supportsCjkLetters() { let c = UnicodeConcordance.build("仓颉 编程 仓颉"); @Assert(c.countOf("仓颉"), 2); @Assert(c.countOf("编程"), 1) }
    @TestCase func supportsAccentedLetters() { let c = UnicodeConcordance.build("Äpfel äPFEL Élan"); @Assert(c.countOf("äpfel"), 2); @Assert(c.countOf("élan"), 1) }
    @TestCase func supportsGreekCase() { let c = UnicodeConcordance.build("ΑΒ αβ"); @Assert(c.countOf("αβ"), 2) }
    @TestCase func keepsDigitsInWords() { let c = UnicodeConcordance.build("Cangjie42 cangjie42 42"); @Assert(c.countOf("CANGJIE42"), 2); @Assert(c.countOf("42"), 1) }
    @TestCase func joinsAdjacentLettersAndNumbers() { let c = UnicodeConcordance.build("a1b2"); @Assert(c.uniqueWords, 1); @Assert(c.countOf("A1B2"), 1) }
    @TestCase func punctuationSeparates() { let c = UnicodeConcordance.build("red,blue;green"); @Assert(c.uniqueWords, 3) }
    @TestCase func emojiSeparates() { let c = UnicodeConcordance.build("hello😀world"); @Assert(c.countOf("hello"), 1); @Assert(c.countOf("world"), 1) }
    @TestCase func missingCountIsZero() { @Assert(UnicodeConcordance.build("one").countOf("missing"), 0) }
    @TestCase func missingLinesAreEmpty() { @Assert(UnicodeConcordance.build("one").linesOf("missing").size, 0) }

    @TestCase func lineNumbersStartAtOne() { @Assert(UnicodeConcordance.build("one").linesOf("one"), [1]) }
    @TestCase func tracksMultipleLines() { @Assert(UnicodeConcordance.build("one\ntwo\none").linesOf("one"), [1, 3]) }
    @TestCase func deduplicatesLineNumbers() { @Assert(UnicodeConcordance.build("one one one").linesOf("one"), [1]) }
    @TestCase func blankLinesAdvanceLineNumber() { @Assert(UnicodeConcordance.build("one\n\nthree").linesOf("three"), [3]) }
    @TestCase func trailingNewlineDoesNotAddWord() { let c = UnicodeConcordance.build("one\n"); @Assert(c.totalWords, 1); @Assert(c.linesOf("one"), [1]) }
    @TestCase func crlfStillTracksLines() { let c = UnicodeConcordance.build("one\r\ntwo"); @Assert(c.linesOf("two"), [2]) }

    @TestCase func entriesAreSorted() { let e = UnicodeConcordance.build("z a m a").entries(); @Assert(e[0].word, "a"); @Assert(e[1].word, "m"); @Assert(e[2].word, "z") }
    @TestCase func entryCountAndLines() { let e = UnicodeConcordance.build("a b\na").entries(); @Assert(e[0].count, 2); @Assert(e[0].lines, [1, 2]) }
    @TestCase func entriesArrayIsIndependent() { let c = UnicodeConcordance.build("a b"); let e = c.entries(); e[0] = WordEntry("changed", 9, []); @Assert(c.entries()[0].word, "a") }
    @TestCase func entryLinesAreIndependent() { let c = UnicodeConcordance.build("a\na"); let e = c.entries(); e[0].lines[0] = 99; @Assert(c.linesOf("a"), [1, 2]) }
    @TestCase func linesQueryIsIndependent() { let c = UnicodeConcordance.build("a\na"); let lines = c.linesOf("a"); lines[0] = 99; @Assert(c.linesOf("a"), [1, 2]) }
    @TestCase func renderIsDeterministic() { @Assert(UnicodeConcordance.build("z a\nz").render(), "a=1@1\nz=2@1,2") }
    @TestCase func renderEmptyWordSet() { @Assert(UnicodeConcordance.build("---\n...").render(), "") }
}

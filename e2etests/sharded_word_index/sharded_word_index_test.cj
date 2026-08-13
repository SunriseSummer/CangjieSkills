package sharded_word_index

private func expectIndexError(action: () -> Unit): Unit { try { action(); @Fail("expected IndexException") } catch (_: IndexException) { @Assert(true) } }

@Test
class ShardedWordIndexTests {
    @TestCase func startsEmpty() { let i = ShardedWordIndex(3); @Assert(i.documentCount(), 0); @Assert(i.totalWords(), 0); @Assert(i.top(10).size, 0) }
    @TestCase func rejectsInvalidShardCount() { expectIndexError { => ShardedWordIndex(0); () }; expectIndexError { => ShardedWordIndex(-1); () } }
    @TestCase func tokenizesAsciiCaseAndPunctuation() { let i = ShardedWordIndex(2); i.add("a", "Hello, HELLO! world-42"); @Assert(i.count("hello"), 2); @Assert(i.count("WORLD"), 1); @Assert(i.count("42"), 1); @Assert(i.totalWords(), 4) }
    @TestCase func keepsUnicodeTokens() { let i = ShardedWordIndex(2); i.add("u", "仓颉 编程，仓颉2026"); @Assert(i.count("仓颉"), 1); @Assert(i.count("仓颉2026"), 1); @Assert(i.count("编程"), 1) }
    @TestCase func documentsAreUniqueAndSorted() { let i = ShardedWordIndex(3); i.add("z", "red red"); i.add("a", "red blue"); @Assert(i.documents("RED"), ["a", "z"]); @Assert(i.documents("blue"), ["a"]) }
    @TestCase func addRejectsDuplicateAtomically() { let i = ShardedWordIndex(2); i.add("a", "one two"); expectIndexError { => i.add("a", "three three"); () }; @Assert(i.totalWords(), 2); @Assert(i.count("three"), 0); @Assert(i.documentCount(), 1) }
    @TestCase func invalidQueriesFail() { let i = ShardedWordIndex(2); expectIndexError { => i.count(" "); () }; expectIndexError { => i.documents("two words"); () } }
    @TestCase func batchBuildsAllDocuments() { let i = ShardedWordIndex(4); i.addAll([("a", "red blue"), ("b", "blue green"), ("c", "red red")]); @Assert(i.documentCount(), 3); @Assert(i.totalWords(), 6); @Assert(i.count("red"), 3); @Assert(i.documents("blue"), ["a", "b"]) }
    @TestCase func batchDuplicateIsAllOrNothing() { let i = ShardedWordIndex(3); i.add("base", "kept"); expectIndexError { => i.addAll([("a", "one"), ("a", "two")]); () }; @Assert(i.documentCount(), 1); @Assert(i.count("one"), 0); @Assert(i.count("kept"), 1) }
    @TestCase func batchExistingIdIsAllOrNothing() { let i = ShardedWordIndex(3); i.add("base", "kept"); expectIndexError { => i.addAll([("new", "one"), ("base", "changed")]); () }; @Assert(i.documentCount(), 1); @Assert(i.count("one"), 0); @Assert(i.count("changed"), 0) }
    @TestCase func topUsesCountThenWord() { let i = ShardedWordIndex(2); i.addAll([("a", "beta alpha beta"), ("b", "gamma alpha beta")]); let top = i.top(3); @Assert(top.size, 3); @Assert(top[0].word, "beta"); @Assert(top[0].count, 3); @Assert(top[1].word, "alpha"); @Assert(top[2].word, "gamma") }
    @TestCase func topBoundsAndSnapshot() { let i = ShardedWordIndex(2); i.add("a", "one two"); @Assert(i.top(0).size, 0); expectIndexError { => i.top(-1); () }; let first = i.top(10); i.add("b", "three"); @Assert(first.size, 2); @Assert(i.top(10).size, 3) }
    @TestCase func simultaneousReadsAndWritesRemainConsistent() { let i = ShardedWordIndex(4); let writer = spawn { => i.addAll([("a", "x x"), ("b", "x y"), ("c", "z")]) }; let reader = spawn { => for (_ in 0..100) { i.documentCount(); i.totalWords() }; () }; writer.get(); reader.get(); @Assert(i.documentCount(), 3); @Assert(i.totalWords(), 5); @Assert(i.count("x"), 3) }
}

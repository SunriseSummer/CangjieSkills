package parallel_frequency

private func expectFrequencyError(action: () -> Unit): Unit { try { action(); @Fail("expected FrequencyException") } catch (_: FrequencyException) { @Assert(true) } }

@Test
class ParallelFrequencyTests {
    @TestCase func rejectsZeroWorkers() { expectFrequencyError { => ParallelFrequency.count([], workers: 0) } }
    @TestCase func rejectsNegativeWorkers() { expectFrequencyError { => ParallelFrequency.count([], workers: -2) } }
    @TestCase func emptyInput() { let report = ParallelFrequency.count([], workers: 8); @Assert(report.total, 0); @Assert(report.unique, 0); @Assert(report.keys().size, 0); @Assert(report.render(), "") }
    @TestCase func countsSingleValue() { let report = ParallelFrequency.count(["a"]); @Assert(report.total, 1); @Assert(report.unique, 1); @Assert(report.countOf("a"), 1) }
    @TestCase func countsDuplicates() { let report = ParallelFrequency.count(["a", "b", "a", "a", "b"], workers: 3); @Assert(report.total, 5); @Assert(report.unique, 2); @Assert(report.countOf("a"), 3); @Assert(report.countOf("b"), 2) }
    @TestCase func missingWordIsZero() { @Assert(ParallelFrequency.count(["a"]).countOf("missing"), 0) }
    @TestCase func preservesCaseDistinction() { let report = ParallelFrequency.count(["A", "a"]); @Assert(report.unique, 2); @Assert(report.countOf("A"), 1); @Assert(report.countOf("a"), 1) }
    @TestCase func permitsEmptyWord() { let report = ParallelFrequency.count(["", "", "a"]); @Assert(report.countOf(""), 2) }
    @TestCase func workersMayExceedItems() { let report = ParallelFrequency.count(["x", "y"], workers: 20); @Assert(report.total, 2); @Assert(report.unique, 2) }
    @TestCase func keysAreSortedAndCopied() { let report = ParallelFrequency.count(["z", "a", "m", "a"]); let first = report.keys(); @Assert(first, ["a", "m", "z"]); first[0] = "changed"; @Assert(report.keys(), ["a", "m", "z"]) }
    @TestCase func renderIsDeterministic() { let report = ParallelFrequency.count(["z", "a", "m", "a"]); @Assert(report.render(), "a=2\nm=1\nz=1") }
    @TestCase func eachElementProcessedOnce() { let values = Array<String>(1000, { index => "k${index % 7}" }); let report = ParallelFrequency.count(values, workers: 13); @Assert(report.total, 1000); var sum: Int64 = 0; for (key in report.keys()) { sum += report.countOf(key) }; @Assert(sum, 1000) }
    @TestCase func repeatedRunsStayStable() { let values = Array<String>(500, { index => "v${index % 11}" }); let expected = ParallelFrequency.count(values, workers: 7).render(); for (_ in 0..8) { @Assert(ParallelFrequency.count(values, workers: 7).render(), expected) } }
}

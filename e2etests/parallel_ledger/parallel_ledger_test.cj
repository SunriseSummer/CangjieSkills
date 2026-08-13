package parallel_ledger

private func expectLedgerError(action: () -> Unit): Unit {
    try { action(); @Fail("expected LedgerException") } catch (_: LedgerException) { @Assert(true) }
}

@Test
class ParallelLedgerTests {
    @TestCase func rejectsZeroWorkers() { expectLedgerError { => ParallelLedger.aggregate([], workers: 0); () } }
    @TestCase func rejectsNegativeWorkers() { expectLedgerError { => ParallelLedger.aggregate([], workers: -3); () } }
    @TestCase func emptyInput() { let s = ParallelLedger.aggregate([], workers: 8); @Assert(s.processed, 0); @Assert(s.accountCount, 0); @Assert(s.accounts().size, 0); @Assert(s.render(), "") }
    @TestCase func singleChange() { let s = ParallelLedger.aggregate([LedgerChange("a", 5)]); @Assert(s.processed, 1); @Assert(s.accountCount, 1); @Assert(s.balanceOf("a"), 5) }
    @TestCase func combinesChanges() { let s = ParallelLedger.aggregate([LedgerChange("a", 5), LedgerChange("a", -2), LedgerChange("b", 4)], workers: 2); @Assert(s.processed, 3); @Assert(s.balanceOf("a"), 3); @Assert(s.balanceOf("b"), 4) }
    @TestCase func permitsNegativeBalance() { @Assert(ParallelLedger.aggregate([LedgerChange("a", -8)]).balanceOf("a"), -8) }
    @TestCase func preservesZeroBalanceAccount() { let s = ParallelLedger.aggregate([LedgerChange("a", 5), LedgerChange("a", -5)]); @Assert(s.accountCount, 1); @Assert(s.balanceOf("a"), 0) }
    @TestCase func missingBalanceIsZero() { @Assert(ParallelLedger.aggregate([LedgerChange("a", 1)]).balanceOf("missing"), 0) }
    @TestCase func distinguishesCase() { let s = ParallelLedger.aggregate([LedgerChange("A", 1), LedgerChange("a", 2)]); @Assert(s.accountCount, 2); @Assert(s.balanceOf("A"), 1); @Assert(s.balanceOf("a"), 2) }
    @TestCase func allowsEmptyAccount() { let s = ParallelLedger.aggregate([LedgerChange("", 3)]); @Assert(s.accountCount, 1); @Assert(s.balanceOf(""), 3) }
    @TestCase func workersMayExceedChanges() { let s = ParallelLedger.aggregate([LedgerChange("x", 1), LedgerChange("y", 2)], workers: 20); @Assert(s.processed, 2); @Assert(s.accountCount, 2) }

    @TestCase func accountsAreSorted() { @Assert(ParallelLedger.aggregate([LedgerChange("z", 1), LedgerChange("a", 1), LedgerChange("m", 1)]).accounts(), ["a", "m", "z"]) }
    @TestCase func accountsAreIndependent() { let s = ParallelLedger.aggregate([LedgerChange("a", 1), LedgerChange("b", 2)]); let a = s.accounts(); a[0] = "changed"; @Assert(s.accounts(), ["a", "b"]) }
    @TestCase func entriesAreSorted() { let e = ParallelLedger.aggregate([LedgerChange("z", 1), LedgerChange("a", 2)]).entries(); @Assert(e[0][0], "a"); @Assert(e[0][1], 2); @Assert(e[1][0], "z"); @Assert(e[1][1], 1) }
    @TestCase func entriesAreIndependent() { let s = ParallelLedger.aggregate([LedgerChange("a", 1)]); let e = s.entries(); e[0] = ("x", 9); let current = s.entries()[0]; @Assert(current[0], "a"); @Assert(current[1], 1) }
    @TestCase func renderIsDeterministic() { let s = ParallelLedger.aggregate([LedgerChange("z", 1), LedgerChange("a", 2), LedgerChange("z", 4)]); @Assert(s.render(), "a=2\nz=5") }
    @TestCase func renderEmptyAccount() { @Assert(ParallelLedger.aggregate([LedgerChange("", 3)]).render(), "=3") }

    @TestCase func everyChangeProcessedOnce() { let values = Array<LedgerChange>(1200, { index => LedgerChange("a${index % 9}", 1) }); let s = ParallelLedger.aggregate(values, workers: 17); @Assert(s.processed, 1200); var sum: Int64 = 0; for ((_, balance) in s.entries()) { sum += balance }; @Assert(sum, 1200) }
    @TestCase func mixedDeltasPreserveSum() { let values = Array<LedgerChange>(1000, { index => LedgerChange("k${index % 7}", if (index % 2 == 0) { 3 } else { -1 }) }); let s = ParallelLedger.aggregate(values, workers: 13); var sum: Int64 = 0; for ((_, balance) in s.entries()) { sum += balance }; @Assert(sum, 1000) }
    @TestCase func repeatedRunsStable() { let values = Array<LedgerChange>(500, { index => LedgerChange("v${index % 11}", index % 5 - 2) }); let expected = ParallelLedger.aggregate(values, workers: 7).render(); for (_ in 0..8) { @Assert(ParallelLedger.aggregate(values, workers: 7).render(), expected) } }
    @TestCase func oneWorkerStillWorks() { let values = [LedgerChange("a", 1), LedgerChange("a", 2)]; let s = ParallelLedger.aggregate(values, workers: 1); @Assert(s.processed, 2); @Assert(s.balanceOf("a"), 3) }
    @TestCase func manyAccounts() { let values = Array<LedgerChange>(200, { index => LedgerChange("a${index}", index) }); let s = ParallelLedger.aggregate(values, workers: 16); @Assert(s.accountCount, 200); @Assert(s.processed, 200) }
    @TestCase func inputArrayRemainsUnchanged() { let values = [LedgerChange("b", 2), LedgerChange("a", 1)]; let _ = ParallelLedger.aggregate(values); @Assert(values[0].account, "b"); @Assert(values[1].account, "a") }
    @TestCase func processedMatchesEntryCountsConceptually() { let values = [LedgerChange("a", 1), LedgerChange("b", 2), LedgerChange("a", 3), LedgerChange("c", 4)]; let s = ParallelLedger.aggregate(values, workers: 3); @Assert(s.processed, 4); @Assert(s.accountCount, 3) }
}

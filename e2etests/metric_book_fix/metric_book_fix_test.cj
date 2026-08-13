package metric_book_fix

@Test
class MetricBookTests {
    @TestCase func missingMetricIsZero() {
        @Assert(MetricBook().get("missing"), 0)
    }

    @TestCase func recordsSequentialUpdates() {
        let book = MetricBook()
        book.record("requests", 2)
        book.record("requests", 3)
        @Assert(book.get("requests"), 5)
    }

    @TestCase func supportsNegativeAndZeroDelta() {
        let book = MetricBook()
        book.record("balance", 10)
        book.record("balance", -4)
        book.record("balance", 0)
        @Assert(book.get("balance"), 6)
    }

    @TestCase func concurrentSameKeyDoesNotLoseUpdates() {
        let book = MetricBook()
        let workers = Array<Future<Unit>>(8, {_ =>
            spawn {
                for (_ in 0..500) { book.record("shared", 1) }
            }
        })
        for (worker in workers) { worker.get() }
        @Assert(book.get("shared"), 4000)
    }

    @TestCase func concurrentDistinctKeysRemainIndependent() {
        let book = MetricBook()
        let left = spawn { for (_ in 0..700) { book.record("left", 1) } }
        let right = spawn { for (_ in 0..900) { book.record("right", 1) } }
        left.get()
        right.get()
        @Assert(book.get("left"), 700)
        @Assert(book.get("right"), 900)
    }

    @TestCase func totalSumsCurrentValues() {
        let book = MetricBook()
        book.record("a", 3)
        book.record("b", -1)
        book.record("c", 8)
        @Assert(book.total(), 10)
    }

    @TestCase func snapshotIsSortedByName() {
        let book = MetricBook()
        book.record("zeta", 1)
        book.record("alpha", 2)
        book.record("middle", 3)
        let snapshot = book.snapshot()
        @Assert(snapshot.size, 3)
        @Assert(snapshot[0][0], "alpha")
        @Assert(snapshot[0][1], 2)
        @Assert(snapshot[1][0], "middle")
        @Assert(snapshot[1][1], 3)
        @Assert(snapshot[2][0], "zeta")
        @Assert(snapshot[2][1], 1)
    }

    @TestCase func snapshotIsIndependent() {
        let book = MetricBook()
        book.record("a", 1)
        let first = book.snapshot()
        book.record("a", 4)
        @Assert(first.size, 1)
        @Assert(first[0][0], "a")
        @Assert(first[0][1], 1)
        let second = book.snapshot()
        @Assert(second.size, 1)
        @Assert(second[0][0], "a")
        @Assert(second[0][1], 5)
    }

    @TestCase func totalsAfterConcurrentWrites() {
        let book = MetricBook()
        let workers = Array<Future<Unit>>(4, {index =>
            spawn {
                for (_ in 0..250) { book.record("k${index}", 2) }
            }
        })
        for (worker in workers) { worker.get() }
        @Assert(book.total(), 2000)
        @Assert(book.snapshot().size, 4)
    }

    @TestCase func freshBooksDoNotShareState() {
        let first = MetricBook()
        let second = MetricBook()
        first.record("x", 7)
        @Assert(second.get("x"), 0)
    }
}

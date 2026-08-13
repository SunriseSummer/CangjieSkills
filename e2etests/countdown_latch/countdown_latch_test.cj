package countdown_latch

private func expectIllegalCount(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected IllegalArgumentException")
    } catch (_: IllegalArgumentException) {
        @Assert(true)
    }
}

@Test
class CountdownLatchTests {
    @TestCase func rejectsNegativeCount() {
        expectIllegalCount { => CountdownLatch(-1); () }
    }

    @TestCase func zeroStartsOpen() {
        let latch = CountdownLatch(0)
        @Assert(latch.count, 0)
        @Assert(latch.await(1 * Duration.millisecond))
    }

    @TestCase func countDownReachesButNeverPassesZero() {
        let latch = CountdownLatch(1)
        latch.countDown()
        latch.countDown()
        @Assert(latch.count, 0)
    }

    @TestCase func timedAwaitCanTimeout() {
        let latch = CountdownLatch(1)
        @Assert(!latch.await(10 * Duration.millisecond))
        @Assert(latch.count, 1)
    }

    @TestCase func timedAwaitObservesCountdown() {
        let latch = CountdownLatch(1)
        let worker = spawn {
            sleep(10 * Duration.millisecond)
            latch.countDown()
        }
        @Assert(latch.await(1 * Duration.second))
        worker.get()
        @Assert(latch.count, 0)
    }

    @TestCase func untimedAwaitObservesMultipleWorkers() {
        let latch = CountdownLatch(2)
        let a = spawn { latch.countDown() }
        let b = spawn { latch.countDown() }
        latch.await()
        a.get()
        b.get()
        @Assert(latch.count, 0)
    }

    @TestCase func allWaitersAreReleased() {
        for (_ in 0..20) {
            let latch = CountdownLatch(1)
            let a = spawn { latch.await(); 1 }
            let b = spawn { latch.await(); 2 }
            sleep(1 * Duration.millisecond)
            latch.countDown()
            @Assert(a.get() + b.get(), 3)
        }
    }

    @TestCase func countPropertyIsSafeDuringUpdates() {
        let latch = CountdownLatch(100)
        let worker = spawn {
            for (_ in 0..100) { latch.countDown() }
        }
        var previous: Int64 = 100
        while (latch.count > 0) {
            let current = latch.count
            @Assert(current <= previous)
            previous = current
        }
        worker.get()
        @Assert(latch.count, 0)
    }
}

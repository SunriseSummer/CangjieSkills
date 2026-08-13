package concurrent_cache_scheduler

import std.collection.*
import std.ref.*
import std.sync.*

private class CountingTask <: SchedulerTask {
    private let key: String
    private let result: String
    private let count: AtomicInt64

    init(key: String, result: String, count: AtomicInt64) {
        this.key = key
        this.result = result
        this.count = count
    }

    public prop cacheKey: String {
        get() { key }
    }

    public func execute(): String {
        count.fetchAdd(1)
        result
    }
}

@Test
class SchedulerConstructionTests {
    @TestCase
    func rejectsZeroWorkers() {
        try {
            TaskScheduler(0, 2)
            @Fail("expected SchedulerException")
        } catch (_: SchedulerException) {
            @Assert(true)
        }
    }

    @TestCase
    func rejectsZeroCapacity() {
        try {
            TaskScheduler(1, 0)
            @Fail("expected SchedulerException")
        } catch (_: SchedulerException) {
            @Assert(true)
        }
    }

    @TestCase
    func exposesConfiguration() {
        try (scheduler = TaskScheduler(3, 7)) {
            @Assert(scheduler.workerCount, 3)
            @Assert(scheduler.queueCapacity, 7)
        }
    }

    @TestCase
    func startsOpenAndCloses() {
        let scheduler = TaskScheduler(1, 2)
        @Assert(!scheduler.isClosed())
        scheduler.close()
        @Assert(scheduler.isClosed())
    }

    @TestCase
    func closeIsIdempotent() {
        let scheduler = TaskScheduler(1, 2)
        scheduler.close()
        scheduler.close()
        @Assert(scheduler.isClosed())
    }
}

@Test
class SchedulerExecutionTests {
    @TestCase
    func executesLiteralTask() {
        try (scheduler = TaskScheduler(1, 2)) {
            @Assert(scheduler.submit(LiteralTask("a", "A")).get(), "A")
        }
    }

    @TestCase
    func executesCustomInterfaceImplementation() {
        let count = AtomicInt64(0)
        try (scheduler = TaskScheduler(1, 2)) {
            @Assert(scheduler.submit(CountingTask("x", "custom", count)).get(), "custom")
            @Assert(count.load(), 1)
        }
    }

    @TestCase
    func propagatesTaskFailure() {
        try (scheduler = TaskScheduler(1, 2)) {
            let handle = scheduler.submit(FailingTask("bad", "boom"))
            try {
                handle.get()
                @Fail("expected SchedulerException")
            } catch (e: SchedulerException) {
                @Assert(e.message, "boom")
            }
        }
    }

    @TestCase
    func failedTaskIsNotCached() {
        try (scheduler = TaskScheduler(1, 2)) {
            let handle = scheduler.submit(FailingTask("bad", "boom"))
            try {
                handle.get()
            } catch (_: SchedulerException) {}
            @Assert(scheduler.cached("bad").isNone())
        }
    }

    @TestCase
    func rejectsEmptyCacheKey() {
        try (scheduler = TaskScheduler(1, 2)) {
            try {
                scheduler.submit(LiteralTask("", "x"))
                @Fail("expected SchedulerException")
            } catch (_: SchedulerException) {
                @Assert(true)
            }
        }
    }

    @TestCase
    func rejectsSubmitAfterClose() {
        let scheduler = TaskScheduler(1, 2)
        scheduler.close()
        try {
            scheduler.submit(LiteralTask("late", "x"))
            @Fail("expected SchedulerException")
        } catch (_: SchedulerException) {
            @Assert(true)
        }
    }

    @TestCase
    func runsManyUniqueTasksConcurrently() {
        try (scheduler = TaskScheduler(4, 8)) {
            let handles = ArrayList<TaskHandle>()
            for (i in 0..40) {
                handles.add(scheduler.submit(LiteralTask("k${i}", "v${i}")))
            }
            for (i in 0..40) {
                @Assert(handles[i].get(), "v${i}")
            }
            @Assert(scheduler.stats().executed, 40)
        }
    }
}

@Test
class SchedulerCacheTests {
    @TestCase
    func secondTaskWithSameKeyHitsCache() {
        let count = AtomicInt64(0)
        try (scheduler = TaskScheduler(2, 4)) {
            @Assert(scheduler.submit(CountingTask("same", "first", count)).get(), "first")
            @Assert(scheduler.submit(CountingTask("same", "second", count)).get(), "first")
            @Assert(count.load(), 1)
        }
    }

    @TestCase
    func cachedReturnsSome() {
        try (scheduler = TaskScheduler(1, 2)) {
            scheduler.submit(LiteralTask("key", "value")).get()
            @Assert(scheduler.cached("key").getOrThrow(), "value")
        }
    }

    @TestCase
    func cachedMissingReturnsNone() {
        try (scheduler = TaskScheduler(1, 2)) {
            @Assert(scheduler.cached("missing").isNone())
        }
    }

    @TestCase
    func invalidateReturnsRemovedValue() {
        try (scheduler = TaskScheduler(1, 2)) {
            scheduler.submit(LiteralTask("key", "value")).get()
            @Assert(scheduler.invalidate("key").getOrThrow(), "value")
            @Assert(scheduler.cached("key").isNone())
        }
    }

    @TestCase
    func invalidateMissingReturnsNone() {
        try (scheduler = TaskScheduler(1, 2)) {
            @Assert(scheduler.invalidate("missing").isNone())
        }
    }

    @TestCase
    func invalidatedTaskExecutesAgain() {
        let count = AtomicInt64(0)
        try (scheduler = TaskScheduler(1, 2)) {
            scheduler.submit(CountingTask("key", "one", count)).get()
            scheduler.invalidate("key")
            @Assert(scheduler.submit(CountingTask("key", "two", count)).get(), "two")
            @Assert(count.load(), 2)
        }
    }

    @TestCase
    func statsSeparateExecutionAndHits() {
        try (scheduler = TaskScheduler(1, 3)) {
            scheduler.submit(LiteralTask("a", "A")).get()
            scheduler.submit(LiteralTask("a", "ignored")).get()
            scheduler.submit(LiteralTask("b", "B")).get()
            let stats = scheduler.stats()
            @Assert(stats.submitted, 3)
            @Assert(stats.executed, 2)
            @Assert(stats.cacheHits, 1)
            @Assert(scheduler.cacheSize, 2)
        }
    }
}

@Test
class WeakCacheTests {
    @TestCase
    func storesAndReadsDeferredValue() {
        let cache = WeakValueCache()
        let value = CacheValue("alive")
        cache.put("a", value, CleanupPolicy.DEFERRED)
        @Assert(cache.get("a").getOrThrow().text, "alive")
    }

    @TestCase
    func exposesCleanupPolicy() {
        let cache = WeakValueCache()
        let value = CacheValue("alive")
        cache.put("a", value, CleanupPolicy.EAGER)
        @Assert(cache.policy("a").getOrThrow() == CleanupPolicy.EAGER)
    }

    @TestCase
    func explicitClearIsDeterministic() {
        let cache = WeakValueCache()
        let value = CacheValue("alive")
        cache.put("a", value, CleanupPolicy.DEFERRED)
        @Assert(cache.clearReferent("a"))
        @Assert(cache.get("a").isNone())
    }

    @TestCase
    func clearMissingReturnsFalse() {
        @Assert(!WeakValueCache().clearReferent("missing"))
    }

    @TestCase
    func removeUpdatesSize() {
        let cache = WeakValueCache()
        let value = CacheValue("alive")
        cache.put("a", value, CleanupPolicy.DEFERRED)
        @Assert(cache.size, 1)
        @Assert(cache.remove("a"))
        @Assert(cache.size, 0)
    }
}

@Test
class ReusablePoolTests {
    @TestCase
    func createsOnEmptyAcquire() {
        let pool = ReusableBufferPool(2)
        pool.acquire()
        @Assert(pool.created, 1)
    }

    @TestCase
    func releaseResetsBuffer() {
        let pool = ReusableBufferPool(1)
        let buffer = pool.acquire()
        buffer.text = "dirty"
        @Assert(pool.release(buffer))
        @Assert(pool.acquire().text, "")
    }

    @TestCase
    func reusesReleasedBuffer() {
        let pool = ReusableBufferPool(1)
        let first = pool.acquire()
        pool.release(first)
        pool.acquire()
        @Assert(pool.created, 1)
    }

    @TestCase
    func refusesReleaseWhenFull() {
        let pool = ReusableBufferPool(1)
        let first = pool.acquire()
        let second = pool.acquire()
        @Assert(pool.release(first))
        @Assert(!pool.release(second))
        @Assert(pool.available, 1)
    }

    @TestCase
    func rejectsInvalidCapacity() {
        try {
            ReusableBufferPool(0)
            @Fail("expected SchedulerException")
        } catch (_: SchedulerException) {
            @Assert(true)
        }
    }
}

@Test
class RuntimeTests {
    @TestCase
    func snapshotHasSaneStableInvariants() {
        let snapshot = captureRuntime()
        @Assert(snapshot.processors > 0)
        @Assert(snapshot.threads > 0)
        @Assert(snapshot.nativeThreads > 0)
        @Assert(snapshot.blockingThreads >= 0)
        @Assert(snapshot.allocatedHeap >= 0)
        @Assert(snapshot.usedHeap >= 0)
        @Assert(snapshot.maxHeap > 0)
        @Assert(snapshot.gcCount >= 0)
    }

    @TestCase
    func blackBoxIdentityPreservesValue() {
        @Assert(runtimeIdentity<String>("opaque"), "opaque")
        @Assert(runtimeIdentity<Int64>(42), 42)
    }

    @TestCase
    func explicitLightGcCompletes() {
        requestGc(false)
        @Assert(true)
    }
}

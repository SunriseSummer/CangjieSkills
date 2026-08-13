package deque_scheduler

private func ids(jobs: Array<Job>): String { var result = ""; for (index in 0..jobs.size) { if (index > 0) { result += "," }; result += jobs[index].id }; result }

@Test
class DequeSchedulerTests {
    @TestCase func startsEmpty() { let scheduler = DequeScheduler(); @Assert(scheduler.size, 0); @Assert(scheduler.take().isNone()); @Assert(scheduler.priorities().size, 0) }
    @TestCase func lowerNumberRunsFirst() { let scheduler = DequeScheduler(); scheduler.add(Job("low", 10)); scheduler.add(Job("high", 1)); @Assert(scheduler.take().getOrThrow().id, "high") }
    @TestCase func normalJobsAreFifo() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 2)); scheduler.add(Job("b", 2)); @Assert(scheduler.take().getOrThrow().id, "a"); @Assert(scheduler.take().getOrThrow().id, "b") }
    @TestCase func urgentJobGoesToFront() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 2)); scheduler.add(Job("b", 2)); scheduler.addUrgent(Job("hot", 2)); @Assert(ids(scheduler.snapshot()), "hot,a,b") }
    @TestCase func takeLastUsesRequestedBucket() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 1)); scheduler.add(Job("b", 1)); scheduler.add(Job("c", 2)); @Assert(scheduler.takeLast(1).getOrThrow().id, "b"); @Assert(ids(scheduler.snapshot()), "a,c") }
    @TestCase func takeLastMissingReturnsNone() { @Assert(DequeScheduler().takeLast(7).isNone()) }
    @TestCase func sizeTracksAllOperations() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 1)); scheduler.addUrgent(Job("b", 1)); @Assert(scheduler.size, 2); scheduler.take(); @Assert(scheduler.size, 1); scheduler.takeLast(1); @Assert(scheduler.size, 0) }
    @TestCase func prioritiesAreSortedAndUnique() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 5)); scheduler.add(Job("b", 1)); scheduler.add(Job("c", 5)); scheduler.add(Job("d", 3)); @Assert(scheduler.priorities(), [1, 3, 5]) }
    @TestCase func emptyBucketIsRemoved() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 1)); scheduler.add(Job("b", 2)); scheduler.take(); @Assert(scheduler.priorities(), [2]) }
    @TestCase func snapshotUsesPriorityThenDequeOrder() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 2)); scheduler.add(Job("b", 1)); scheduler.addUrgent(Job("hot", 1)); scheduler.add(Job("c", 3)); @Assert(ids(scheduler.snapshot()), "hot,b,a,c") }
    @TestCase func snapshotIsIndependent() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 1)); let copy = scheduler.snapshot(); scheduler.add(Job("b", 1)); @Assert(copy.size, 1); @Assert(scheduler.snapshot().size, 2) }
    @TestCase func iterableMatchesSnapshot() { let scheduler = DequeScheduler(); scheduler.add(Job("a", 2)); scheduler.add(Job("b", 1)); var result = ""; for (job in scheduler) { result += job.id }; @Assert(result, "ba") }
}

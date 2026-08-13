package bounded_mailbox_fix

private func expectClosed(action: () -> Unit): Unit {
    try { action(); @Fail("expected MailboxClosedException") } catch (_: MailboxClosedException) { @Assert(true) }
}

@Test
class BoundedMailboxTests {
    @TestCase func rejectsInvalidCapacity() { try { BoundedMailbox<Int64>(0); @Fail("expected IllegalArgumentException") } catch (_: IllegalArgumentException) { @Assert(true) } }
    @TestCase func sendsAndReceivesFifo() { let box = BoundedMailbox<String>(2); box.send("a"); box.send("b"); @Assert(box.tryReceive().getOrThrow(), "a"); @Assert(box.tryReceive().getOrThrow(), "b") }
    @TestCase func trySendReportsFull() { let box = BoundedMailbox<Int64>(1); @Assert(box.trySend(1)); @Assert(!box.trySend(2)); @Assert(box.size(), 1) }
    @TestCase func timedSendReportsFull() { let box = BoundedMailbox<Int64>(1); box.send(1); @Assert(!box.send(2, Duration.Zero)); @Assert(box.size(), 1) }
    @TestCase func emptyReceivesReturnNone() { let box = BoundedMailbox<Int64>(1); @Assert(box.tryReceive().isNone()); @Assert(box.receive(Duration.Zero).isNone()) }
    @TestCase func drainPreservesFifoAndEmpties() { let box = BoundedMailbox<String>(3); box.send("a"); box.send("b"); box.send("c"); @Assert(box.drain(), ["a", "b", "c"]); @Assert(box.size(), 0) }
    @TestCase func drainReturnsIndependentArray() { let box = BoundedMailbox<String>(2); box.send("a"); let values = box.drain(); values[0] = "changed"; box.send("b"); @Assert(values[0], "changed"); @Assert(box.tryReceive().getOrThrow(), "b") }
    @TestCase func closeIsIdempotent() { let box = BoundedMailbox<Int64>(1); box.close(); box.close(); @Assert(box.isClosed()) }
    @TestCase func everySendVariantFailsAfterClose() { let box = BoundedMailbox<Int64>(2); box.close(); expectClosed { => box.send(1); () }; expectClosed { => box.trySend(1); () }; expectClosed { => box.send(1, Duration.Zero); () }; @Assert(box.size(), 0) }
    @TestCase func queuedItemsRemainAfterClose() { let box = BoundedMailbox<String>(2); box.send("a"); box.send("b"); box.close(); @Assert(box.tryReceive().getOrThrow(), "a"); @Assert(box.receive(Duration.Zero).getOrThrow(), "b") }
    @TestCase func closedEmptyReceiveReturnsNone() { let box = BoundedMailbox<Int64>(1); box.close(); @Assert(box.tryReceive().isNone()); @Assert(box.receive(Duration.Zero).isNone()) }
    @TestCase func capacityAndSizeAreObservable() { let box = BoundedMailbox<Int64>(3); @Assert(box.capacity, 3); box.send(1); box.send(2); @Assert(box.size(), 2); box.tryReceive(); @Assert(box.size(), 1) }
}

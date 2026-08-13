package bounded_mailbox_fix

import std.collection.concurrent.*
import std.sync.*

public class MailboxClosedException <: Exception {
    public init(message: String) { super(message) }
}

public class BoundedMailbox<T> {
    private let queue: ArrayBlockingQueue<T>
    private let stateLock = Mutex()
    private var closed = false

    public init(capacity: Int64) {
        queue = ArrayBlockingQueue<T>(capacity)
    }

    public prop capacity: Int64 { get() { queue.capacity } }

    public func size(): Int64 { 0 }

    public func isClosed(): Bool { false }

    public func send(value: T): Unit { queue.add(value) }

    public func trySend(value: T): Bool { false }

    public func send(value: T, timeout: Duration): Bool { false }

    public func tryReceive(): ?T { None }

    public func receive(timeout: Duration): ?T { None }

    public func drain(): Array<T> { [] }

    public func close(): Unit {}
}

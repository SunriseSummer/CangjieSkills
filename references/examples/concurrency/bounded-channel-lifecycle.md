<!-- cj-doc kind="example-leaf" level="4" id="examples.concurrency.bounded-channel-lifecycle" parent="examples.concurrency" -->
# 实现可关闭的有界通道

[← 并发任务与同步](index.md)

让阻塞发送、接收、批量取出和关闭共享单一锁域；入队通知接收者，出队通知发送者，drain 与 close 用 notifyAll 唤醒所有受影响线程。

## 设计原则

严格的 `close`、阻塞发送、阻塞接收和批量取出必须共享同一把锁与同一份队列状态。不要在 `ArrayBlockingQueue` 外再维护一套镜像 `notFull`/`notEmpty` 条件：底层队列的 `remove` 会唤醒其内部生产者，却不会自动唤醒外层条件，两个等待协议很容易失配。

下面的通道把容量、元素和关闭状态放在一个锁域中。所有可能改变谓词的操作都发出对应通知：入队唤醒接收者，单个出队唤醒一个发送者，批量取出唤醒全部发送者，关闭同时唤醒两类等待者。等待必须使用 `while` 重新检查谓词，以处理竞争和无目标唤醒。

## 实现并验证状态迁移

下面的完整程序演示该场景：

```cangjie cjtest=run id=std.bounded-channel-lifecycle.run form=unit timeout=30s
package bounded_channel_lifecycle_example

import std.collection.{ArrayDeque, ArrayList}
import std.sync.{Condition, Mutex}

class BoundedChannel<T> {
    private let mutex = Mutex()
    private var notFull: Condition
    private var notEmpty: Condition
    private let values = ArrayDeque<T>()
    private let capacity: Int64
    private var closed = false

    init(capacity: Int64) {
        if (capacity <= 0) {
            throw IllegalArgumentException("capacity must be positive")
        }
        this.capacity = capacity
        synchronized(mutex) {
            notFull = mutex.condition()
            notEmpty = mutex.condition()
        }
    }

    func send(value: T): Bool {
        synchronized(mutex) {
            while (!closed && values.size >= capacity) {
                notFull.wait()
            }
            if (closed) {
                return false
            }
            values.addLast(value)
            notEmpty.notify()
            return true
        }
    }

    func receive(): ?T {
        synchronized(mutex) {
            while (!closed && values.isEmpty()) {
                notEmpty.wait()
            }
            let result = values.removeFirst()
            if (result.isSome()) {
                notFull.notify()
            }
            return result
        }
    }

    func drain(): ArrayList<T> {
        synchronized(mutex) {
            let result = ArrayList<T>()
            while (!values.isEmpty()) {
                match (values.removeFirst()) {
                    case Some(value) => result.add(value)
                    case None => ()
                }
            }
            if (result.size > 0) {
                notFull.notifyAll()
            }
            return result
        }
    }

    func close(): Unit {
        synchronized(mutex) {
            if (!closed) {
                closed = true
                notFull.notifyAll()
                notEmpty.notifyAll()
            }
        }
    }
}

main(): Unit {
    // 排空满通道后，原来阻塞的发送者必须继续。
    let drainedChannel = BoundedChannel<Int64>(1)
    drainedChannel.send(1)
    let resumedSender = spawn { drainedChannel.send(2) }
    sleep(Duration.millisecond * 20)
    let drained = drainedChannel.drain()
    println("${drained.size}:${drained[0]}")
    println(resumedSender.get(Duration.second))
    println(drainedChannel.receive().getOrThrow())

    // 关闭满通道后，原来阻塞的发送者必须醒来并被拒绝。
    let closedChannel = BoundedChannel<Int64>(1)
    closedChannel.send(10)
    let rejectedSender = spawn { closedChannel.send(20) }
    sleep(Duration.millisecond * 20)
    closedChannel.close()
    println(rejectedSender.get(Duration.second))
    println(closedChannel.receive().getOrThrow())
    println(closedChannel.receive().isNone())
}
```

预期标准输出：

```text cjtest=expect for=std.bounded-channel-lifecycle.run stream=stdout match=exact
1:1
true
2
false
10
true
```

## 何时直接使用 ArrayBlockingQueue

只需要容量限制与阻塞/超时入队出队时，直接使用 `ArrayBlockingQueue.add/remove/tryAdd/tryRemove`，不要重复实现同步协议。只有领域契约还要求线性化的关闭、排空或取消状态时，才需要像上例一样建立单一锁域；为每个状态迁移列出它改变的等待谓词，并在同一临界区内通知对应条件。

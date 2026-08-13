<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.4-同步机制.4-3-条件变量-condition" parent="language.concurrency.4-同步机制" -->
# 4.3 条件变量（`Condition`）

[← 4. 同步机制](index.md)

### 接口
```cangjie cjtest=syntax id=syntax-cb0a8a7967-1 form=unit
public interface Condition {
    func wait(): Unit
    func wait(timeout!: Duration): Bool
    func waitUntil(predicate: ()->Bool): Unit
    func waitUntil(predicate: ()->Bool, timeout!: Duration): Bool
    func notify(): Unit
    func notifyAll(): Unit
}
```

### 创建
- 通过 `Mutex` 的 `mtx.condition()` 创建
- 一个 Mutex 可创建**多个** `Condition` 实例
- **重要**：`mtx.condition()` **必须在 mutex 被锁定的状态下调用**，如果在未锁定状态下调用，会抛出 `IllegalSynchronizationStateException`

### 正确创建 Condition 的方式

```cangjie cjtest=compile id=verified-cb0a8a7967-2
package condition_creation_example

import std.sync.{Condition, Mutex}

class Slot {
    var ready = false
    var item: Int64 = 0
}

main(): Int64 {
    let mutex = Mutex()
    let condition: Condition
    synchronized(mutex) {
        condition = mutex.condition()
    }

    // notifyAll 与 wait 一样，也必须在持有绑定锁时调用。
    synchronized(mutex) {
        condition.notifyAll()
    }
    println("condition created")
    return 0
}
```

### `wait()` 行为（4 步）
1. 将当前线程加入锁的等待队列
2. 阻塞当前线程并**完全释放**锁（记录重入计数）
3. 等待另一个线程的 `notify()` 或 `notifyAll()` 信号
4. 唤醒时以相同重入状态重新获取锁

### 规则
- **`mtx.condition()` 须在锁定状态下调用**，否则抛出 `IllegalSynchronizationStateException`
- 调用 `wait()`、`notify()`、`notifyAll()` 前**须持有绑定的锁**
- Condition 须与**创建它的锁**一起使用
- **虚假唤醒**是允许的 — 始终在循环中包装 `wait()`
- `wait(timeout)` 超时精度不保证（依赖 OS）

### 完整的生产者-消费者示例

```cangjie cjtest=compile id=verified-cb0a8a7967-3
package condition_producer_consumer

import std.sync.{Condition, Mutex}

class Slot {
    var ready = false
    var item: Int64 = 0
}

main(): Int64 {
    let mutex = Mutex()
    let condition: Condition
    synchronized(mutex) {
        condition = mutex.condition()
    }

    let slot = Slot()
    let consumer = spawn {
        synchronized(mutex) {
            while (!slot.ready) {
                condition.wait()
            }
            println("consumed ${slot.item}")
        }
    }

    let producer = spawn {
        synchronized(mutex) {
            slot.item = 42
            slot.ready = true
            condition.notify()
        }
    }

    producer.get()
    consumer.get()
    return 0
}
```

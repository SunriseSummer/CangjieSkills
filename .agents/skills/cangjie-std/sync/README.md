# 仓颉语言并发同步 Skill

## 1. 原子操作（Atomic）

- 来自 `std.sync.*`
- 类型：`AtomicInt8/16/32/64`、`AtomicUInt8/16/32/64`、`AtomicBool`、`AtomicReference<T>`、`AtomicOptionReference<T>`

| 方法 | 说明 |
|------|------|
| `load(): T` | 原子读取当前值 |
| `store(val: T): Unit` | 原子写入值 |
| `swap(val: T): T` | 原子交换，返回旧值 |
| `compareAndSwap(old: T, new: T): Bool` | CAS 操作，成功返回 true |
| `fetchAdd(val: T): T` | 原子加，返回旧值 |
| `fetchSub(val: T): T` | 原子减，返回旧值 |

```cangjie
package test_proj
import std.sync.*
import std.time.*
import std.collection.*

let count = AtomicInt64(0)

main(): Int64 {
    let list = ArrayList<Future<Int64>>()
    for (_ in 0..1000) {
        let fut = spawn {
            sleep(Duration.millisecond)
            count.fetchAdd(1)
        }
        list.add(fut)
    }
    for (f in list) {
        f.get()
    }
    var val = count.load()
    println("count = ${val}")
    return 0
}
```

---

## 2. 互斥锁（Mutex）与 synchronized

- `Mutex()` 创建可重入互斥锁
- `synchronized(mutex) { ... }` 自动加锁/解锁的块语法

| 方法 | 说明 |
|------|------|
| `lock()` | 加锁 |
| `unlock()` | 解锁 |
| `tryLock()` | 尝试加锁，返回 Bool |
| `condition()` | 创建关联的条件变量 |

```cangjie
package test_proj
import std.sync.*

var mt = Mutex()
var con = synchronized(mt) { mt.condition() }
var flag: Bool = true

main(): Int64 {
    let fut = spawn {
        mt.lock()
        while (flag) {
            println("New thread: before wait")
            con.wait()
            println("New thread: after wait")
        }
        mt.unlock()
    }
    sleep(10 * Duration.millisecond)
    mt.lock()
    println("Main thread: set flag")
    flag = false
    mt.unlock()
    println("Main thread: notify")
    mt.lock()
    con.notifyAll()
    mt.unlock()
    fut.get()
    return 0
}
```

---

## 3. 条件变量（Condition）

- 通过 `mutex.condition()` 创建，绑定到对应的 Mutex

| 方法 | 说明 |
|------|------|
| `wait()` | 释放锁并等待通知 |
| `waitUntil { predicate }` | 等待直到谓词为 true |
| `notify()` | 唤醒一个等待线程 |
| `notifyAll()` | 唤醒所有等待线程 |

- **注意**：调用 `wait()` / `notify()` 时必须持有对应的 Mutex 锁

---

## 4. 定时器（Timer）

| 方法 | 说明 |
|------|------|
| `Timer.once(delay: Duration, task: () -> Unit): Timer` | 延迟执行一次，返回 Timer |
| `Timer.repeat(delay: Duration, interval: Duration, task: () -> Unit): Timer` | 重复执行，返回 Timer |
| `timer.cancel(): Unit` | 取消定时器 |

---

## 5. 其他同步工具

| 类型 | 说明 |
|------|------|
| `Barrier` | 屏障，协调多个线程在同一点汇合 |
| `Semaphore` | 信号量，控制并发访问数量 |
| `SyncCounter` | 倒计数器，等待多个任务完成 |
| `ReadWriteLock` | 读写锁，支持多读单写 |

- **补充**：`spawn { }` 创建轻量级线程（来自 `std.core`）
- **补充**：`sleep(Duration)` 线程休眠（来自 `std.core`）

---

## 6. 关键规则速查

1. 原子操作适用于简单的无锁计数/标记场景
2. `synchronized(mutex) { ... }` 是推荐的加锁方式，自动释放锁
3. 手动 `lock()` / `unlock()` 时必须确保异常安全（配对调用）
4. `Condition.wait()` 必须在持有 Mutex 锁的情况下调用
5. `spawn { }` 创建轻量级线程，返回 `Future<T>`
6. `Future.get()` 阻塞等待结果，用于线程同步
7. `Timer.once` / `Timer.repeat` 返回 Timer 对象，需保留引用以便取消
8. `AtomicReference<T>` 要求 `T` 为引用类型

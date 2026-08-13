<!-- cj-doc kind="guide-index" level="4" id="language.concurrency.4-同步机制" parent="language.concurrency" -->
# 4. 同步机制

[← 并发](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 原子操作](4-1-原子操作.md) | 仅 `load`、`store`、`swap`、`compareAndSwap` |
| [4.2 可重入互斥锁（`Mutex`）](4-2-可重入互斥锁-mutex.md) | `Mutex` 保护共享数据；同一线程可重复加锁，但每次加锁都必须对应一次解锁。 |
| [4.3 条件变量（`Condition`）](4-3-条件变量-condition.md) | 通过 `Mutex` 的 `mtx.condition()` 创建 |
| [4.4 `synchronized` 关键字](4-4-synchronized-关键字.md) | `synchronized(lock) { ... }` 在进入代码块时加锁，并在正常返回或异常退出时自动解锁。 |
| [4.5 线程局部变量（`ThreadLocal<T>`）](4-5-线程局部变量-threadlocal.md) | 来自 `core` 包（无需特殊导入） |

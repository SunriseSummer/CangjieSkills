<!-- cj-doc kind="api-type" level="5" id="std.sync.interface.condition" parent="std.sync" -->
# Condition

[← std.sync](../../index.md)

`Condition`

提供使线程阻塞并等待来自另一个线程的信号以恢复执行的功能的接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`notify(): Unit`](notify.md) | 唤醒一个等待在关联互斥体上的线程。 |
| [`notifyAll(): Unit`](notifyall.md) | 唤醒所有等待在关联互斥体上的线程。 |
| [`wait(): Unit`](wait.md) | 当前线程挂起，直到对应的 `notify` 函数被调用。 |
| [`wait(timeout!: Duration): Bool`](wait.md) | 当前线程挂起，直到对应的 `notify` 函数被调用，或者挂起时间超过 `timeout`。 |
| [`waitUntil(predicate: () -> Bool): Unit`](waituntil.md) | 当前线程挂起，直到对应的 `notify` 函数被调用且 `predicate` 结果为 `true`。 |
| [`waitUntil(predicate: () -> Bool, timeout!: Duration): Bool`](waituntil.md) | 当前线程挂起，直到对应的 `notify` 函数被调用且 `predicate` 结果为 `true`，或者挂起时间超过 `timeout`。 |

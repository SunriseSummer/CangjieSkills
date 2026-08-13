<!-- cj-doc kind="api-type" level="5" id="std.sync.class.timer" parent="std.sync" -->
# Timer

[← std.sync](../../index.md)

`Timer <: Equatable<Timer> & Hashable`

提供定时器功能。

## 方法

| 签名 | 功能 |
|---|---|
| [`static after(delay: Duration, task: () -> Option<Duration>): Timer`](after.md) | 初始化一个 Timer，关联的 Task 被调度执行的次数取决于它的返回值。 |
| [`static once(delay: Duration, task: ()->Unit): Timer`](once.md) | 设置并启动一次性定时任务，返回控制这个任务的 Timer 对象实例。 |
| [`static repeat(delay: Duration, interval: Duration, task: ()->Unit, style!: CatchupStyle = Burst): Timer`](repeat.md) | 设置并启动重复性定时任务，返回控制这个任务的 Timer 对象实例。 |
| [`static repeatDuring(period: Duration, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer`](repeatduring.md) | 设置并启动重复性定时任务，指定重复周期的最大持续时间，返回控制这个任务的 Timer 对象实例。 |
| [`static repeatTimes(count: Int64, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer`](repeattimes.md) | 设置并启动重复性定时任务，指定 Task 最大执行次数，返回控制这个任务的 Timer 对象实例。 |
| [`cancel(): Unit`](cancel.md) | 取消该 Timer，关联 Task 将不再被调度执行。 |
| [`hashCode(): Int64`](hashcode.md) | 获取 Timer 对象的哈希值。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: Timer): Bool`](operator-ne.md) | 判断当前 Timer 与入参 `rhs` 指定的 Timer 是否不是同一个实例。 |
| [`operator ==(rhs: Timer): Bool`](operator-eq.md) | 判断当前 Timer 与入参 `rhs` 指定的 Timer 是否是同一个实例。 |

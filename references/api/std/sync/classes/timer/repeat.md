<!-- cj-doc kind="api-member" level="6" id="std.sync.class.timer.repeat" parent="std.sync.class.timer" -->
# Timer.repeat

[← Timer](index.md)

## 签名

```cangjie role=signature
public static func repeat(delay: Duration, interval: Duration, task: ()->Unit, style!: CatchupStyle = Burst): Timer
```

设置并启动重复性定时任务，返回控制这个任务的 Timer 对象实例。

## 契约

参数：

- delay: Duration - 从现在开始到 Task 被执行的时间间隔。取值范围 [Duration.Min, Duration.Max]，小于或等于 Duration.Zero 时 Task 将立即被执行。
- interval: Duration - 两次 Task 之间的时间间隔。取值范围 (Duration.Zero, Duration.Max]。
- task: ()->Unit - 待定时执行的任务。
- style!: CatchupStyle - 追平策略，默认 Burst。当 Task 执行时间过长时，后续任务执行时间点可能发生延迟，不同的追平策略适用于不同的场景，详见 CatchupStyle 说明。

返回值：

- Timer - 生成的对象实例。

异常：

- IllegalArgumentException - 当 `interval` 小于等于 Duration.Zero 时，抛出异常。

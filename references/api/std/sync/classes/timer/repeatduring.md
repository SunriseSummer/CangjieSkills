<!-- cj-doc kind="api-member" level="6" id="std.sync.class.timer.repeatduring" parent="std.sync.class.timer" -->
# Timer.repeatDuring

[← Timer](index.md)

## 签名

```cangjie role=signature
public static func repeatDuring(period: Duration, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer
```

设置并启动重复性定时任务，指定重复周期的最大持续时间，返回控制这个任务的 Timer 对象实例。

## 契约

参数：

- period: Duration - 重复周期的最大持续时间，从 delay 之后开始计时。取值范围 (Duration.Zero, Duration.Max]。
- delay: Duration - 从现在开始到 Task 被执行的时间间隔。取值范围 Duration.Min, [Duration.Max]，小于或等于 Duration.Zero时 Task 将立即被执行。
- interval: Duration - 两次 Task 之间的时间间隔。取值范围 (Duration.Zero, Duration.Max]。
- task: ()->Unit - 待定时执行的任务。
- style!: CatchupStyle - 追平策略，默认 Burst。当 Task 执行时间过长时，后续任务执行时间点可能发生延迟，不同的追平策略适用于不同的场景，详见 CatchupStyle 说明。

返回值：

- Timer - 生成的对象实例。

异常：

- IllegalArgumentException: 当 period 小于等于 Duration.Zero 或 interval 小于等于 Duration.Zero 时，抛出异常。

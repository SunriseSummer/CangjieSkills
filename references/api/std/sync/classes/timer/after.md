<!-- cj-doc kind="api-member" level="6" id="std.sync.class.timer.after" parent="std.sync.class.timer" -->
# Timer.after

[← Timer](index.md)

## 签名

```cangjie role=signature
public static func after(delay: Duration, task: () -> Option<Duration>): Timer
```

初始化一个 Timer，关联的 Task 被调度执行的次数取决于它的返回值。

## 契约

功能：初始化一个 Timer，关联的 Task 被调度执行的次数取决于它的返回值。如果定时器第一次触发的时间点小于当前时间，关联的 Task 会立刻被调度执行。如果关联 Task 的返回值为 Option.None，该 Timer 将会失效，并停止调度关联 Task。如果关联 Task 的返回值为 Option.Some(v) 且 `v` 大于 Duration.Zero，下次运行前的最小时间间隔将被设置为 v。否则，关联 Task 会立刻再次被调度执行。

参数：

- delay: Duration - 从现在开始到关联 Task 首次被调度执行的时间间隔
- task: () ->Option\<Duration> - 该 Timer 调度执行的 Task

返回值：

- Timer - 一个 Timer 实例

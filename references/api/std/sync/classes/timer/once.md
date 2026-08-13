<!-- cj-doc kind="api-member" level="6" id="std.sync.class.timer.once" parent="std.sync.class.timer" -->
# Timer.once

[← Timer](index.md)

## 签名

```cangjie role=signature
public static func once(delay: Duration, task: ()->Unit): Timer
```

设置并启动一次性定时任务，返回控制这个任务的 Timer 对象实例。

## 契约

参数：

- delay: Duration - 从现在开始到 Task 被执行的时间间隔。取值范围 [Duration.Min, Duration.Max]，小于或等于 Duration.Zero 时 Task 将立即被执行。
- task: ()->Unit - 待定时执行的任务。

返回值：

- Timer - 生成的对象实例。

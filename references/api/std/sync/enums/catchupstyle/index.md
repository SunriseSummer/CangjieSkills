<!-- cj-doc kind="api-type" level="5" id="std.sync.enum.catchupstyle" parent="std.sync" -->
# CatchupStyle

[← std.sync](../../index.md)

`CatchupStyle`

表示不同的重复性任务定时器需要使用的追平策略。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Burst`](value-burst.md) | 该策略下，每个任务的开始时间间隔固定，当任务执行时间大于设定的任务触发间隔时间时，依次执行错过的时间点上的任务，直到追平。 |
| [`Delay`](value-delay.md) | 该策略下，上一次任务结束与下一次任务开始的时间间隔总是固定的，即下一次任务的开始时间 = 上一次任务的结束时间 + 设定的任务触发间隔时间。 |
| [`Skip`](value-skip.md) | 该策略下，每个任务的开始时间间隔固定，当任务执行时间大于设定的任务触发间隔时间时，将跳过后面错过的时间点，以尽快追平。 |

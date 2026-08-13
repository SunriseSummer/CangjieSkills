<!-- cj-doc kind="guide-index" level="4" id="language.concurrency.5-终止线程" parent="language.concurrency" -->
# 5. 终止线程

[← 并发](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [5.1 取消模型（协作式）](5-1-取消模型-协作式.md) | `Future<T>.cancel()`：发送取消请求。 |
| [5.2 `SyncCounter`](5-2-synccounter.md) | 用于线程协调：`SyncCounter(n)`，配合 `dec()` 和 `waitUntilZero()` 使用 |

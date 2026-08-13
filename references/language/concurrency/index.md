<!-- cj-doc kind="guide-topic" level="3" id="language.concurrency" parent="language" -->
# 并发

[← 语言特性](../index.md)

spawn、Future、Atomic、Mutex、Condition、同步、取消与 ThreadLocal。

| 规则/任务 | 摘要 |
|---|---|
| [1. 并发概述](1-并发概述/index.md) | 并发模型以 `spawn`、`Future<T>` 和抢占式线程为核心；共享状态需要显式同步。 |
| [2. 创建线程](2-创建线程/index.md) | 语法：`spawn { => ... }` — 创建新的仓颉线程 |
| [3. 线程睡眠](3-线程睡眠/index.md) | 签名：`func sleep(dur: Duration): Unit` |
| [4. 同步机制](4-同步机制/index.md) | 仅 `load`、`store`、`swap`、`compareAndSwap` |
| [5. 终止线程](5-终止线程/index.md) | `Future<T>.cancel()`：发送取消请求。 |
| [6. 访问线程](6-访问线程/index.md) | `spawn` 返回 `Future<T>`，其中 `T` 匹配 Lambda 返回类型 |

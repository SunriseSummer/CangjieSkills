<!-- cj-doc kind="guide-index" level="4" id="language.concurrency.1-并发概述" parent="language.concurrency" -->
# 1. 并发概述

[← 并发](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [1.1 线程模型](1-1-线程模型.md) | 并发任务运行在抢占式线程模型上；共享可变状态必须通过锁、原子类型等同步机制保护。 |
| [1.2 跨语言注意事项](1-2-跨语言注意事项.md) | 调用阻塞的外部函数（如 `socket_read`）时，整个原生线程被阻塞，阻止其调度其他仓颉线程 — 降低吞吐量 |

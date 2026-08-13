<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.2-创建线程.2-1-spawn-关键字" parent="language.concurrency.2-创建线程" -->
# 2.1 `spawn` 关键字

[← 2. 创建线程](index.md)

- **语法**：`spawn { => ... }` — 创建新的仓颉线程
- 接受**无参 Lambda 表达式**作为线程体
- 新线程与创建线程并发运行
- **重要**：主线程退出时新线程会被杀死，即使未完成

<!-- cj-doc kind="example-category" level="3" id="examples.concurrency" parent="examples" -->
# 并发任务与同步

[← 应用示例](../index.md)

取得并发任务结果，用同步块、条件变量、原子变量和并发映射保护共享状态，并设计可关闭的阻塞容器。

| 示例 | 教学目标 |
|---|---|
| [取得并发任务结果](spawn-future.md) | spawn 返回 Future；get 等待任务并取得 Lambda 返回值。 |
| [从 synchronized 返回计算值](synchronized-value.md) | 把锁保护块作为表达式使用，在自动解锁的同时返回块末尾结果。 |
| [用 AtomicInt64 累加计数](atomic-counter.md) | 以 fetchAdd 原子更新，并根据返回的旧值推导更新后状态。 |
| [组合并发映射与原子计数器](concurrent-key-counter.md) | 用 `ConcurrentHashMap<K, AtomicInt64>` 建立按键原子计数器：`addIfAbsent` 只负责唯一初始化，后续增量由共享 Atomic 实例完成。 |
| [并发映射的原子插入](concurrent-map-insert.md) | 用 addIfAbsent 在竞争下只建立一个值，并根据返回结果判断是否插入。 |
| [实现可关闭的有界通道](bounded-channel-lifecycle.md) | 让阻塞发送、接收、批量取出和关闭共享单一锁域；入队通知接收者，出队通知发送者，drain 与 close 用 notifyAll 唤醒所有受影响线程。 |

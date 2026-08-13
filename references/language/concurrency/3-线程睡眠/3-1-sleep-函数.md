<!-- cj-doc kind="guide-leaf" level="5" id="language.concurrency.3-线程睡眠.3-1-sleep-函数" parent="language.concurrency.3-线程睡眠" -->
# 3.1 `sleep()` 函数

[← 3. 线程睡眠](index.md)

- **签名**：`func sleep(dur: Duration): Unit`
- 阻塞当前线程至少 `dur` 时长
- **规则**：若 `dur <= Duration.Zero`，线程仅**让出**执行资源而不睡眠

---

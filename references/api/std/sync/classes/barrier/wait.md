<!-- cj-doc kind="api-member" level="6" id="std.sync.class.barrier.wait" parent="std.sync.class.barrier" -->
# Barrier.wait

[← Barrier](index.md)

## 签名

```cangjie role=signature
public func wait(timeout!: Duration = Duration.Max): Unit
```

线程进入 Barrier 等待点。

## 契约

如果 Barrier 对象所有调用 `wait` 的次数（即进入等待点的线程数）等于初始值，那么唤醒所有等待的线程；如果调用 `wait` 方法次数仍小于初始值，那么当前线程进入阻塞状态直到被唤醒或者等待时间超过 `timeout`；如果调用 `wait` 次数已大于初始值，那么线程继续执行。

参数：

- timeout!: Duration - 阻塞时等待的最大时长，其默认值为 Duration.Max。

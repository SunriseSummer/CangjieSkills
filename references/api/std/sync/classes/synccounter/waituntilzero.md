<!-- cj-doc kind="api-member" level="6" id="std.sync.class.synccounter.waituntilzero" parent="std.sync.class.synccounter" -->
# SyncCounter.waitUntilZero

[← SyncCounter](index.md)

## 签名

```cangjie role=signature
public func waitUntilZero(timeout!: Duration = Duration.Max): Unit
```

当前线程等待直到计数器变为零，或等待时间超过 `timeout`。

## 契约

参数：

- timeout!: Duration - 阻塞时等待的最大时长，其默认值为 Duration.Max。

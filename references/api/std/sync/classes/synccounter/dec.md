<!-- cj-doc kind="api-member" level="6" id="std.sync.class.synccounter.dec" parent="std.sync.class.synccounter" -->
# SyncCounter.dec

[← SyncCounter](index.md)

## 签名

```cangjie role=signature
public func dec(): Unit
```

计数器减一。

## 契约

如果计数器变为零，那么唤醒所有等待的线程；如果计数器已经为零，那么数值保持不变。

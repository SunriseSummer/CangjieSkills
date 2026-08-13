<!-- cj-doc kind="api-member" level="6" id="std.sync.interface.lock.lock" parent="std.sync.interface.lock" -->
# Lock.lock

[← Lock](index.md)

## 签名

```cangjie role=signature
func lock(): Unit
```

锁定互斥体。

## 契约

如果互斥体已被锁定，则阻塞当前线程。

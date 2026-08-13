<!-- cj-doc kind="api-member" level="6" id="std.sync.interface.lock.unlock" parent="std.sync.interface.lock" -->
# Lock.unlock

[← Lock](index.md)

## 签名

```cangjie role=signature
func unlock(): Unit
```

解锁互斥体。

## 契约

如果互斥体被重复加锁了 N 次，那么需要调用 N 次该函数来完全解锁。一旦互斥体被完全解锁，如果有其他线程阻塞在此锁上，则唤醒其中一个线程。

异常：

- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。

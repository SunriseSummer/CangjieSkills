<!-- cj-doc kind="api-member" level="6" id="std.sync.class.semaphore.release" parent="std.sync.class.semaphore" -->
# Semaphore.release

[← Semaphore](index.md)

## 签名

```cangjie role=signature
public func release(amount!: Int64 = 1): Unit
```

向 Semaphore 对象释放指定值。

## 契约

如果内部计数器在累加释放值后能够满足当前阻塞在 Semaphore 对象的线程，那么将得到满足的线程唤醒；内部计数器的值不会大于初始值，即如果计数器的值在累加后大于初始值，那么仍被设置为初始值。所有在调用 `release` 之前的操作都先发生于调用 `acquire/tryAcquire` 之后的操作。

参数：

- amount!: Int64 - 向对象内部计数器中释放的数值，默认值为 1。

异常：

- IllegalArgumentException - 参数 `amount` 为负数，或大于初始值。

<!-- cj-doc kind="api-member" level="6" id="std.sync.class.semaphore.acquire" parent="std.sync.class.semaphore" -->
# Semaphore.acquire

[← Semaphore](index.md)

## 签名

```cangjie role=signature
public func acquire(amount!: Int64 = 1): Unit
```

向 Semaphore 对象获取指定值。

## 契约

如果当前计数器小于要求的数值，那么当前线程将被阻塞，直到获取满足数量的值后才被唤醒。

参数：

- amount!: Int64 - 向对象内部计数器中获取的数值，默认值为 1。

异常：

- IllegalArgumentException - 参数 `amount` 为负数，或大于初始值。

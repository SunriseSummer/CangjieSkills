<!-- cj-doc kind="api-member" level="6" id="std.sync.class.semaphore.tryacquire" parent="std.sync.class.semaphore" -->
# Semaphore.tryAcquire

[← Semaphore](index.md)

## 签名

```cangjie role=signature
public func tryAcquire(amount!: Int64 = 1): Bool
```

尝试向 Semaphore 对象获取指定值。

## 契约

该方法不会阻塞线程。如果有多个线程并发执行获取操作，则无法保证线程间的获取顺序。

参数：

- amount!: Int64 - 向对象内部计数器中获取的数值，默认值为 1。

返回值：

- Bool - 如果当前计数器小于要求的数值，则获取失败并返回 `false`；成功获取值时返回 `true`。

异常：

- IllegalArgumentException - 参数 `amount` 为负数，或大于初始值。

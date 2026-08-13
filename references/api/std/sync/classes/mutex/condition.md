<!-- cj-doc kind="api-member" level="6" id="std.sync.class.mutex.condition" parent="std.sync.class.mutex" -->
# Mutex.condition

[← Mutex](index.md)

## 签名

```cangjie role=signature
public func condition(): Condition
```

仅在当前线程已持有该 `Mutex` 时创建关联 `Condition`；否则抛出 `IllegalSynchronizationStateException`。

## 契约

可能被用来实现 “单 Lock 多等待队列” 的并发原语。

返回值：

- Condition - 创建的与该 Mutex 相关的 Condition 实例。

异常：

- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。

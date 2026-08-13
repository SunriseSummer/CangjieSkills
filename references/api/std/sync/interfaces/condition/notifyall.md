<!-- cj-doc kind="api-member" level="6" id="std.sync.interface.condition.notifyall" parent="std.sync.interface.condition" -->
# Condition.notifyAll

[← Condition](index.md)

## 签名

```cangjie role=signature
func notifyAll(): Unit
```

唤醒所有等待在关联互斥体上的线程。

## 契约

异常：

- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。

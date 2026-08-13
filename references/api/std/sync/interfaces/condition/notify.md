<!-- cj-doc kind="api-member" level="6" id="std.sync.interface.condition.notify" parent="std.sync.interface.condition" -->
# Condition.notify

[← Condition](index.md)

## 签名

```cangjie role=signature
func notify(): Unit
```

唤醒一个等待在关联互斥体上的线程。

## 契约

异常：

- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。

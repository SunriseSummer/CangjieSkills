<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.queue.remove" parent="std.collection.interface.queue" -->
# Queue<T>.remove

[← Queue<T>](index.md)

## 签名

```cangjie role=signature
func remove(): ?T
```

删除队列中的头部元素并返回这个元素的值。

## 契约

返回值：

- ?T - Option 封装的被删除的元素的值，如果队列为空，返回 `None`。

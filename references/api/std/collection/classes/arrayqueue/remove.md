<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arrayqueue.remove" parent="std.collection.class.arrayqueue" -->
# ArrayQueue<T>.remove

[← ArrayQueue<T>](index.md)

## 签名

```cangjie role=signature
public func remove(): ?T
```

删除队列中的头部元素并返回该值，如果此队列为空，返回 `None`。

## 契约

返回值：

- ?T - 被删除的头部元素。

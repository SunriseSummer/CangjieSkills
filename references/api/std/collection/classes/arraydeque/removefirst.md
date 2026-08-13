<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraydeque.removefirst" parent="std.collection.class.arraydeque" -->
# ArrayDeque<T>.removeFirst

[← ArrayDeque<T>](index.md)

## 签名

```cangjie role=signature
public func removeFirst(): ?T
```

删除双端队列中的头部元素并返回该值，如果此双端队列为空，返回 `None`。

## 契约

返回值：

- ?T - 被删除的头部元素。

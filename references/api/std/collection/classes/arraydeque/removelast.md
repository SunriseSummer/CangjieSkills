<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraydeque.removelast" parent="std.collection.class.arraydeque" -->
# ArrayDeque<T>.removeLast

[← ArrayDeque<T>](index.md)

## 签名

```cangjie role=signature
public func removeLast(): ?T
```

删除双端队列中的尾部元素并返回该值，如果此双端队列为空，返回 `None`。

## 契约

返回值：

- ?T - 被删除的尾部元素。

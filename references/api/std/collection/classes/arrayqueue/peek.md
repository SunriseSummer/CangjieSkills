<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arrayqueue.peek" parent="std.collection.class.arrayqueue" -->
# ArrayQueue<T>.peek

[← ArrayQueue<T>](index.md)

## 签名

```cangjie role=signature
public func peek():?T
```

查看此队列头部元素。

## 契约

功能：查看此队列头部元素。此操作不会删除元素。

返回值：

- ?T - 队列的头部元素，如果队列为空，返回`None`。

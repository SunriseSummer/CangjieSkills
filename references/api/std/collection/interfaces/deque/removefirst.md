<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.deque.removefirst" parent="std.collection.interface.deque" -->
# Deque<T>.removeFirst

[← Deque<T>](index.md)

## 签名

```cangjie role=signature
func removeFirst(): ?T
```

删除双端队列中的头部元素并返回这个元素的值。

## 契约

返回值：

- ?T - Option 封装的被删除的元素的值，如果双端队列为空，返回 None。

<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.queue.peek" parent="std.collection.interface.queue" -->
# Queue<T>.peek

[← Queue<T>](index.md)

## 签名

```cangjie role=signature
func peek(): ?T
```

访问双端队列头部元素，该操作不会删除头部元素。

## 契约

返回值：

- ?T - Option 封装的头部元素的值，如果双端队列为空，返回 `None`。

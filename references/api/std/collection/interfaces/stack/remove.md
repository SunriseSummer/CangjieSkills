<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.stack.remove" parent="std.collection.interface.stack" -->
# Stack<T>.remove

[← Stack<T>](index.md)

## 签名

```cangjie role=signature
func remove(): ?T
```

删除并返回栈顶的元素。

## 契约

返回值：

- ?T - 被删除的栈顶元素，如果栈为空，返回 `None`。

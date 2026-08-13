<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.stack.peek" parent="std.collection.interface.stack" -->
# Stack<T>.peek

[← Stack<T>](index.md)

## 签名

```cangjie role=signature
func peek(): ?T
```

查看栈顶元素，该操作不会删除栈顶元素。

## 契约

返回值：

- ?T - 栈顶元素，如果栈为空，返回 `None`。

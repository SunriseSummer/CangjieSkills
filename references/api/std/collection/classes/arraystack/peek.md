<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraystack.peek" parent="std.collection.class.arraystack" -->
# ArrayStack<T>.peek

[← ArrayStack<T>](index.md)

## 签名

```cangjie role=signature
public func peek(): ?T
```

获取栈顶的元素，该操作不会做出栈操作，只查看栈顶的元素。

## 契约

功能：获取栈顶的元素，该操作不会做出栈操作，只查看栈顶的元素。当栈为空时，返回 `None`。

返回值：

- ?T - 栈顶的元素。

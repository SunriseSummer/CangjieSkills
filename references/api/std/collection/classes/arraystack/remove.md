<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraystack.remove" parent="std.collection.class.arraystack" -->
# ArrayStack<T>.remove

[← ArrayStack<T>](index.md)

## 签名

```cangjie role=signature
public func remove(): ?T
```

出栈操作，删除栈顶的元素并且返回这个元素。

## 契约

功能：出栈操作，删除栈顶的元素并且返回这个元素。当栈为空时，返回 `None`。

返回值：

- ?T - 被删除的栈顶元素。

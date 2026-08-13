<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.orderedset.removelast" parent="std.collection.interface.orderedset" -->
# OrderedSet<T>.removeLast

[← OrderedSet<T>](index.md)

## 签名

```cangjie role=signature
func removeLast(): ?T
```

删除 OrderedSet 的最后一个元素。

## 契约

返回值：

- ?T - 如果当前 OrderedSet 不为空，返回 Option 封装的被删除的元素，否则返回 `None`。

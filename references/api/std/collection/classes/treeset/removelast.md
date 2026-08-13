<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.removelast" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.removeLast

[← TreeSet<T> where T <: Comparable<T>](index.md)

## 签名

```cangjie role=signature
public func removeLast(): ?T
```

删除 TreeSet 的最后一个元素。

## 契约

返回值：

- ?T - 如果存在最后一个元素，那么删除该元素，用 Option 封装该元素并返回；否则返回 Option\<T>.None。

<!-- cj-doc kind="api-member" level="5" id="std.collection.func.collecthashset-t-iterable-t-where-t-hashable-equatable-t" parent="std.collection" -->
# collectHashSet<T>(Iterable<T>) where T <: Hashable & Equatable<T>

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func collectHashSet<T>(it: Iterable<T>): HashSet<T> where T <: Hashable & Equatable<T>
```

将一个迭代器转换成 HashSet 类型。

## 契约

参数：

- it: Iterable\<T> - 给定的迭代器。

返回值：

- HashSet\<T> - 返回一个 HashSet。

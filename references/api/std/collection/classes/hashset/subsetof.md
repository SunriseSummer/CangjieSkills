<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.subsetof" parent="std.collection.class.hashset" -->
# HashSet<T> where T <: Hashable & Equatable<T>.subsetOf

[← HashSet<T> where T <: Hashable & Equatable<T>](index.md)

## 签名

```cangjie role=signature
public func subsetOf(other: ReadOnlySet<T>): Bool
```

检查该集合是否为其他 ReadOnlySet 的子集。

## 契约

参数：

- other: ReadOnlySet\<T> - 传入集合，此函数将判断当前集合是否为 other 的子集。

返回值：

- Bool - 如果该 Set 是指定 ReadOnlySet 的子集，则返回 true；否则返回 false。

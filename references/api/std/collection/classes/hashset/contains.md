<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.contains" parent="std.collection.class.hashset" -->
# HashSet<T> where T <: Hashable & Equatable<T>.contains

[← HashSet<T> where T <: Hashable & Equatable<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func contains(Collection<T>)

### 签名

```cangjie role=signature
public func contains(all!: Collection<T>): Bool
```

判断 HashSet 是否包含指定 Collection 中的所有元素。

### 契约

参数：

- all!: Collection\<T> - 指定的元素集合。

返回值：

- Bool - 如果此 HashSet 包含 Collection 中的所有元素，则返回 true；否则，返回 false。

## func contains(T)

### 签名

```cangjie role=signature
public func contains(element: T): Bool
```

判断 HashSet 是否包含指定元素。

### 契约

参数：

- element: T - 指定的元素。

返回值：

- Bool - 如果包含指定元素，则返回 true；否则，返回 false。

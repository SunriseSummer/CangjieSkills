<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.treeset.extension.extend-t-treeset-t-equatable-treeset-t" parent="std.collection.class.treeset" -->
# extend<T> TreeSet<T> <: Equatable<TreeSet<T>>

[← TreeSet<T> where T <: Comparable<T>](../index.md)

`extend<T> TreeSet<T> <: Equatable<TreeSet<T>>`

为 TreeSet<T> 类型扩展 Equatable<TreeSet<T>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`operator !=(that: TreeSet<T>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 TreeSet<T> 实例是否不等。 |
| [`operator ==(that: TreeSet<T>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 TreeSet<T> 实例是否相等。 |

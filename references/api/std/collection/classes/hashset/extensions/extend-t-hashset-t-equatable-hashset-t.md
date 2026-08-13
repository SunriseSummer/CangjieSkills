<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.hashset.extension.extend-t-hashset-t-equatable-hashset-t" parent="std.collection.class.hashset" -->
# extend<T> HashSet<T> <: Equatable<HashSet<T>>

[← HashSet<T> where T <: Hashable & Equatable<T>](../index.md)

`extend<T> HashSet<T> <: Equatable<HashSet<T>>`

为 HashSet<T> 类型扩展 Equatable<HashSet<T>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`operator !=(that: HashSet<T>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 HashSet<T> 实例是否不等。 |
| [`operator ==(that: HashSet<T>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 HashSet<T> 实例是否相等。 |

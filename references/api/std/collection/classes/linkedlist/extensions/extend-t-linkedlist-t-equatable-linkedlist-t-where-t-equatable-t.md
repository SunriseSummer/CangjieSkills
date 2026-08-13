<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.linkedlist.extension.extend-t-linkedlist-t-equatable-linkedlist-t-where-t-equatable-t" parent="std.collection.class.linkedlist" -->
# extend<T> LinkedList<T> <: Equatable<LinkedList<T>> where T <: Equatable<T>

[← LinkedList<T>](../index.md)

`extend<T> LinkedList<T> <: Equatable<LinkedList<T>> where T <: Equatable<T>`

为 LinkedList<T> 类型扩展 Equatable<LinkedList<T>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`operator !=(right: LinkedList<T>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 LinkedList<T> 实例是否不等。 |
| [`operator ==(right: LinkedList<T>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 LinkedList<T> 实例是否相等。 |

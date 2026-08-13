<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.arraylist.extension.extend-t-arraylist-t-equatable-arraylist-t-where-t-equatable-t" parent="std.collection.class.arraylist" -->
# extend<T> ArrayList<T> <: Equatable<ArrayList<T>> where T <: Equatable<T>

[← ArrayList<T>](../index.md)

`extend<T> ArrayList<T> <: Equatable<ArrayList<T>> where T <: Equatable<T>`

为 ArrayList<T> 类型扩展 Equatable<ArrayList<T>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`contains(element: T): Bool`](../contains.md) | 判断当前数组中是否含有指定元素 `element`。 |
| [`operator !=(that: ArrayList<T>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 ArrayList 实例是否不等。 |
| [`operator ==(that: ArrayList<T>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 ArrayList 实例是否相等。 |

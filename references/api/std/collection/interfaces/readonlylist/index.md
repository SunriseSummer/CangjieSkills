<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.readonlylist" parent="std.collection" -->
# ReadOnlyList<T>

[← std.collection](../../index.md)

`ReadOnlyList<T> <: Collection<T>`

定义了只读列表。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?T`](prop-first.md) | 返回此列表中的第一个元素，如果没有则返回 None。 |
| [`last: ?T`](prop-last.md) | 返回此列表中的最后一个元素，如果没有则返回 None。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`get(index: Int64): ?T`](get.md) | 返回此列表中指定位置的元素。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](index: Int64): T`](operator-indexer.md) | 操作符重载 - get。 |

<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.stack" parent="std.collection" -->
# Stack<T>

[← std.collection](../../index.md)

`Stack<T> <: Collection<T>`

Stack（栈）是一种数据结构，具有后进先出（Last In First Out，LIFO）的特点。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: T): Unit`](add.md) | 向栈中添加元素。 |
| [`peek(): ?T`](peek.md) | 查看栈顶元素，该操作不会删除栈顶元素。 |
| [`remove(): ?T`](remove.md) | 删除并返回栈顶的元素。 |

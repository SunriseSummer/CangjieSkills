<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.deque" parent="std.collection" -->
# Deque<T>

[← std.collection](../../index.md)

`Deque<T> <: Collection<T>`

Deque（double-ended queue）是一种具有队列和栈特性的数据结构，允许从两端插入和删除元素。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?T`](prop-first.md) | 访问双端队列头部元素，该操作不会删除头部元素。 |
| [`last: ?T`](prop-last.md) | 访问双端队列尾部元素，该操作不会删除尾部元素。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addFirst(element: T): Unit`](addfirst.md) | 在双端队列头部插入指定的元素。 |
| [`addLast(element: T): Unit`](addlast.md) | 在双端队列尾部插入指定的元素。 |
| [`removeFirst(): ?T`](removefirst.md) | 删除双端队列中的头部元素并返回这个元素的值。 |
| [`removeLast(): ?T`](removelast.md) | 删除双端队列中的尾部元素并返回这个元素的值。 |

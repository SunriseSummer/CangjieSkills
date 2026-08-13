<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.queue" parent="std.collection" -->
# Queue<T>

[← std.collection](../../index.md)

`Queue<T> <: Collection<T>`

队列数据结构，它遵循先进先出（First In First Out, FIFO）原则。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: T): Unit`](add.md) | 在队列尾部插入指定的元素。 |
| [`peek(): ?T`](peek.md) | 访问双端队列头部元素，该操作不会删除头部元素。 |
| [`remove(): ?T`](remove.md) | 删除队列中的头部元素并返回这个元素的值。 |

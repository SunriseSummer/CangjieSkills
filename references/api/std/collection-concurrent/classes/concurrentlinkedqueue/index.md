<!-- cj-doc kind="api-type" level="5" id="std.collection.concurrent.class.concurrentlinkedqueue" parent="std.collection.concurrent" -->
# ConcurrentLinkedQueue<E>

[← std.collection.concurrent](../../index.md)

`ConcurrentLinkedQueue<E> <: Collection<E>`

提供一个线程安全的队列，可以在多线程环境下安全地进行元素的添加和删除操作。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`size: Int64`](prop-size.md) | 获取此 ConcurrentLinkedQueue 的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ConcurrentLinkedQueue 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: E): Bool`](add.md) | 非阻塞的入队操作，将元素添加到队列尾部。 |
| [`isEmpty(): Bool`](isempty.md) | 判断当前队列是否为空。 |
| [`iterator(): Iterator<E>`](iterator.md) | 获取当前队列的迭代器，用于遍历当前队列。 |
| [`peek(): Option<E>`](peek.md) | 获取队首元素，不会删除该元素。 |
| [`remove(): Option<E>`](remove.md) | 获取并删除队首元素。 |
| [`toArray(): Array<E>`](toarray.md) | 将当前队列中所有元素按顺序存入数组，先入队的元素在数组下标较小的位置。 |

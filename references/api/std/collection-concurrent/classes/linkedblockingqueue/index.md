<!-- cj-doc kind="api-type" level="5" id="std.collection.concurrent.class.linkedblockingqueue" parent="std.collection.concurrent" -->
# LinkedBlockingQueue<E>

[← std.collection.concurrent](../../index.md)

`LinkedBlockingQueue<E>`

实现是带阻塞机制并支持用户指定容量上界的并发队列。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](field-capacity.md) | 返回此 LinkedBlockingQueue 的容量。 |
| [`size: Int64`](prop-size.md) | 返回此 LinkedBlockingQueue 的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个具有默认初始容量（Int64.Max）的 LinkedBlockingQueue。 |
| [`init(capacity: Int64)`](init.md) | 构造一个带有传入容量大小的 LinkedBlockingQueue。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: E): Unit`](add.md) | 阻塞的入队操作，将元素添加到队列尾部。 |
| [`add(element: E, timeout: Duration): Bool`](add.md) | 阻塞的入队操作，将元素添加到队列尾部，如果队列满了，将等待指定的时间。 |
| [`peek(): Option<E>`](peek.md) | 获取队首元素。 |
| [`remove(): E`](remove.md) | 阻塞的出队操作，获得队首元素并删除。 |
| [`remove(timeout: Duration): Option<E>`](remove.md) | 阻塞的出队操作，获得队首元素并删除。 |
| [`tryAdd(element: E): Bool`](tryadd.md) | 非阻塞的入队操作，将元素添加到队列尾部。 |
| [`tryRemove(): Option<E>`](tryremove.md) | 非阻塞的出队操作，获得队首元素并删除。 |

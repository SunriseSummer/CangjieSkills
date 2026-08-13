<!-- cj-doc kind="api-type" level="5" id="std.collection.concurrent.class.arrayblockingqueue" parent="std.collection.concurrent" -->
# ArrayBlockingQueue<E>

[← std.collection.concurrent](../../index.md)

`ArrayBlockingQueue<E>`

自带容量限制及阻塞、超时、非阻塞入队出队协议。只需这些语义时直接使用；若还要求线性化的 close、drain 或 cancel，不要在外层叠加镜像条件变量，应让元素、生命周期和条件通知共享单一锁域。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](field-capacity.md) | 此 ArrayBlockingQueue 的容量。 |
| [`size: Int64`](prop-size.md) | 返回此 ArrayBlockingQueue 的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(capacity: Int64)`](init.md) | 构造一个带有传入容量大小的 ArrayBlockingQueue。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: E): Unit`](add.md) | 阻塞的入队操作，将元素添加到队列尾部。 |
| [`add(element: E, timeout: Duration): Bool`](add.md) | 阻塞的入队操作，将元素添加到队列尾部，如果队列满了，将等待指定的时间。 |
| [`peek(): Option<E>`](peek.md) | 非阻塞的获取队首元素。 |
| [`remove(): E`](remove.md) | 阻塞的出队操作，获得队首元素并删除。 |
| [`remove(timeout: Duration): Option<E>`](remove.md) | 阻塞的出队操作，获得队首元素并删除，如果队列为空，将等待指定的时间。 |
| [`tryAdd(element: E): Bool`](tryadd.md) | 非阻塞的入队操作，将元素添加到队列尾部。 |
| [`tryRemove(): Option<E>`](tryremove.md) | 非阻塞的出队操作，获得队首元素并删除。 |

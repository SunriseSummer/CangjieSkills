<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.remove" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.remove

[← ArrayBlockingQueue<E>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove()

### 签名

```cangjie role=signature
public func remove(): E
```

阻塞的出队操作，获得队首元素并删除。

### 契约

功能：阻塞的出队操作，获得队首元素并删除。如果队列为空，则阻塞等待。

返回值：

- E - 返回队首元素。

## func remove(Duration)

### 签名

```cangjie role=signature
public func remove(timeout: Duration): Option<E>
```

阻塞的出队操作，获得队首元素并删除，如果队列为空，将等待指定的时间。

### 契约

功能：阻塞的出队操作，获得队首元素并删除，如果队列为空，将等待指定的时间。如果 timeout 为负，则会立即执行出队操作并且返回操作结果。

参数：

- timeout: Duration - 等待时间。

返回值：

- Option\<E> - 返回队首元素。如果超出等待时间还未成功获取队首元素，则返回 None。

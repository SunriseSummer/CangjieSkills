<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.add" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.add

[← ArrayBlockingQueue<E>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func add(E)

### 签名

```cangjie role=signature
public func add(element: E): Unit
```

阻塞的入队操作，将元素添加到队列尾部。

### 契约

功能：阻塞的入队操作，将元素添加到队列尾部。如果队列已满，则阻塞等待。

参数：

- element: E - 要添加的元素。

## func add(E, Duration)

### 签名

```cangjie role=signature
public func add(element: E, timeout: Duration): Bool
```

阻塞的入队操作，将元素添加到队列尾部，如果队列满了，将等待指定的时间。

### 契约

功能：阻塞的入队操作，将元素添加到队列尾部，如果队列满了，将等待指定的时间。如果 timeout 为负，则会立即执行入队操作并且返回操作结果。

参数：

- element: E - 要添加的元素。
- timeout: Duration - 等待时间。

返回值：

- Bool - 成功添加元素返回 true，超出等待时间还未成功添加元素返回 false。

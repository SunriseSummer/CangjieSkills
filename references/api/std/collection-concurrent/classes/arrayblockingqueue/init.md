<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.init" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.init

[← ArrayBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public init(capacity: Int64)
```

构造一个带有传入容量大小的 ArrayBlockingQueue。

## 契约

参数：

- capacity: Int64 - 初始化容量大小。

异常：

- IllegalArgumentException - 如果 capacity 小于等于 0 则抛出异常。

<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.linkedblockingqueue.init" parent="std.collection.concurrent.class.linkedblockingqueue" -->
# LinkedBlockingQueue<E>.init

[← LinkedBlockingQueue<E>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个具有默认初始容量（Int64.Max）的 LinkedBlockingQueue。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

构造一个带有传入容量大小的 LinkedBlockingQueue。

### 契约

参数：

- capacity: Int64 - 初始化容量大小。

异常：

- IllegalArgumentException - 如果 capacity 小于等于 0 则抛出异常。

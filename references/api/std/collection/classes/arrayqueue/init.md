<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arrayqueue.init" parent="std.collection.class.arrayqueue" -->
# ArrayQueue<T>.init

[← ArrayQueue<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的队列，其容量大小为默认值 8。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

构造一个具有指定容量的队列，当 capacity 小于默认容量 8 时，构造的 ArrayQueue 初始容量为 8 。

### 契约

参数：

- capacity: Int64 - 指定的初始容量。

异常：

- IllegalArgumentException - 如果参数的大小小于 0 则抛出异常。

<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraystack.init" parent="std.collection.class.arraystack" -->
# ArrayStack<T>.init

[← ArrayStack<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的 ArrayStack，其初始容量为 8。

## func init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

构造一个空的 ArrayStack，其初始容量为指定的值。

### 契约

功能：构造一个空的 ArrayStack，其初始容量为指定的值。当 capacity 小于默认容量 8 时，构造的 ArrayStack 初始容量为 8。

参数：

- capacity: Int64 - 初始容量大小。

异常：

- IllegalArgumentException - 当入参为负数时，抛出此异常。

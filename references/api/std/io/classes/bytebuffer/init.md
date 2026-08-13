<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.init" parent="std.io.class.bytebuffer" -->
# ByteBuffer.init

[← ByteBuffer](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

创建 ByteBuffer 实例，默认的初始容量是 32。

## init(Array<Byte>)

### 签名

```cangjie role=signature
public init(source: Array<Byte>)
```

根据传入的数组构造 ByteBuffer 实例。

### 契约

参数：

- source: Array\<Byte> - 传入的数组。

## init(Int64)

### 签名

```cangjie role=signature
public init(capacity: Int64)
```

创建 ByteBuffer 实例。

### 契约

参数：

- capacity: Int64 - 指定的初始容量。

异常：

- IllegalArgumentException - 当 capacity 小于 0 时，抛出异常。

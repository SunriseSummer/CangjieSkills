<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedoutputstream.init" parent="std.io.class.bufferedoutputstream" -->
# BufferedOutputStream<T> where T <: OutputStream.init

[← BufferedOutputStream<T> where T <: OutputStream](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init(T)

### 签名

```cangjie role=signature
public init(output: T)
```

创建 BufferedOutputStream 实例，缓冲区容量取默认值 4096。

### 契约

参数：

- output: T - 绑定指定输出流。

## init(T, Array<Byte>)

### 签名

```cangjie role=signature
public init(output: T, buffer: Array<Byte>)
```

创建 BufferedOutputStream 实例。

### 契约

其内部使用的缓存区由入参决定，在注重性能的场景下，通过复用传入的 `buffer`，可以减少内存分配次数，提高性能。

参数：

- output: T - 绑定一个输出流。
- buffer: Array\<Byte> - BufferedOutputStream 使用的内部缓存区。

异常：

- IllegalArgumentException - 当 buffer 大小等于 0 时，抛出异常。

## init(T, Int64)

### 签名

```cangjie role=signature
public init(output: T, capacity: Int64)
```

创建 BufferedOutputStream 实例。

### 契约

参数：

- output: T - 绑定指定输出流。
- capacity: Int64 - 内部缓冲区容量。

异常：

- IllegalArgumentException - 当 capacity 小于等于 0 时，抛出异常。

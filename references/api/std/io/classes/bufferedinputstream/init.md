<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedinputstream.init" parent="std.io.class.bufferedinputstream" -->
# BufferedInputStream<T> where T <: InputStream.init

[← BufferedInputStream<T> where T <: InputStream](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init(T)

### 签名

```cangjie role=signature
public init(input: T)
```

创建 BufferedInputStream 实例，缓冲区容量取默认值 4096。

### 契约

参数：

- input: T - 绑定指定输入流。

## init(T, Array<Byte>)

### 签名

```cangjie role=signature
public init(input: T, buffer: Array<Byte>)
```

创建 BufferedInputStream 实例。

### 契约

其内部使用的缓存区由入参决定，在注重性能的场景下，通过复用传入的 `buffer`，可以减少内存分配次数，提高性能。

参数：

- input: T - 绑定一个输入流。
- buffer: Array\<Byte> - BufferedInputStream 使用的内部缓存区。

异常：

- IllegalArgumentException - 当 buffer 大小等于 0 时，抛出异常。

## init(T, Int64)

### 签名

```cangjie role=signature
public init(input: T, capacity: Int64)
```

创建 BufferedInputStream 实例。

### 契约

参数：

- input: T - 绑定指定输入流。
- capacity: Int64 - 内部缓冲区容量。

异常：

- IllegalArgumentException - 当 capacity 小于等于 0 时，抛出异常。

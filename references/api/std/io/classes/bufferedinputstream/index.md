<!-- cj-doc kind="api-type" level="5" id="std.io.class.bufferedinputstream" parent="std.io" -->
# BufferedInputStream<T> where T <: InputStream

[← std.io](../../index.md)

`BufferedInputStream<T> <: InputStream where T <: InputStream`

提供带缓冲区的输入流。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(input: T)`](init.md) | 创建 BufferedInputStream 实例，缓冲区容量取默认值 4096。 |
| [`init(input: T, buffer: Array<Byte>)`](init.md) | 创建 BufferedInputStream 实例。 |
| [`init(input: T, capacity: Int64)`](init.md) | 创建 BufferedInputStream 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`read(buffer: Array<Byte>): Int64`](read.md) | 从绑定的输入流读出数据到 `buffer` 中。 |
| [`readByte(): ?Byte`](readbyte.md) | 从输入流中读取一个字节。 |
| [`reset(input: T): Unit`](reset.md) | 绑定新的输入流，重置状态，但不重置 `capacity`。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> BufferedInputStream<T> <: Resource where T <: Resource`](extensions/extend-t-bufferedinputstream-t-resource-where-t-resource.md) | 为 BufferedInputStream 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。 |
| [`extend<T> BufferedInputStream<T> <: Seekable where T <: Seekable`](extensions/extend-t-bufferedinputstream-t-seekable-where-t-seekable.md) | 为 BufferedInputStream 实现 Seekable 接口，支持查询数据长度，移动光标等操作。 |

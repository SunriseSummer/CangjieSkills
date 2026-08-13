<!-- cj-doc kind="api-type" level="5" id="std.io.class.bufferedoutputstream" parent="std.io" -->
# BufferedOutputStream<T> where T <: OutputStream

[← std.io](../../index.md)

`BufferedOutputStream<T> <: OutputStream where T <: OutputStream`

提供带缓冲区的输出流。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(output: T)`](init.md) | 创建 BufferedOutputStream 实例，缓冲区容量取默认值 4096。 |
| [`init(output: T, buffer: Array<Byte>)`](init.md) | 创建 BufferedOutputStream 实例。 |
| [`init(output: T, capacity: Int64)`](init.md) | 创建 BufferedOutputStream 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`flush(): Unit`](flush.md) | 刷新 BufferedOutputStream：将内部缓冲区的剩余数据写入绑定的输出流，并刷新 BufferedOutputStream。 |
| [`reset(output: T): Unit`](reset.md) | 绑定新的输出流，重置状态，但不重置 `capacity`。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 将 `buffer` 中的数据写入到绑定的输出流中。 |
| [`writeByte(v: Byte): Unit`](writebyte.md) | 写入一个字节到绑定的输出流中。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> BufferedOutputStream<T> <: Resource where T <: Resource`](extensions/extend-t-bufferedoutputstream-t-resource-where-t-resource.md) | 为 BufferedOutputStream 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。 |
| [`extend<T> BufferedOutputStream<T> <: Seekable where T <: Seekable`](extensions/extend-t-bufferedoutputstream-t-seekable-where-t-seekable.md) | 为 BufferedOutputStream 实现 Seekable 接口，支持查询数据长度，移动光标等操作。 |

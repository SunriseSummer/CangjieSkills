<!-- cj-doc kind="api-type" level="5" id="std.io.class.bytebuffer" parent="std.io" -->
# ByteBuffer

[← std.io](../../index.md)

`ByteBuffer <: IOStream & Seekable`

基于 Array<Byte> 数据类型，提供对字节流的写入、读取等操作。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 获取当前缓冲区容量。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建 ByteBuffer 实例，默认的初始容量是 32。 |
| [`init(source: Array<Byte>)`](init.md) | 根据传入的数组构造 ByteBuffer 实例。 |
| [`init(capacity: Int64)`](init.md) | 创建 ByteBuffer 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`bytes(): Array<Byte>`](bytes.md) | 获取当前 ByteBuffer 中未被读取的数据的切片。 |
| [`clear(): Unit`](clear.md) | 清除当前 ByteBuffer 中所有数据。 |
| [`clone(): ByteBuffer`](clone.md) | 用当前 ByteBuffer 中的数据来构造一个新的 ByteBuffer。 |
| [`read(buffer: Array<Byte>): Int64`](read.md) | `read(buffer)` 从当前位置读入非空目标数组并返回字节数；空数组会抛 `IllegalArgumentException`。 |
| [`readByte(): ?Byte`](readbyte.md) | 从输入流中读取一个字节。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 将缓冲区扩容指定大小。 |
| [`seek(sp: SeekPosition): Int64`](seek.md) | 将光标跳转到指定位置。 |
| [`setLength(length: Int64): Unit`](setlength.md) | 将当前数据修改为指定长度。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 将 `buffer` 中的数据写入到输出流中。 |
| [`writeByte(v: Byte): Unit`](writebyte.md) | 将一个字节写入到输出流中。 |

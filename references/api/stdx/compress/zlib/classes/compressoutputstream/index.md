<!-- cj-doc kind="api-type" level="5" id="stdx.compress.zlib.class.compressoutputstream" parent="stdx.compress.zlib" -->
# CompressOutputStream

[← stdx.compress.zlib](../../index.md)

`CompressOutputStream <: OutputStream`

压缩输出流。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(outputStream: OutputStream, wrap!: WrapType = DeflateFormat, compressLevel!: CompressLevel = DefaultCompression, bufLen!: Int64 = 512)`](init.md) | 构造一个压缩输出流，需绑定一个输出流，可设置压缩数据类型、压缩等级、内部缓冲区大小（每得到多少压缩后数据往输出流写出）。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭当前压缩输出流实例。 |
| [`flush(): Unit`](flush.md) | 刷新压缩输出流。 |
| [`write(inBuf: Array<Byte>): Unit`](write.md) | 将指定字节数组中的数据进行压缩，并写入输出流，当数据全部压缩完成并写入输出流，函数返回。 |

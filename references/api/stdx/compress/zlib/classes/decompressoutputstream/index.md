<!-- cj-doc kind="api-type" level="5" id="stdx.compress.zlib.class.decompressoutputstream" parent="stdx.compress.zlib" -->
# DecompressOutputStream

[← stdx.compress.zlib](../../index.md)

`DecompressOutputStream <: OutputStream`

解压输出流。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(outputStream: OutputStream, wrap!: WrapType = DeflateFormat, bufLen!: Int64 = 512)`](init.md) | 构造一个解压输出流。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭当前解压输出流实例。 |
| [`flush(): Unit`](flush.md) | 刷新解压输出流。 |
| [`write(inBuf: Array<Byte>): Unit`](write.md) | 将指定字节数组中的数据进行解压，并写入输出流，当数据全部解压完成并写入输出流，函数返回。 |

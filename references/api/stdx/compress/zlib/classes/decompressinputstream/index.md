<!-- cj-doc kind="api-type" level="5" id="stdx.compress.zlib.class.decompressinputstream" parent="stdx.compress.zlib" -->
# DecompressInputStream

[← stdx.compress.zlib](../../index.md)

`DecompressInputStream <: InputStream`

解压输入流。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(inputStream: InputStream, wrap!: WrapType = DeflateFormat, bufLen!: Int64 = 512)`](init.md) | 构造一个解压输入流。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭解压输入流。 |
| [`read(outBuf: Array<Byte>): Int64`](read.md) | 从绑定的输入流中读取数据并解压，解压后数据放入指定的字节数组中。 |

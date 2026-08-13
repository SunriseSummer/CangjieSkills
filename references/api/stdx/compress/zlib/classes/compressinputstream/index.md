<!-- cj-doc kind="api-type" level="5" id="stdx.compress.zlib.class.compressinputstream" parent="stdx.compress.zlib" -->
# CompressInputStream

[← stdx.compress.zlib](../../index.md)

`CompressInputStream <: InputStream`

压缩输入流。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(inputStream: InputStream, wrap!: WrapType = DeflateFormat, compressLevel!: CompressLevel = DefaultCompression, bufLen!: Int64 = 512)`](init.md) | 构造一个压缩输入流。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭压缩输入流。 |
| [`read(outBuf: Array<Byte>): Int64`](read.md) | 从绑定的输入流中读取数据并压缩，压缩后数据放入指定的字节数组中。 |

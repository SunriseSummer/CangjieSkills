<!-- cj-doc kind="api-type" level="5" id="std.io.class.chainedinputstream" parent="std.io" -->
# ChainedInputStream<T> where T <: InputStream

[← std.io](../../index.md)

`ChainedInputStream<T> <: InputStream where T <: InputStream`

提供顺序从 InputStream 数组中读取数据的能力。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(input: Array<T>)`](init.md) | 创建 ChainedInputStream 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`read(buffer: Array<Byte>): Int64`](read.md) | 依次从绑定 InputStream 数组中读出数据到 buffer 中。 |

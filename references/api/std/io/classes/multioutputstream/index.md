<!-- cj-doc kind="api-type" level="5" id="std.io.class.multioutputstream" parent="std.io" -->
# MultiOutputStream<T> where T <: OutputStream

[← std.io](../../index.md)

`MultiOutputStream<T> <: OutputStream where T <: OutputStream`

提供将数据同时写入到 OutputStream 数组中每个输出流中的能力。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(output: Array<T>)`](init.md) | 创建 MultiOutputStream 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`flush(): Unit`](flush.md) | 刷新绑定的输出流数组里的每个输出流。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 将 buffer 同时写入到绑定的 OutputStream 数组里的每个输出流中。 |

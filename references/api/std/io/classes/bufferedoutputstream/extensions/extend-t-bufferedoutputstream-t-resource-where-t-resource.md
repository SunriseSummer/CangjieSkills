<!-- cj-doc kind="api-extension" level="6" id="std.io.class.bufferedoutputstream.extension.extend-t-bufferedoutputstream-t-resource-where-t-resource" parent="std.io.class.bufferedoutputstream" -->
# extend<T> BufferedOutputStream<T> <: Resource where T <: Resource

[← BufferedOutputStream<T> where T <: OutputStream](../index.md)

`extend<T> BufferedOutputStream<T> <: Resource where T <: Resource`

为 BufferedOutputStream 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。

## 成员

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](../close.md) | 关闭当前流。 |
| [`isClosed(): Bool`](../isclosed.md) | 判断当前流是否关闭。 |

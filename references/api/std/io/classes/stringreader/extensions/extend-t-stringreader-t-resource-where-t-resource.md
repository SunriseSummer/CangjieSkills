<!-- cj-doc kind="api-extension" level="6" id="std.io.class.stringreader.extension.extend-t-stringreader-t-resource-where-t-resource" parent="std.io.class.stringreader" -->
# extend<T> StringReader<T> <: Resource where T <: Resource

[← StringReader<T> where T <: InputStream](../index.md)

`extend<T> StringReader<T> <: Resource where T <: Resource`

为 StringReader 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。

## 成员

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](../close.md) | 关闭当前流。 |
| [`isClosed(): Bool`](../isclosed.md) | 判断当前流是否关闭。 |

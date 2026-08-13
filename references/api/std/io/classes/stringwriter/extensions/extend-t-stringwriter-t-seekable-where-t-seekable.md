<!-- cj-doc kind="api-extension" level="6" id="std.io.class.stringwriter.extension.extend-t-stringwriter-t-seekable-where-t-seekable" parent="std.io.class.stringwriter" -->
# extend<T> StringWriter<T> <: Seekable where T <: Seekable

[← StringWriter<T> where T <: OutputStream](../index.md)

`extend<T> StringWriter<T> <: Seekable where T <: Seekable`

为 StringWriter 实现 Seekable 接口，支持查询数据长度，移动光标等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`seek(sp: SeekPosition): Int64`](../seek.md) | 移动光标到指定的位置。 |

<!-- cj-doc kind="api-extension" level="6" id="std.io.class.stringreader.extension.extend-t-stringreader-t-seekable-where-t-seekable" parent="std.io.class.stringreader" -->
# extend<T> StringReader<T> <: Seekable where T <: Seekable

[← StringReader<T> where T <: InputStream](../index.md)

`extend<T> StringReader<T> <: Seekable where T <: Seekable`

为 StringReader 实现 Seekable 接口，支持查询数据长度，移动光标等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`position: Int64`](../prop-position.md) | 返回当前光标位置。 |
| [`seek(sp: SeekPosition): Int64`](../seek.md) | 移动光标到指定的位置。 |

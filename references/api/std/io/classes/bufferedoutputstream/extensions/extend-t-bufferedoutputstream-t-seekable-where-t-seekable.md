<!-- cj-doc kind="api-extension" level="6" id="std.io.class.bufferedoutputstream.extension.extend-t-bufferedoutputstream-t-seekable-where-t-seekable" parent="std.io.class.bufferedoutputstream" -->
# extend<T> BufferedOutputStream<T> <: Seekable where T <: Seekable

[← BufferedOutputStream<T> where T <: OutputStream](../index.md)

`extend<T> BufferedOutputStream<T> <: Seekable where T <: Seekable`

为 BufferedOutputStream 实现 Seekable 接口，支持查询数据长度，移动光标等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`length: Int64`](../prop-length.md) | 返回当前流中的总数据量（以字节为单位）。 |
| [`position: Int64`](../prop-position.md) | 返回当前光标位置。 |
| [`remainLength: Int64`](../prop-remainlength.md) | 返回当前流中未读的数据量（以字节为单位）。 |
| [`seek(sp: SeekPosition): Int64`](../seek.md) | 移动光标到指定的位置。 |

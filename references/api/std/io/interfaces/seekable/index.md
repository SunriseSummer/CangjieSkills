<!-- cj-doc kind="api-type" level="5" id="std.io.interface.seekable" parent="std.io" -->
# Seekable

[← std.io](../../index.md)

`Seekable`

移动光标接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`length: Int64`](prop-length.md) | 返回当前流中的总数据量（以字节为单位）。 |
| [`position: Int64`](prop-position.md) | 返回当前光标位置。 |
| [`remainLength: Int64`](prop-remainlength.md) | 返回当前流中未读的数据量（以字节为单位）。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`seek(sp: SeekPosition): Int64`](seek.md) | 移动光标到指定的位置。 |

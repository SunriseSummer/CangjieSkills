<!-- cj-doc kind="api-type" level="5" id="std.fs.enum.openmode" parent="std.fs" -->
# OpenMode

[← std.fs](../../index.md)

`OpenMode <: ToString & Equatable<OpenMode>`

表示不同的文件打开模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Append`](value-append.md) | 构造一个 OpenMode 实例，指定以追加写入的方式打开文件。 |
| [`Read`](value-read.md) | 构造一个 OpenMode 实例，指定以只读的方式打开文件。 |
| [`ReadWrite`](value-readwrite.md) | 构造一个 OpenMode 实例，指定以可读可写的方式打开文件。 |
| [`Write`](value-write.md) | 构造一个 OpenMode 实例，指定以只写的方式打开文件，即文件存在时会将该文件截断为零字节大小，文件不存在则将创建文件。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 文件打开模式的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: OpenMode): Bool`](operator-ne.md) | 比较 OpenMode 实例是否不等。 |
| [`operator ==(that: OpenMode): Bool`](operator-eq.md) | 比较 OpenMode 实例是否相等。 |

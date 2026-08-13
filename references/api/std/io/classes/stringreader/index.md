<!-- cj-doc kind="api-type" level="5" id="std.io.class.stringreader" parent="std.io" -->
# StringReader<T> where T <: InputStream

[← std.io](../../index.md)

`StringReader<T> where T <: InputStream`

提供从 InputStream 输入流中读出数据并转换成字符或字符串的能力。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(input: T)`](init.md) | 创建 StringReader 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`lines(): Iterator<String>`](lines.md) | 获得 StringReader 的行迭代器。 |
| [`read(): ?Rune`](read.md) | 按字符读取流中的数据。 |
| [`readln(): Option<String>`](readln.md) | 按行读取流中的数据。 |
| [`readToEnd(): String`](readtoend.md) | 读取流中所有剩余数据。 |
| [`readUntil(predicate: (Rune)->Bool): Option<String>`](readuntil.md) | 从流内读取到使 `predicate` 返回 true 的字符位置（包含这个字符）或者流结束位置的数据。 |
| [`readUntil(v: Rune): Option<String>`](readuntil.md) | 从流内读取到指定字符（包含指定字符）或者流结束位置的数据。 |
| [`runes(): Iterator<Rune>`](runes.md) | 获得 StringReader 的 Rune 迭代器。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> StringReader<T> <: Resource where T <: Resource`](extensions/extend-t-stringreader-t-resource-where-t-resource.md) | 为 StringReader 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。 |
| [`extend<T> StringReader<T> <: Seekable where T <: Seekable`](extensions/extend-t-stringreader-t-seekable-where-t-seekable.md) | 为 StringReader 实现 Seekable 接口，支持查询数据长度，移动光标等操作。 |

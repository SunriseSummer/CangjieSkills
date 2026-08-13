<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-rune-parsable-rune" parent="std.convert.interface.parsable" -->
# extend Rune <: Parsable<Rune>

[← Parsable<T>](../index.md)

`extend Rune <: Parsable<Rune>`

此扩展主要用于实现将 Rune 类型字面量的字符串转换为 Rune 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Rune`](../parse/index.md) | 将 Rune 类型字面量的字符串转换为 Rune 值。 |
| [`static tryParse(data: String): Option<Rune>`](../tryparse/index.md) | 将 Rune 类型字面量的字符串转换为 Option<Rune> 值。 |

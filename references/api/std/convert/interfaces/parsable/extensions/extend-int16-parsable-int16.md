<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-int16-parsable-int16" parent="std.convert.interface.parsable" -->
# extend Int16 <: Parsable<Int16>

[← Parsable<T>](../index.md)

`extend Int16 <: Parsable<Int16>`

此扩展主要用于实现将 Int16 类型字面量的字符串转换为 Int16 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Int16`](../parse/index.md) | 将 Int16 类型字面量的字符串转换为 Int16 值。 |
| [`static tryParse(data: String): Option<Int16>`](../tryparse/index.md) | 将 Int16 类型字面量的字符串转换为 Option<Int16> 值。 |

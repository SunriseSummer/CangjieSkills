<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-int8-parsable-int8" parent="std.convert.interface.parsable" -->
# extend Int8 <: Parsable<Int8>

[← Parsable<T>](../index.md)

`extend Int8 <: Parsable<Int8>`

此扩展主要用于实现将 Int8 类型字面量的字符串转换为 Int8 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Int8`](../parse/index.md) | 将 Int8 类型字面量的字符串转换为 Int8 值。 |
| [`static tryParse(data: String): Option<Int8>`](../tryparse/index.md) | 将 Int8 类型字面量的字符串转换为 Option<Int8> 值。 |

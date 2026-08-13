<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-float16-parsable-float16" parent="std.convert.interface.parsable" -->
# extend Float16 <: Parsable<Float16>

[← Parsable<T>](../index.md)

`extend Float16 <: Parsable<Float16>`

此扩展主要用于实现将 Float16 类型字面量的字符串转换为 Float16 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Float16`](../parse/index.md) | 将 Float16 类型字面量的字符串转换为 Float16 值。 |
| [`static tryParse(data: String): Option<Float16>`](../tryparse/index.md) | 将 Float16 类型字面量的字符串转换为 Option<Float16> 值。 |

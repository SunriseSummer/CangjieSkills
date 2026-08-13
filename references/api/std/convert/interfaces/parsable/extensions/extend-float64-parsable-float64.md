<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-float64-parsable-float64" parent="std.convert.interface.parsable" -->
# extend Float64 <: Parsable<Float64>

[← Parsable<T>](../index.md)

`extend Float64 <: Parsable<Float64>`

此扩展主要用于实现将 Float64 类型字面量的字符串转换为 Float64 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Float64`](../parse/index.md) | 将 Float64 类型字面量的字符串转换为 Float64 值。 |
| [`static tryParse(data: String): Option<Float64>`](../tryparse/index.md) | 将 Float64 类型字面量的字符串转换为 Option<Float64> 值。 |

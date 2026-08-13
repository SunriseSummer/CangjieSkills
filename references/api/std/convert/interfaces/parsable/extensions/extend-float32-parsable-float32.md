<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-float32-parsable-float32" parent="std.convert.interface.parsable" -->
# extend Float32 <: Parsable<Float32>

[← Parsable<T>](../index.md)

`extend Float32 <: Parsable<Float32>`

此扩展主要用于实现将 Float32 类型字面量的字符串转换为 Float32 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Float32`](../parse/index.md) | 将 Float32 类型字面量的字符串转换为 Float32 值。 |
| [`static tryParse(data: String): Option<Float32>`](../tryparse/index.md) | 将 Float32 类型字面量的字符串转换为 Option<Float32> 值。 |

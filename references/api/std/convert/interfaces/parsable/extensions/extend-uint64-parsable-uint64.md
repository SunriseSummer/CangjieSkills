<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-uint64-parsable-uint64" parent="std.convert.interface.parsable" -->
# extend UInt64 <: Parsable<UInt64>

[← Parsable<T>](../index.md)

`extend UInt64 <: Parsable<UInt64>`

此扩展主要用于实现将 UInt64 类型字面量的字符串转换为 UInt64 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): UInt64`](../parse/index.md) | 将 UInt64 类型字面量的字符串转换为 UInt64 值。 |
| [`static tryParse(data: String): Option<UInt64>`](../tryparse/index.md) | 将 UInt64 类型字面量的字符串转换为 Option<UInt64> 值。 |

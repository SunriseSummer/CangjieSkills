<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-uint32-parsable-uint32" parent="std.convert.interface.parsable" -->
# extend UInt32 <: Parsable<UInt32>

[← Parsable<T>](../index.md)

`extend UInt32 <: Parsable<UInt32>`

此扩展主要用于实现将 UInt32 类型字面量的字符串转换为 UInt32 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): UInt32`](../parse/index.md) | 将 UInt32 类型字面量的字符串转换为 UInt32 值。 |
| [`static tryParse(data: String): Option<UInt32>`](../tryparse/index.md) | 将 UInt32 类型字面量的字符串转换为 Option<UInt32> 值。 |

<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-uint8-parsable-uint8" parent="std.convert.interface.parsable" -->
# extend UInt8 <: Parsable<UInt8>

[← Parsable<T>](../index.md)

`extend UInt8 <: Parsable<UInt8>`

此扩展主要用于实现将 UInt8 类型字面量的字符串转换为 UInt8 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): UInt8`](../parse/index.md) | 将 UInt8 类型字面量的字符串转换为 UInt8 值。 |
| [`static tryParse(data: String): Option<UInt8>`](../tryparse/index.md) | 将 UInt8 类型字面量的字符串转换为 Option<UInt8> 值。 |

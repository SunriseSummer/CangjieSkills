<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-uint16-parsable-uint16" parent="std.convert.interface.parsable" -->
# extend UInt16 <: Parsable<UInt16>

[← Parsable<T>](../index.md)

`extend UInt16 <: Parsable<UInt16>`

此扩展主要用于实现将 UInt16 类型字面量的字符串转换为 UInt16 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): UInt16`](../parse/index.md) | 将 UInt16 类型字面量的字符串转换为 UInt16 值。 |
| [`static tryParse(data: String): Option<UInt16>`](../tryparse/index.md) | 将 UInt16 类型字面量的字符串转换为 Option<UInt16> 值。 |

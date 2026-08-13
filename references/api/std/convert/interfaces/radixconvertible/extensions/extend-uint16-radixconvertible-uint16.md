<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-uint16-radixconvertible-uint16" parent="std.convert.interface.radixconvertible" -->
# extend UInt16 <: RadixConvertible<UInt16>

[← RadixConvertible<T>](../index.md)

`extend UInt16 <: RadixConvertible<UInt16>`

此扩展主要用于实现将 UInt16 类型字面量的字符串转换为 UInt16 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): UInt16`](../parse.md) | 将 UInt16 类型字面量的字符串转换为 UInt16 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<UInt16>`](../tryparse.md) | 将 UInt16 类型字面量的字符串转换为 Option<UInt16> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

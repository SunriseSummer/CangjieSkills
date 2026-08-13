<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-uint8-radixconvertible-uint8" parent="std.convert.interface.radixconvertible" -->
# extend UInt8 <: RadixConvertible<UInt8>

[← RadixConvertible<T>](../index.md)

`extend UInt8 <: RadixConvertible<UInt8>`

此扩展主要用于实现将 UInt8 类型字面量的字符串转换为 UInt8 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): UInt8`](../parse.md) | 将 UInt8 类型字面量的字符串转换为 UInt8 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<UInt8>`](../tryparse.md) | 将 UInt8 类型字面量的字符串转换为 Option<UInt8> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

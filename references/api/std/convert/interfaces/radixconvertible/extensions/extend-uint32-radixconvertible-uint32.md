<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-uint32-radixconvertible-uint32" parent="std.convert.interface.radixconvertible" -->
# extend UInt32 <: RadixConvertible<UInt32>

[← RadixConvertible<T>](../index.md)

`extend UInt32 <: RadixConvertible<UInt32>`

此扩展主要用于实现将 UInt32 类型字面量的字符串转换为 UInt32 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): UInt32`](../parse.md) | 将 UInt32 类型字面量的字符串转换为 UInt32 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<UInt32>`](../tryparse.md) | 将 UInt32 类型字面量的字符串转换为 Option<UInt32> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

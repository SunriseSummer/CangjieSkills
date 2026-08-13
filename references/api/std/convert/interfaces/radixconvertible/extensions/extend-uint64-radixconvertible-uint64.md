<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-uint64-radixconvertible-uint64" parent="std.convert.interface.radixconvertible" -->
# extend UInt64 <: RadixConvertible<UInt64>

[← RadixConvertible<T>](../index.md)

`extend UInt64 <: RadixConvertible<UInt64>`

此扩展主要用于实现将 UInt64 类型字面量的字符串转换为 UInt64 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): UInt64`](../parse.md) | 将 UInt64 类型字面量的字符串转换为 UInt64 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<UInt64>`](../tryparse.md) | 将 UInt64 类型字面量的字符串转换为 Option<UInt64> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

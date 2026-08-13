<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-int16-radixconvertible-int16" parent="std.convert.interface.radixconvertible" -->
# extend Int16 <: RadixConvertible<Int16>

[← RadixConvertible<T>](../index.md)

`extend Int16 <: RadixConvertible<Int16>`

此扩展主要用于实现将 Int16 类型字面量的字符串转换为 Int16 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): Int16`](../parse.md) | 将 Int16 类型字面量的字符串转换为 Int16 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<Int16>`](../tryparse.md) | 将 Int16 类型字面量的字符串转换为 Option<Int16> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-int8-radixconvertible-int8" parent="std.convert.interface.radixconvertible" -->
# extend Int8 <: RadixConvertible<Int8>

[← RadixConvertible<T>](../index.md)

`extend Int8 <: RadixConvertible<Int8>`

此扩展主要用于实现将 Int8 类型字面量的字符串转换为 Int8 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): Int8`](../parse.md) | 将 Int8 类型字面量的字符串转换为 Int8 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<Int8>`](../tryparse.md) | 将 Int8 类型字面量的字符串转换为 Option<Int8> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

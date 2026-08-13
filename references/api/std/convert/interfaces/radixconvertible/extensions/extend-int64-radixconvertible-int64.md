<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-int64-radixconvertible-int64" parent="std.convert.interface.radixconvertible" -->
# extend Int64 <: RadixConvertible<Int64>

[← RadixConvertible<T>](../index.md)

`extend Int64 <: RadixConvertible<Int64>`

此扩展主要用于实现将 Int64 类型字面量的字符串转换为 Int64 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): Int64`](../parse.md) | 将 Int64 类型字面量的字符串转换为 Int64 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<Int64>`](../tryparse.md) | 将 Int64 类型字面量的字符串转换为 Option<Int64> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

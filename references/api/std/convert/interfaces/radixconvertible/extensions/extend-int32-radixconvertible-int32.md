<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.radixconvertible.extension.extend-int32-radixconvertible-int32" parent="std.convert.interface.radixconvertible" -->
# extend Int32 <: RadixConvertible<Int32>

[← RadixConvertible<T>](../index.md)

`extend Int32 <: RadixConvertible<Int32>`

此扩展主要用于实现将 Int32 类型字面量的字符串转换为 Int32 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): Int32`](../parse.md) | 将 Int32 类型字面量的字符串转换为 Int32 值。 |
| [`static tryParse(value: String, radix!: Int64): Option<Int32>`](../tryparse.md) | 将 Int32 类型字面量的字符串转换为 Option<Int32> 值。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 返回指定进制形式字符串。 |

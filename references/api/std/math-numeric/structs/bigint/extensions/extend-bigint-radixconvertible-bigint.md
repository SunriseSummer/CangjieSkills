<!-- cj-doc kind="api-extension" level="6" id="std.math.numeric.struct.bigint.extension.extend-bigint-radixconvertible-bigint" parent="std.math.numeric.struct.bigint" -->
# extend BigInt <: RadixConvertible<BigInt>

[← BigInt](../index.md)

`extend BigInt <: RadixConvertible<BigInt>`

此扩展主要用于实现将 BigInt 类型字面量的字符串转换为 BigInt 结构体的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): BigInt`](../parse.md) | 根据指定进制将字符串解析成一个 BigInt 结构体，支持 2 进制到 36 进制。 |
| [`static tryParse(value: String, radix!: Int64): ?BigInt`](../tryparse.md) | 尝试根据指定进制将字符串解析成一个 BigInt 结构体，支持 2 进制到 36 进制。 |
| [`toString(radix!: Int64): String`](../tostring.md) | 计算并返回此 BigInt 的任意进制字符串表示。 |

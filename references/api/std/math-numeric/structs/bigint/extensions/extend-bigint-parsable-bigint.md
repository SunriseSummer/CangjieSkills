<!-- cj-doc kind="api-extension" level="6" id="std.math.numeric.struct.bigint.extension.extend-bigint-parsable-bigint" parent="std.math.numeric.struct.bigint" -->
# extend BigInt <: Parsable<BigInt>

[← BigInt](../index.md)

`extend BigInt <: Parsable<BigInt>`

此扩展主要用于实现将 BigInt 类型字面量的字符串转换为 BigInt 结构体的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String): BigInt`](../parse.md) | 将字符串解析成一个 BigInt 结构体。 |
| [`static tryParse(value: String): ?BigInt`](../tryparse.md) | 尝试将字符串解析成一个 BigInt 结构体。 |

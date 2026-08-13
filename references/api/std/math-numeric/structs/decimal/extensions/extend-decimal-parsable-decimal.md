<!-- cj-doc kind="api-extension" level="6" id="std.math.numeric.struct.decimal.extension.extend-decimal-parsable-decimal" parent="std.math.numeric.struct.decimal" -->
# extend Decimal <: Parsable<Decimal>

[← Decimal](../index.md)

`extend Decimal <: Parsable<Decimal>`

此扩展主要用于实现将 Decimal 类型字面量的字符串转换为 Decimal 结构体的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String): Decimal`](../parse.md) | 通过规定格式字符串构建 Decimal 结构体。 |
| [`static tryParse(value: String): ?Decimal`](../tryparse.md) | 尝试通过规定格式字符串构建 Decimal 结构体。 |

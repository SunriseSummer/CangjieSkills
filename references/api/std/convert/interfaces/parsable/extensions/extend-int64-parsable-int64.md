<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-int64-parsable-int64" parent="std.convert.interface.parsable" -->
# extend Int64 <: Parsable<Int64>

[← Parsable<T>](../index.md)

`extend Int64 <: Parsable<Int64>`

此扩展主要用于实现将 Int64 类型字面量的字符串转换为 Int64 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Int64`](../parse/index.md) | 将 Int64 类型字面量的字符串转换为 Int64 值。 |
| [`static tryParse(data: String): Option<Int64>`](../tryparse/index.md) | 将 Int64 类型字面量的字符串转换为 Option<Int64> 值。 |

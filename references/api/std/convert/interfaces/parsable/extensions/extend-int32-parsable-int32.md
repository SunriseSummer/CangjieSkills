<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-int32-parsable-int32" parent="std.convert.interface.parsable" -->
# extend Int32 <: Parsable<Int32>

[← Parsable<T>](../index.md)

`extend Int32 <: Parsable<Int32>`

此扩展主要用于实现将 Int32 类型字面量的字符串转换为 Int32 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Int32`](../parse/index.md) | 将 Int32 类型字面量的字符串转换为 Int32 值。 |
| [`static tryParse(data: String): Option<Int32>`](../tryparse/index.md) | 将 Int32 类型字面量的字符串转换为 Option<Int32> 值。 |

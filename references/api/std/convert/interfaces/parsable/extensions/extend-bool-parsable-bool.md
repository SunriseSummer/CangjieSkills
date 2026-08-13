<!-- cj-doc kind="api-extension" level="6" id="std.convert.interface.parsable.extension.extend-bool-parsable-bool" parent="std.convert.interface.parsable" -->
# extend Bool <: Parsable<Bool>

[← Parsable<T>](../index.md)

`extend Bool <: Parsable<Bool>`

此扩展主要用于实现将 Bool 类型字面量的字符串转换为 Bool 值的相关操作函数。

## 成员

| 签名 | 功能 |
|---|---|
| [`static parse(data: String): Bool`](../parse/index.md) | 将 Bool 类型字面量的字符串转换为 Bool 值。 |
| [`static tryParse(data: String): Option<Bool>`](../tryparse/index.md) | 将 Bool 类型字面量的字符串转换为 Option<Bool> 值。 |

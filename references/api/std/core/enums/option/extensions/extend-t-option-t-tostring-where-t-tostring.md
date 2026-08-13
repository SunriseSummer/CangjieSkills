<!-- cj-doc kind="api-extension" level="6" id="std.core.enum.option.extension.extend-t-option-t-tostring-where-t-tostring" parent="std.core.enum.option" -->
# extend<T> Option<T> <: ToString where T <: ToString

[← Option<T>](../index.md)

`extend<T> Option<T> <: ToString where T <: ToString`

为 Option<T> 枚举实现 ToString 接口，支持转字符串操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`toString(): String`](../tostring.md) | 将 Option 转换为可输出的字符串，字符串内容为 "Some(${T.toString()})" 或 "None"。 |

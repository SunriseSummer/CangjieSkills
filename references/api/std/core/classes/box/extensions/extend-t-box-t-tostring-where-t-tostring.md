<!-- cj-doc kind="api-extension" level="6" id="std.core.class.box.extension.extend-t-box-t-tostring-where-t-tostring" parent="std.core.class.box" -->
# extend<T> Box<T> <: ToString where T <: ToString

[← Box<T>](../index.md)

`extend<T> Box<T> <: ToString where T <: ToString`

为 Box<T> 类型扩展 ToString 接口，支持转字符串操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`toString(): String`](../tostring.md) | 获取 Box 对象的字符串表示，字符串内容为当前实例封装的 `T` 类型实例的字符串表示。 |

<!-- cj-doc kind="api-extension" level="6" id="std.core.enum.option.extension.extend-t-option-option-t" parent="std.core.enum.option" -->
# extend<T> Option<Option<T>>

[← Option<T>](../index.md)

`extend<T> Option<Option<T>>`

为 Option<Option<T>> 类型扩展实现某些功能。

## 成员

| 签名 | 功能 |
|---|---|
| [`flatten(): Option<T>`](../flatten.md) | 将 Option<Option<T>> 类型展开，如果当前实例是 Some(Option<T>.Some(v)), 展开后的结果为 Some(v)。 |

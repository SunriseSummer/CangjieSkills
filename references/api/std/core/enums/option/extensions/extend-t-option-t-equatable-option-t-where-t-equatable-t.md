<!-- cj-doc kind="api-extension" level="6" id="std.core.enum.option.extension.extend-t-option-t-equatable-option-t-where-t-equatable-t" parent="std.core.enum.option" -->
# extend<T> Option<T> <: Equatable<Option<T>> where T <: Equatable<T>

[← Option<T>](../index.md)

`extend<T> Option<T> <: Equatable<Option<T>> where T <: Equatable<T>`

为 Option<T> 枚举扩展 Equatable<Option<T>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`operator !=(that: Option<T>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 Option<T> 实例是否不等。 |
| [`operator ==(that: Option<T>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 Option<T> 实例是否相等。 |

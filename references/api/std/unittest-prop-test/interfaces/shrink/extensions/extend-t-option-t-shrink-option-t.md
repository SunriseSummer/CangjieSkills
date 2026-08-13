<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.shrink.extension.extend-t-option-t-shrink-option-t" parent="std.unittest.prop_test.interface.shrink" -->
# extend<T> Option<T> <: Shrink<Option<T>>

[← Shrink<T>](../index.md)

`extend<T> Option<T> <: Shrink<Option<T>>`

为 Option<T> 实现了 Shrink<Option<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`shrink(): Iterable<Option<T>>`](../shrink/index.md) | 将该值缩小为一组可能的“较小”值。 |

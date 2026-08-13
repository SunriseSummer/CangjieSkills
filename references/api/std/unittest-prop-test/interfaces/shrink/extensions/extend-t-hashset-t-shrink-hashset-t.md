<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.shrink.extension.extend-t-hashset-t-shrink-hashset-t" parent="std.unittest.prop_test.interface.shrink" -->
# extend<T> HashSet<T> <: Shrink<HashSet<T>>

[← Shrink<T>](../index.md)

`extend<T> HashSet<T> <: Shrink<HashSet<T>>`

为 HashSet<T> 实现了 Shrink<HashSet<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`shrink(): Iterable<HashSet<T>>`](../shrink/index.md) | 将该值缩小为一组可能的“较小”值。 |

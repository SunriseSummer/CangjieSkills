<!-- cj-doc kind="api-extension" level="6" id="std.core.struct.range.extension.extend-t-range-t-hashable-where-t-hashable-countable-t-comparab-8f0ee3f5" parent="std.core.struct.range" -->
# extend<T> Range<T> <: Hashable where T <: Hashable & Countable<T> & Comparable<T> & Equatable<T>

[← Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>](../index.md)

`extend<T> Range<T> <: Hashable where T <: Hashable & Countable<T> & Comparable<T> & Equatable<T>`

为 Range 类型扩展 Hashable 接口，支持计算哈希值。

## 成员

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](../hashcode.md) | 获取哈希值，该值为 `start`、`end`、step、`isClosed` 的组合哈希运算结果。 |

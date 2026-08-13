<!-- cj-doc kind="api-member" level="7" id="std.core.struct.range.hashcode" parent="std.core.struct.range.extension.extend-t-range-t-hashable-where-t-hashable-countable-t-comparab-8f0ee3f5" -->
# Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>.hashCode

[← extend<T> Range<T> <: Hashable where T <: Hashable & Countable<T> & Comparable<T> & Equatable<T>](extensions/extend-t-range-t-hashable-where-t-hashable-countable-t-comparab-8f0ee3f5.md)

## 签名

```cangjie role=signature
public func hashCode(): Int64
```

获取哈希值，该值为 `start`、`end`、step、`isClosed` 的组合哈希运算结果。

## 契约

返回值：

- Int64 - 哈希值。

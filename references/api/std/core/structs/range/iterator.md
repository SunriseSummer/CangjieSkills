<!-- cj-doc kind="api-member" level="6" id="std.core.struct.range.iterator" parent="std.core.struct.range" -->
# Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>.iterator

[← Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>](index.md)

## 签名

```cangjie role=signature
public func iterator(): Iterator<T>
```

获取当前区间的迭代器。

## 契约

返回值：

- Iterator\<T> - 当前区间的迭代器。

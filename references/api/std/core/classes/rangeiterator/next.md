<!-- cj-doc kind="api-member" level="6" id="std.core.class.rangeiterator.next" parent="std.core.class.rangeiterator" -->
# RangeIterator<T> <: Iterator<T> where T <: Countable<T> & Comparable<T> & Equatable<T>.next

[← RangeIterator<T> <: Iterator<T> where T <: Countable<T> & Comparable<T> & Equatable<T>](index.md)

## 签名

```cangjie role=signature
public func next(): Option<T>
```

获取 Range 迭代器中的下一个值。

## 契约

返回值：

- Option\<T> - Range 迭代器中的下一个成员，用 Option 封装，迭代到末尾时返回 `None`。

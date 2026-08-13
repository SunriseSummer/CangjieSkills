<!-- cj-doc kind="guide-leaf" level="5" id="language.for.2-range-区间类型.2-4-range-类型签名" parent="language.for.2-range-区间类型" -->
# 2.4 Range 类型签名

[← 2. Range 区间类型](index.md)

```cangjie role=signature
public struct Range<T> <: Iterable<T> where T <: Countable<T> & Comparable<T> & Equatable<T>
```
- `start: T`、`end: T`、`step: Int64`
- `isEmpty()` 判断是否为空；`iterator()` 返回迭代器

---

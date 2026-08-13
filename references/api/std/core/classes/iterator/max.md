<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.max" parent="std.core.class.iterator.extension.extend-t-iterator-t-where-t-comparable-t" -->
# Iterator<T>.max

[← extend<T> Iterator<T> where T <: Comparable<T>](extensions/extend-t-iterator-t-where-t-comparable-t.md)

## 签名

```cangjie role=signature
public func max(): Option<T>
```

筛选最大的元素。

## 契约

功能：筛选最大的元素。此方法会消耗迭代器中的所有元素。

返回值：

- Option\<T> - 返回最大的元素，若为空则返回 None。

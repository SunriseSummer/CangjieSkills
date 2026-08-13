<!-- cj-doc kind="api-member" level="5" id="std.collection.func.min-t-iterable-t-where-t-comparable-t" parent="std.collection" -->
# min<T>(Iterable<T>) where T <: Comparable<T>

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func min<T>(it: Iterable<T>): Option<T> where T <: Comparable<T>
```

筛选最小的元素。

## 契约

参数：

- it: Iterable\<T> - 给定的迭代器。

返回值：

- Option\<T> - 返回最小的元素，若为空则返回 None。

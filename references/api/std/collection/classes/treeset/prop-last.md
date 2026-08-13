<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.prop-last" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.last

[← TreeSet<T> where T <: Comparable<T>](index.md)

## 签名

```cangjie role=signature
public prop last: ?T
```

获取 TreeSet 的最后一个元素。

## 契约

类型：?T - 如果存在最后一个元素，用 Option 封装该元素并返回；否则返回 Option\<T>.None。

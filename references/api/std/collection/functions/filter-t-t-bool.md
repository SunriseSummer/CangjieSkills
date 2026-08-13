<!-- cj-doc kind="api-member" level="5" id="std.collection.func.filter-t-t-bool" parent="std.collection" -->
# filter<T>((T) -> Bool)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func filter<T>(predicate: (T) -> Bool): (Iterable<T>) -> Iterator<T>
```

筛选出满足条件的元素。

## 契约

参数：

- predicate: (T) -> Bool - 给定的条件。

返回值：

- (Iterable\<T>) -> Iterator\<T> - 返回一个筛选函数。

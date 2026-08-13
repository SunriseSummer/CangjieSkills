<!-- cj-doc kind="api-member" level="5" id="std.collection.func.filtermap-t-r-t-r" parent="std.collection" -->
# filterMap<T, R>((T) -> ?R)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func filterMap<T, R>(transform: (T) -> ?R): (Iterable<T>) -> Iterator<R>
```

同时进行筛选操作和映射操作，返回一个新的迭代器。

## 契约

参数：

- transform: (T) -> ?R - 给定的映射函数。函数返回值为 Some 对应 filter 的 predicate 为 true，反之表示 false。

返回值：

- (Iterable\<T>) -> Iterator\<R> - 返回一个筛选和映射的函数。

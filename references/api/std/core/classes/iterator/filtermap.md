<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.filtermap" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.filterMap

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func filterMap<R>(transform: (T) -> Option<R>): Iterator<R>
```

同时进行筛选操作和映射操作，返回一个新的迭代器。

## 契约

参数：

- transform: (T) -> Option\<T> - 给定的映射函数。函数返回值为 Some 对应 filter 的 predicate 为 true，反之表示 false。

返回值：

- Iterator\<R> - 返回一个新迭代器。

<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.filtermap" parent="std.collection.class.treeset" -->
# TreeSet<T>.filterMap

[← TreeSet<T>](index.md)

## 签名

```cangjie role=signature
public func filterMap<R>(transform: (T) -> Option<R>): TreeSet<R> where R <: Comparable<R>
```

同时进行筛选操作和映射操作，返回一个新 TreeSet。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> Option<R> - 给定的映射函数。函数返回值为 Some 对应 filter 的 predicate 为 true，反之表示 false。

## 返回值

- TreeSet<R> - 返回一个筛选和映射后的新 TreeSet。


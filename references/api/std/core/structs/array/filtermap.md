<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.filtermap" parent="std.core.struct.array" -->
# Array<T>.filterMap

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func filterMap<R>(transform: (T) -> ?R): Array<R>
```

同时进行筛选操作和映射操作，返回一个新数组。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> ?R - 给定的映射函数。函数返回值为 Some 对应 filter 的 predicate 为 true，反之表示 false。

## 返回值

- Array<R> - 返回一个筛选和映射的新数组。


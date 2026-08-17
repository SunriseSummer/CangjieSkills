<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.filtermap" parent="std.collection.class.arraylist" -->
# ArrayList<T>.filterMap

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func filterMap<R>(transform: (T) -> ?R): ArrayList<R>
```

同时进行筛选操作和映射操作，返回一个新 ArrayList。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> ?R - 给定的映射函数。函数返回值为 Some 对应 filter 的 predicate 为 true，反之表示 false。

## 返回值

- ArrayList<R> - 返回一个筛选和映射后的新ArrayList。


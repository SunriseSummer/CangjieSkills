<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.filtermap" parent="std.collection.class.hashset" -->
# HashSet<T>.filterMap

[← HashSet<T>](index.md)

## 签名

```cangjie role=signature
public func filterMap<R>(transform: (T) -> Option<R>): HashSet<R> where R <: Hashable & Equatable<R>
```

同时进行筛选操作和映射操作，返回一个新 HashSet。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> Option<R> -  兼具筛选判断和映射转换的闭包函数，入参为集合中的单个元素；若元素符合筛选条件，完成映射转换并返回 Some(R)（R 为转换后的值，会加入结果集）；若元素不符合筛选条件，直接返回 None（元素会被过滤，不加入结果集）。

## 返回值

- HashSet<R> - 返回一个筛选和映射后的新 HashSet。


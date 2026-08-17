<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.map" parent="std.collection.class.hashset" -->
# HashSet<T>.map

[← HashSet<T>](index.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T) -> R): HashSet<R> where R <: Hashable & Equatable<R>
```

将当前 HashSet 内所有 T 类型元素根据 transform 映射为 R 类型的元素，组成新的 HashSet。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> R - 映射函数。

## 返回值

- HashSet<R> - 原 HashSet 中所有元素映射后得到的元素组成的新 HashSet。


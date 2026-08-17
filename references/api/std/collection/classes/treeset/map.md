<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.map" parent="std.collection.class.treeset" -->
# TreeSet<T>.map

[← TreeSet<T>](index.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T) -> R): TreeSet<R> where R <: Comparable<R>
```

将当前 TreeSet 内所有 T 类型元素根据 transform 映射为 R 类型的元素，组成新的 TreeSet。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T)->R - 映射函数。

## 返回值

- TreeSet<R> - 原 TreeSet 中所有元素映射后得到的元素组成的新 TreeSet。


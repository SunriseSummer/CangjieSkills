<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.any" parent="std.collection.class.hashset" -->
# HashSet<T>.any

[← HashSet<T>](index.md)

## 签名

```cangjie role=signature
public func any(predicate: (T) -> Bool): Bool
```

判断 HashSet 是否存在任意一个满足条件的元素。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (T) -> Bool - 给定的条件。

## 返回值

- Bool - 是否存在任意满足条件的元素。


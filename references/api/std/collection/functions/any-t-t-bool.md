<!-- cj-doc kind="api-member" level="5" id="std.collection.func.any-t-t-bool" parent="std.collection" -->
# any<T>((T) -> Bool)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func any<T>(predicate: (T) -> Bool): (Iterable<T>) -> Bool
```

判断迭代器是否存在任意一个满足条件的元素。

## 契约

参数：

- predicate: (T) -> Bool - 给定的条件。

返回值：

- (Iterable\<T>) -> Bool - 返回一个判断存在任意一个满足条件的函数。

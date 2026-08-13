<!-- cj-doc kind="api-member" level="5" id="std.collection.func.all-t-t-bool" parent="std.collection" -->
# all<T>((T) -> Bool)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func all<T>(predicate: (T) -> Bool): (Iterable<T>) -> Bool
```

判断迭代器所有元素是否都满足条件。

## 契约

参数：

- predicate: (T) -> Bool - 给定的条件。

返回值：

- (Iterable\<T>) -> Bool - 返回一个判断全部满足条件的函数。

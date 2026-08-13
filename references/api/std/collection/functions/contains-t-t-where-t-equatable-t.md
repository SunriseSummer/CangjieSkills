<!-- cj-doc kind="api-member" level="5" id="std.collection.func.contains-t-t-where-t-equatable-t" parent="std.collection" -->
# contains<T>(T) where T <: Equatable<T>

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func contains<T>(element: T): (Iterable<T>) -> Bool where T <: Equatable<T>
```

获得一个针对特定元素的查找函数。

## 契约

参数：

- element: T - 要查找的元素。

返回值：

- (Iterable\<T>) -> Bool - 返回一个查找函数。

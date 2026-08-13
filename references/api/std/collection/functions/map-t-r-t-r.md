<!-- cj-doc kind="api-member" level="5" id="std.collection.func.map-t-r-t-r" parent="std.collection" -->
# map<T, R>((T) -> R)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func map<T, R>(transform: (T) -> R): (Iterable<T>) -> Iterator<R>
```

创建一个映射。

## 契约

参数：

- transform: (T) ->R - 给定的映射函数。

返回值：

- (Iterable\<T>) -> Iterator\<R> - 返回一个映射函数。

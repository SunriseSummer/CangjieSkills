<!-- cj-doc kind="api-member" level="5" id="std.collection.func.flatmap-t-r-t-iterable-r" parent="std.collection" -->
# flatMap<T, R>((T) -> Iterable<R>)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func flatMap<T, R>(transform: (T) -> Iterable<R>): (Iterable<T>) -> Iterator<R>
```

创建一个带 flatten 功能的映射。

## 契约

参数：

- transform: (T) -> Iterable\<R> - 给定的映射函数。

返回值：

- (Iterable\<T>) -> Iterator\<R> - 返回一个带 flatten 功能的映射函数。

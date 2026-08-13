<!-- cj-doc kind="api-member" level="5" id="std.collection.func.reduce-t-t-t-t" parent="std.collection" -->
# reduce<T>((T, T) -> T)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func reduce<T>(operation: (T, T) -> T): (Iterable<T>) -> Option<T>
```

使用第一个元素作为初始值，从左向右计算。

## 契约

参数：

- operation: (T, T) -> T - 给定的操作函数。

返回值：

- (Iterable\<T>) -> Option\<T> - 返回一个归并函数。

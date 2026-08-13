<!-- cj-doc kind="api-member" level="5" id="std.collection.func.fold-t-r-r-r-t-r" parent="std.collection" -->
# fold<T, R>(R, (R, T) -> R)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R
```

使用指定初始值，从左向右计算。

## 契约

参数：

- initial: R - 给定的 R 类型的初始值。
- operation: (R, T) -> R - 给定的计算函数。

返回值：

- (Iterable\<T>) -> R - 返回一个折叠函数。

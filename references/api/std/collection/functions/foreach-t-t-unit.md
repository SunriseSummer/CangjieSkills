<!-- cj-doc kind="api-member" level="5" id="std.collection.func.foreach-t-t-unit" parent="std.collection" -->
# forEach<T>((T) -> Unit)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func forEach<T>(action: (T) -> Unit): (Iterable<T>) -> Unit
```

遍历所有元素，指定给定的操作。

## 契约

参数：

- action: (T) -> Unit - 给定的操作函数。

返回值：

- (Iterable\<T>) -> Unit - 返回一个执行遍历操作的函数。

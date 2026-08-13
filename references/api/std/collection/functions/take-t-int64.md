<!-- cj-doc kind="api-member" level="5" id="std.collection.func.take-t-int64" parent="std.collection" -->
# take<T>(Int64)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func take<T>(count: Int64): (Iterable<T>) -> Iterator<T>
```

从迭代器取出特定个数。

## 契约

当 count 小于 0 时，抛出异常。当 count 等于 0 时，不取元素，返回空迭代器。当 count 大于 0 小于迭代器的大小时，取前 count 个元素，返回新迭代器。当 count 大于等于迭代器的大小时，取所有元素，返回原迭代器。

参数：

- count: Int64 - 要取出的个数。

返回值：

- (Iterable\<T>) -> Iterator\<T> - 返回一个取出指定数量元素的函数。

异常：

- IllegalArgumentException - 当 count < 0 时，抛出异常。

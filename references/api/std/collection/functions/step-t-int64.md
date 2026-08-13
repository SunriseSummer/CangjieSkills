<!-- cj-doc kind="api-member" level="5" id="std.collection.func.step-t-int64" parent="std.collection" -->
# step<T>(Int64)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func step<T>(count: Int64): (Iterable<T>) -> Iterator<T>
```

迭代器每次调用 next() 跳过特定个数。

## 契约

当 count 小于等于 0 时，抛出异常。当 count 大于 0 时，每次调用 next() 跳过 count 次，直到迭代器为空。

参数：

- count: Int64 - 每次调用 next() 要跳过的个数。

返回值：

- (Iterable\<T>) -> Iterator\<T> - 返回改变迭代器每次调用 next() 跳过特定个数的函数。

异常：

- IllegalArgumentException - 当 count <= 0 时，抛出异常。

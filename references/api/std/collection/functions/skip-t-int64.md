<!-- cj-doc kind="api-member" level="5" id="std.collection.func.skip-t-int64" parent="std.collection" -->
# skip<T>(Int64)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func skip<T>(count: Int64): (Iterable<T>) -> Iterator<T>
```

从迭代器跳过特定个数。

## 契约

当 count 小于 0 时，抛出异常。当 count 等于 0 时，相当没有跳过任何元素，返回原迭代器。当 count 大于 0 并且 count 小于迭代器的大小时，跳过 count 个元素后，返回含有剩下的元素的新迭代器。当 count 大于等于迭代器的大小时，跳过所有元素，返回空迭代器。

参数：

- count: Int64 - 要跳过的个数。

返回值：

- (Iterable\<T>) -> Iterator\<T> - 返回一个跳过指定数量元素的函数。

异常：

- IllegalArgumentException - 当 count < 0 时，抛出异常。

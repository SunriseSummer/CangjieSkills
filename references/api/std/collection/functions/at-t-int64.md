<!-- cj-doc kind="api-member" level="5" id="std.collection.func.at-t-int64" parent="std.collection" -->
# at<T>(Int64)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func at<T>(n: Int64): (Iterable<T>) -> Option<T>
```

获取迭代器指定位置的元素。

## 契约

参数：

- n: Int64 - 给定的个数。

返回值：

- (Iterable\<T>) -> Option\<T> - 返回获取对应位置元素的函数，若迭代器为空则该函数返回 None。

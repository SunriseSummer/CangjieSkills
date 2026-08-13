<!-- cj-doc kind="api-member" level="5" id="std.collection.func.enumerate-t-iterable-t" parent="std.collection" -->
# enumerate<T>(Iterable<T>)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func enumerate<T>(it: Iterable<T>): Iterator<(Int64, T)>
```

用于获取带索引的迭代器。

## 契约

参数：

- it: Iterable\<T> - 给定的迭代器。

返回值：

- Iterator\<(Int64, T)> - 返回一个带索引的迭代器。

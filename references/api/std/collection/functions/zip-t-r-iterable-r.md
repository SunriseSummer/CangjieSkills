<!-- cj-doc kind="api-member" level="5" id="std.collection.func.zip-t-r-iterable-r" parent="std.collection" -->
# zip<T, R>(Iterable<R>)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func zip<T, R>(other: Iterable<R>): (Iterable<T>) -> Iterator<(T, R)>
```

将两个迭代器合并成一个（长度取决于短的那个迭代器）。

## 契约

参数：

- other: Iterable\<R> - 要合并的其中一个迭代器。

返回值：

- (Iterable\<T>) -> Iterator\<(T, R)> - 返回一个合并函数。

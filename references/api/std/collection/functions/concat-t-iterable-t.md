<!-- cj-doc kind="api-member" level="5" id="std.collection.func.concat-t-iterable-t" parent="std.collection" -->
# concat<T>(Iterable<T>)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func concat<T>(other: Iterable<T>): (Iterable<T>) -> Iterator<T>
```

串联两个迭代器。

## 契约

参数：

- other: Iterable\<T> - 要串联在后面的迭代器。

返回值：

- (Iterable\<T>) -> Iterator\<T> - 返回一个串联函数。

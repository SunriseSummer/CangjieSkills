<!-- cj-doc kind="api-member" level="5" id="std.collection.func.inspect-t-t-unit" parent="std.collection" -->
# inspect<T>((T) -> Unit)

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func inspect<T>(action: (T)->Unit): (Iterable<T>) ->Iterator<T>
```

迭代器每次调用 next() 对当前元素执行额外操作（不会消耗迭代器中元素）。

## 契约

参数：

- action: (T) -> Unit - 给定的操作函数。

返回值：

- (Iterable\<T>) -> Iterator\<T> - 返回一个能对迭代器每个元素执行额外操作的函数。

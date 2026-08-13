<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.step" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.step

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func step(count: Int64): Iterator<T>
```

迭代器每次调用 next() 跳过特定个数。

## 契约

当 count 小于等于 0 时，抛出异常。当 count 大于 0 时，每次调用 next() 跳过 count 次，直到迭代器为空。

参数：

- count: Int64 - 每次调用 next() 要跳过的个数。

返回值：

- Iterator\<T> - 返回一个新迭代器，这个迭代器每次调用 next() 会跳过特定个数。

异常：

- IllegalArgumentException - 当 count <= 0 时，抛出异常。

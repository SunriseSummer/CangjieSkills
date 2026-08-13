<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.take" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.take

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func take(count: Int64): Iterator<T>
```

从当前迭代器取出特定个数。

## 契约

从前往后取出当前迭代器特定个数的元素。当 count 小于 0 时，抛出异常。当 count 等于 0 时，不取元素，返回空迭代器。当 count 大于 0 小于迭代器的大小时，取前 count 个元素，返回新迭代器。当 count 大于等于迭代器的大小时，取所有元素，返回原迭代器。

参数：

- count: Int64 - 要取出的个数。

返回值：

- Iterator\<T> - 返回一个取出指定数量元素的迭代器。

异常：

- IllegalArgumentException - 当 count < 0 时，抛出异常。

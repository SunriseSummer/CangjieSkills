<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.skip" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.skip

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func skip(count: Int64): Iterator<T>
```

从前往后从当前迭代器跳过特定个数。

## 契约

当 count 小于 0 时，抛出异常。当 count 等于 0 时，相当没有跳过任何元素，返回原迭代器。当 count 大于 0 并且 count 小于迭代器的大小时，跳过 count 个元素后，返回含有剩下的元素的新迭代器。当 count 大于等于迭代器的大小时，跳过所有元素，返回空迭代器。

参数：

- count: Int64 - 要跳过的个数。

返回值：

- Iterator\<T> - 返回一个跳过指定数量元素的迭代器。

异常：

- IllegalArgumentException - 当 count < 0 时，抛出异常。

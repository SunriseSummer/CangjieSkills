<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.count" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.count

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func count(): Int64
```

统计当前迭代器包含元素数量。

## 契约

功能：统计当前迭代器包含元素数量。此方法会消耗迭代器中所有元素来计算迭代器中的元素数量。

> **注意：**
>
> 该方法会消耗迭代器，即使用该方法后迭代器内不再包含任何元素。

返回值：

- Int64 - 返回迭代器包含元素数量。

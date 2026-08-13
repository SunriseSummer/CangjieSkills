<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.reserve" parent="std.collection.class.arraylist" -->
# ArrayList<T>.reserve

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func reserve(additional: Int64): Unit
```

增加此 ArrayList 实例的容量。

## 契约

将 ArrayList 扩容 additional 大小，当 additional 小于等于零时，不发生扩容；当 ArrayList 剩余容量大于等于 additional 时，不发生扩容；当 ArrayList 剩余容量小于 additional 时，取（原始容量的 1.5 倍向下取整）与（additional + 已使用容量）两个值中的最大值进行扩容。

参数：

- additional: Int64 - 将要扩容的大小。

异常：

- OverflowException - 当 additional + 已使用容量超过 Int64.Max 时，抛出异常。

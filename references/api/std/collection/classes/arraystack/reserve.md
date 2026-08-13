<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraystack.reserve" parent="std.collection.class.arraystack" -->
# ArrayStack<T>.reserve

[← ArrayStack<T>](index.md)

## 签名

```cangjie role=signature
public func reserve(additional: Int64): Unit
```

为当前 ArrayStack 扩容相应的空间。

## 契约

功能：为当前 ArrayStack 扩容相应的空间。当 additional 小于等于零时，不发生扩容；如果当前剩余空间大小大于等于 additional，不进行扩容操作，否则当前 ArrayStack 会扩容至 size + additional 大小。

参数：

- additional: Int64 - 将要扩容的大小。

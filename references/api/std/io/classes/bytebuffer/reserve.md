<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.reserve" parent="std.io.class.bytebuffer" -->
# ByteBuffer.reserve

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func reserve(additional: Int64): Unit
```

将缓冲区扩容指定大小。

## 契约

> **说明：**
>
> - 当缓冲区剩余字节数大于等于 `additional` 时不发生扩容。
> - 当缓冲区剩余字节数量小于 `additional` 时，取（`additional` + `capacity`）与（`capacity`的 1.5 倍向下取整）两个值中的最大值进行扩容。

参数：

- additional: Int64 - 将要扩容的大小。

异常：

- IllegalArgumentException - 当 additional 小于 0 时，抛出异常。
- OverflowException - 当扩容后的缓冲区大小超过 Int64 的最大值时，抛出异常。

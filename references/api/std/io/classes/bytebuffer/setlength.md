<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.setlength" parent="std.io.class.bytebuffer" -->
# ByteBuffer.setLength

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func setLength(length: Int64): Unit
```

将当前数据修改为指定长度。

## 契约

功能：将当前数据修改为指定长度。该操作不会改变 seek 的偏移。

参数：

- length: Int64 - 要修改的长度。

异常：

- IllegalArgumentException - 当 `length` 小于 0 时，抛此异常。
- OverflowException - 当 length 过大导致扩容后的缓冲区大小超过 Int64 的最大值时，抛出异常。

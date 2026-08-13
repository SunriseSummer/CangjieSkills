<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.readbyte" parent="std.io.class.bytebuffer" -->
# ByteBuffer.readByte

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func readByte(): ?Byte
```

从输入流中读取一个字节。

## 契约

返回值：

- ?Byte - 读取到的数据。读取失败时会返回 `None`。

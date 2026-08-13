<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedinputstream.readbyte" parent="std.io.class.bufferedinputstream" -->
# BufferedInputStream<T> where T <: InputStream.readByte

[← BufferedInputStream<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func readByte(): ?Byte
```

从输入流中读取一个字节。

## 契约

返回值：

- ?Byte - 读取到的数据。读取失败时会返回 `None`。

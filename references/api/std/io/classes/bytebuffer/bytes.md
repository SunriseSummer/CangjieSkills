<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.bytes" parent="std.io.class.bytebuffer" -->
# ByteBuffer.bytes

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func bytes(): Array<Byte>
```

获取当前 ByteBuffer 中未被读取的数据的切片。

## 契约

> **注意：**
>
> - 缓冲区进行读取，写入或重置等修改操作会导致这个切片失效。
> - 对切片的修改会影响缓冲区的内容。

返回值：

- Array\<Byte> - 当前流中未被读取的数据的切片。

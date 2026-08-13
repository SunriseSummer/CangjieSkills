<!-- cj-doc kind="api-member" level="6" id="std.io.class.bytebuffer.read" parent="std.io.class.bytebuffer" -->
# ByteBuffer.read

[← ByteBuffer](index.md)

## 签名

```cangjie role=signature
public func read(buffer: Array<Byte>): Int64
```

`read(buffer)` 从当前位置读入非空目标数组并返回字节数；空数组会抛 `IllegalArgumentException`。

## 契约

参数：

- buffer: Array\<Byte> - 存放读取的数据的缓冲区。

返回值：

- Int64 - 读取数据的字节数。

异常：

- IllegalArgumentException - 当 buffer 为空时，抛出异常。

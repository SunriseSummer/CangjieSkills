<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedoutputstream.write" parent="std.io.class.bufferedoutputstream" -->
# BufferedOutputStream<T> where T <: OutputStream.write

[← BufferedOutputStream<T> where T <: OutputStream](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

将 `buffer` 中的数据写入到绑定的输出流中。

## 契约

参数：

- buffer: Array\<Byte> - 待写入数据的缓冲区。

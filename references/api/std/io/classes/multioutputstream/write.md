<!-- cj-doc kind="api-member" level="6" id="std.io.class.multioutputstream.write" parent="std.io.class.multioutputstream" -->
# MultiOutputStream<T> where T <: OutputStream.write

[← MultiOutputStream<T> where T <: OutputStream](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

将 buffer 同时写入到绑定的 OutputStream 数组里的每个输出流中。

## 契约

参数：

- buffer: Array\<Byte> - 存储待写入数据的缓冲区。

<!-- cj-doc kind="api-member" level="6" id="std.io.interface.outputstream.write" parent="std.io.interface.outputstream" -->
# OutputStream.write

[← OutputStream](index.md)

## 签名

```cangjie role=signature
func write(buffer: Array<Byte>): Unit
```

将 `buffer` 中的数据写入到输出流中。

## 契约

参数：

- buffer: Array\<Byte> - 缓冲区，用于存放待写入输出流的数据。

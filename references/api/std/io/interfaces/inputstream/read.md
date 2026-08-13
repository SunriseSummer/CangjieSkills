<!-- cj-doc kind="api-member" level="6" id="std.io.interface.inputstream.read" parent="std.io.interface.inputstream" -->
# InputStream.read

[← InputStream](index.md)

## 签名

```cangjie role=signature
func read(buffer: Array<Byte>): Int64
```

从输入流中读取数据放到 `buffer` 中。

## 契约

参数：

- buffer: Array\<Byte> - 缓冲区，用于存放从输入流中读取的数据。

返回值：

- Int64 - 读取的数据的字节数。

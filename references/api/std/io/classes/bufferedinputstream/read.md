<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedinputstream.read" parent="std.io.class.bufferedinputstream" -->
# BufferedInputStream<T> where T <: InputStream.read

[← BufferedInputStream<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func read(buffer: Array<Byte>): Int64
```

从绑定的输入流读出数据到 `buffer` 中。

## 契约

参数：

- buffer: Array\<Byte> - 存放读取的数据的缓冲区。

返回值：

- Int64 - 读取数据的字节数。

异常：

- IllegalArgumentException - 当 buffer 为空时，抛出异常。

<!-- cj-doc kind="api-member" level="6" id="std.io.class.chainedinputstream.read" parent="std.io.class.chainedinputstream" -->
# ChainedInputStream<T> where T <: InputStream.read

[← ChainedInputStream<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func read(buffer: Array<Byte>): Int64
```

依次从绑定 InputStream 数组中读出数据到 buffer 中。

## 契约

参数：

- buffer: Array\<Byte> - 存储读出数据的缓冲区。

返回值：

- Int64 - 读取字节数。

异常：

- IllegalArgumentException - 当 buffer 为空时，抛出异常。

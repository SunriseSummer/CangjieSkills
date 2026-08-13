<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.read" parent="std.fs.class.file" -->
# File.read

[← File](index.md)

## 签名

```cangjie role=signature
public func read(buffer: Array<Byte>): Int64
```

从文件中读出数据到 buffer 中。

## 契约

参数：

- buffer: Array\<Byte> - 读取数据存放的缓冲区。

返回值：

- Int64 - 读取成功，返回读取字节数，如果文件被读完，返回 0。

异常：

- IllegalArgumentException - 如果 buffer 为空，则抛出异常。
- FSException - 读取失败、文件已关闭或文件不可读，则抛出异常。

<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.write" parent="std.fs.class.file" -->
# File.write

[← File](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

将 buffer 中的数据写入到文件中。

## 契约

参数：

- buffer: Array\<Byte> - 待写入数据的缓冲区，若 buffer 为空则直接返回。

异常：

- FSException - 如果写入失败、只写入了部分数据、文件已关闭或文件不可写则抛出异常。

<!-- cj-doc kind="api-member" level="6" id="std.fs.enum.openmode.value-readwrite" parent="std.fs.enum.openmode" -->
# OpenMode.ReadWrite

[← OpenMode](index.md)

## 签名

```cangjie role=signature
ReadWrite
```

构造一个 OpenMode 实例，指定以可读可写的方式打开文件。

## 契约

功能：构造一个 OpenMode 实例，指定以可读可写的方式打开文件。如果文件不存在，则将创建文件。

> **注意：**
>
> ReadWrite 模式不会使文件被截断为零字节大小。

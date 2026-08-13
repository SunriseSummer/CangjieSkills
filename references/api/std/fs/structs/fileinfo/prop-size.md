<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.prop-size" parent="std.fs.struct.fileinfo" -->
# FileInfo.size

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public prop size: Int64
```

返回当前文件大小。

## 契约

- 当前是文件时，表示单个文件占用磁盘空间的大小。
- 当前是目录时，表示当前目录的所有文件占用磁盘空间的大小。

类型：Int64

异常：

- FSException - 如果判断过程中底层接口发生错误，则抛出异常。

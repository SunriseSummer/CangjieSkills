<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.prop-parentdirectory" parent="std.fs.struct.fileinfo" -->
# FileInfo.parentDirectory

[← FileInfo](index.md)

## 签名

```cangjie role=signature
public prop parentDirectory: Option<FileInfo>
```

获得父级目录元数据，以 Option<FileInfo> 形式返回，有父级返回 Option<FileInfo>.Some(v)；否则返回 Option<FileInfo>.None。

## 契约

类型：Option\<FileInfo>

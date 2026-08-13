<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.prop-filename" parent="std.fs.struct.path" -->
# Path.fileName

[← Path](index.md)

## 签名

```cangjie role=signature
public prop fileName: String
```

获得 Path 的文件名（含扩展名）部分。

## 契约

整个路径字符串被划分为 parent 和 fileName 两部分，详见 parent。无文件名时返回空字符串。

以下示例适用于所有系统：

- 对于路径 "./NewFile.txt"，此属性返回 "NewFile.txt"；
- 对于路径 "./.gitignore"，此属性返回 ".gitignore"；
- 对于路径 "./noextension"，此属性返回 "noextension"；
- 对于路径 "./a.b.c"，此属性返回 "a.b.c"；
- 对于路径 "./NewDir/"，此属性返回 "NewDir"；

特别地，在 Windows 文件系统中，fileName 不包括卷名部分。

以下示例仅适用于 Windows 系统：

- 对于路径 "c:\\a.txt"，此属性返回 "a.txt"；
- 对于路径 "c:"，此属性返回 ""；
- 对于路径 "\\\\Server\\Share\\a.txt"，此属性返回 "a.txt"；
- 对于路径 "\\\\Server\\Share\\"，此属性返回 ""；
- 对于路径 "\\\\?\\C:a\\b.txt"，此属性返回 "b.txt"；
- 对于路径 "\\\\?\\C:"，此属性返回 ""。

类型：String

异常：

- IllegalArgumentException - 当路径为空或包含字符串结束符则抛出异常。

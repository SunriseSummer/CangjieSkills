<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.prop-parent" parent="std.fs.struct.path" -->
# Path.parent

[← Path](index.md)

## 签名

```cangjie role=signature
public prop parent: Path
```

获得该 Path 实例的父路径。

## 契约

整个路径字符串被划分为 parent 和 fileName，以最后一个有效文件分隔符（末尾的分隔符会被忽略）作为分界。如果 parent 不存在，就返回空字符串构造的 Path 实例。parent 和 fileName 部分都不包含末尾分隔符，parent 保留表示根目录的分隔符。无父目录时返回空的 Path 实例。

该属性不会访问文件系统，也不会消除特殊名称。如果有需要可以跟规范化搭配使用。

该属性在不同操作系统行为有差异，在 Windows 系统中，文件分隔符为 "\\" 或 "/"（规范化时会统一转换为 "\\"），在 Linux、macOS 系统中，文件分隔符为 "/"。

以下示例适用于所有系统：

- 对于路径 "/a/b/c"，此属性返回 Path("/a/b")；
- 对于路径 "/a/b/"，此属性返回 Path("/a")；
- 对于路径 "/a"，此属性返回 Path("/")；
- 对于路径 "/"，此属性返回 Path("/")；
- 对于路径 "./a/b"，此属性返回 Path("./a")；
- 对于路径 "./"，此属性返回 Path("")；
- 对于路径 ".gitignore"，此属性返回 Path("")；
- 对于路径 "/a/./../b"，此属性返回 Path("/a/./..")。

此外，在 Windows 系统中，path 被分为卷名、目录名和文件名，详情请参见微软官方文档。属性 parent 包含卷名和目录名。

以下示例仅适用于 Windows 系统：

- 对于路径 "C:"，此属性返回 Path("C:")；
- 对于路径 "C:\\a\\b"，此属性返回 Path("C:\\a")；
- 对于路径 "\\\\Server\\Share\\xx\\yy"，此属性返回 Path("\\\\Server\\Share\\xx")；
- 对于路径 "\\\\?\\UNC\\Server\\Share\\xx\\yy"，此属性返回 Path("\\\\?\\UNC\\Server\\Share\\xx")；
- 对于路径 "\\\\?\\c:\\xx\\yy"，此属性返回 Path("\\\\?\\c:\\xx")。

类型：Path

异常：

- IllegalArgumentException - 当路径为空或包含字符串结束符则抛出异常。

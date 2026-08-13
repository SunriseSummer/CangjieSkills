<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.init" parent="std.fs.class.file" -->
# File.init

[← File](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Path, OpenMode)

### 签名

```cangjie role=signature
public init(path: Path, mode: OpenMode)
```

创建一个 File 对象。

### 契约

需指定文件路径和文件打开方式（读写权限），路径支持相对路径和绝对路径。

参数：

- path: Path - 文件路径。
- mode: OpenMode - 文件打开模式。

异常：

- FSException - 如果以只读方式打开文件但文件不存在、文件的父目录不存在或其他原因导致无法打开文件，则抛出异常。
- IllegalArgumentException - 如果 path 为空路径或者 path 路径中包含空字符，则抛出异常。

## init(String, OpenMode)

### 签名

```cangjie role=signature
public init(path: String, mode: OpenMode)
```

创建 File 对象。

### 契约

需指定文件路径和文件打开方式（读写权限），路径支持相对路径和绝对路径。

参数：

- path: String - 文件路径字符串。
- mode: OpenMode - 文件打开模式。

异常：

- FSException - 如果以只读方式打开文件但文件不存在、文件的父目录不存在或其他原因导致无法打开文件，则抛出异常。
- IllegalArgumentException - 如果 path 是空字符串或者 path 包含空字符，则抛出异常。

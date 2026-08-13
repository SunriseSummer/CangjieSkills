<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.create" parent="std.fs.class.file" -->
# File.create

[← File](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func create(Path)

### 签名

```cangjie role=signature
public static func create(path: Path): File
```

创建指定路径的文件并返回只写模式的 File 实例。

### 契约

参数：

- path: Path - 文件路径。

返回值：

- File - File 实例。

异常：

- FSException - 如果路径指向的文件的上级目录不存在或文件已存在，则抛出异常。
- IllegalArgumentException - 如果文件路径为空或包含空字符，则抛出异常。

## static func create(String)

### 签名

```cangjie role=signature
public static func create(path: String): File
```

创建指定路径的文件并返回只写模式的 File 实例。

### 契约

参数：

- path: String - 文件路径字符串。

返回值：

- File - File 实例。

异常：

- FSException - 如果路径指向的文件的上级目录不存在或文件已存在，则抛出异常。
- IllegalArgumentException - 如果文件路径为空字符串或包含空字符，则抛出异常。

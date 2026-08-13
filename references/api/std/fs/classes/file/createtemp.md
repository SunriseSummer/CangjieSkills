<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.createtemp" parent="std.fs.class.file" -->
# File.createTemp

[← File](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func createTemp(Path)

### 签名

```cangjie role=signature
public static func createTemp(directoryPath: Path): File
```

在指定目录下创建临时文件。

### 契约

创建的文件名称是 tmpFileXXXXXX 形式，不使用的临时文件应手动删除。

参数：

- directoryPath: Path - 目录路径。

返回值：

- File - 临时文件 File 实例。

异常：

- FSException - 创建文件失败或路径不存在则抛出异常。
- IllegalArgumentException - 如果文件路径为空或包含空字符，则抛出异常。

## static func createTemp(String)

### 签名

```cangjie role=signature
public static func createTemp(directoryPath: String): File
```

在指定目录下创建临时文件。

### 契约

创建的文件名称是 tmpFileXXXXXX 形式，不使用的临时文件应手动删除。

参数：

- directoryPath: String - 目录路径字符串。

返回值：

- File - 临时文件 File 实例。

异常：

- FSException - 创建文件失败或路径不存在则抛出异常。
- IllegalArgumentException - 如果文件路径为空字符串或包含空字符，则抛出异常。

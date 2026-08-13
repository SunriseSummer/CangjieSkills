<!-- cj-doc kind="api-member" level="6" id="std.fs.class.directory.createtemp" parent="std.fs.class.directory" -->
# Directory.createTemp

[← Directory](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func createTemp(Path)

### 签名

```cangjie role=signature
public static func createTemp(directoryPath: Path): Path
```

在指定目录下创建临时目录。

### 契约

参数：

- directoryPath: Path - Path 形式的目录路径。

返回值：

- Path - 临时目录对应的路径。

异常：

- FSException - 目录不存在或其他原因导致创建失败时抛出异常。
- IllegalArgumentException - 目录为空或包含空字符时抛出异常。

## static func createTemp(String)

### 签名

```cangjie role=signature
public static func createTemp(directoryPath: String): Path
```

在指定目录下创建临时目录。

### 契约

参数：

- directoryPath: String - 字符串形式的目录路径。

返回值：

- Path - 临时目录对应的路径。

异常：

- FSException - 目录不存在或其他原因导致创建失败时抛出异常。
- IllegalArgumentException - 目录为空或包含空字符时抛出异常。

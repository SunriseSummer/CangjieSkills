<!-- cj-doc kind="api-member" level="5" id="std.fs.func.copy" parent="std.fs" -->
# copy

[← std.fs](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## copy(Path, Path, Bool)

### 签名

```cangjie role=signature
public func copy(sourcePath: Path, to!: Path, overwrite!: Bool = false): Unit
```

实现文件系统的拷贝功能，用于复制文件或目录。

### 契约

当目标位置存在且 `overwrite` 为 `true` 时，该函数要求 `sourcePath` 的类型与 `to` 的类型一致，比如，`sourcePath` 的类型是 `Directory`，`to` 的类型也应该是 `Directory`，否则函数会抛出异常 FSException。当前支持的文件类型有文件夹（Directory），常规文件（Regular file），符号链接（SymbolicLink）。

参数：

- sourcePath: Path - 待拷贝的文件地址。
- to!: Path - 目标地址。
- overwrite!: Bool - 是否覆盖目标地址，默认值为 `false`。

异常：

- FSException - 如果源文件类型和目标文件类型不一致会抛出异常或者 `overwrite` 为 `false` 并且目标地址存在时抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

## copy(String, String, Bool)

### 签名

```cangjie role=signature
public func copy(sourcePath: String, to!: String, overwrite!: Bool = false): Unit
```

实现文件系统的拷贝功能，用于复制文件或目录。

### 契约

当目标位置存在且 `overwrite` 为 `true` 时，该函数要求 `sourcePath` 的类型与 `to` 的类型一致，比如，`sourcePath` 的类型是 `Directory`，`to` 的类型也应该是 `Directory`，否则函数会抛出异常 FSException。当前支持的文件类型有文件夹（Directory），常规文件（Regular file），符号链接（SymbolicLink）。

参数：

- sourcePath: String - 待拷贝的文件地址。
- to!: String - 目标地址。
- overwrite!: Bool - 是否覆盖目标地址，默认值为 `false`。

异常：

- FSException - 如果源文件类型和目标文件类型不一致会抛出异常或者 `overwrite` 为 `false` 并且目标地址存在时抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

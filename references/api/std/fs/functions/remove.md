<!-- cj-doc kind="api-member" level="5" id="std.fs.func.remove" parent="std.fs" -->
# remove

[← std.fs](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## remove(Path, Bool)

### 签名

```cangjie role=signature
public func remove(path: Path, recursive!: Bool = false): Unit
```

删除文件或目录。

### 契约

当目标是文件夹时，可选择是否递归删除文件夹。

参数：

- path: Path - 目标路径。
- recursive!: Bool - 是否递归删除文件夹，默认值为 `false`。

异常：

- FSException - 如果指定目录不存在或删除失败，则抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

## remove(String, Bool)

### 签名

```cangjie role=signature
public func remove(path: String, recursive!: Bool = false): Unit
```

删除文件或目录。

### 契约

当目标是文件夹时，可选择是否递归删除文件夹。

参数：

- path: String - 目标路径。
- recursive!: Bool - 是否递归删除文件夹，默认值为 `false`。

异常：

- FSException - 如果指定目录不存在或删除失败，则抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

<!-- cj-doc kind="api-member" level="5" id="std.fs.func.removeifexists" parent="std.fs" -->
# removeIfExists

[← std.fs](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## removeIfExists(Path, Bool)

### 签名

```cangjie role=signature
public func removeIfExists(path: Path, recursive!: Bool = false): Bool
```

判断目标是否存在，如果存在则执行 remove 方法，并返回 `true`。

### 契约

参数：

- path: Path - 目标路径。
- recursive!: Bool - 是否递归删除文件夹，默认值为 `false`。

返回值：

- Bool - 目标地址是否存在。

异常：

- FSException - 如果删除失败，抛出此异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

## removeIfExists(String, Bool)

### 签名

```cangjie role=signature
public func removeIfExists(path: String, recursive!: Bool = false): Bool
```

判断目标是否存在，如果存在则执行 remove 方法，并返回 `true`。

### 契约

参数：

- path: String - 目标路径。
- recursive!: Bool - 是否递归删除文件夹，默认值为 `false`。

返回值：

- Bool - 目标地址是否存在。

异常：

- FSException - 如果删除失败，抛出此异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

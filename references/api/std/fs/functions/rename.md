<!-- cj-doc kind="api-member" level="5" id="std.fs.func.rename" parent="std.fs" -->
# rename

[← std.fs](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## rename(Path, Path, Bool)

### 签名

```cangjie role=signature
public func rename(sourcePath: Path, to!: Path, overwrite!: Bool = false): Unit
```

将 `sourcePath` 指定的文件或者目录重命名为由 `to` 给定的名称，`sourcePath` 必须是现有文件或者目录的路径，如果 `to` 是现有文件或者目录的路径时，其具体行为由 `overwrite` 指定， 如果 `overwrite` 为 `true`，将会删除现有的文件或者目录，再执行重命名操作，否则会抛出异常。

### 契约

> **注意：**
>
> 当`overwrite` 为 `true`时，`rename`的一个隐含行为是删除目标位置的原有文件或者目录，如果目标位置是目录，将会递归删除目录内的所有内容，需要谨慎使用。

参数：

- sourcePath: Path - 待重命名的地址。
- to!: Path - 目标地址。
- overwrite!: Bool - 是否覆盖目标地址，默认值为 `false`。

异常：

- FSException - 操作系统执行 rename 方法失败时抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

## rename(String, String, Bool)

### 签名

```cangjie role=signature
public func rename(sourcePath: String, to!: String, overwrite!: Bool = false): Unit
```

将 `sourcePath` 指定的文件或者目录重命名为由 `to` 给定的名称，`sourcePath` 必须是现有文件或者目录的路径，如果 `to` 是现有文件或者目录的路径时，其具体行为由 `overwrite` 指定， 如果 `overwrite` 为 `true`，将会删除现有的文件或者目录，再执行重命名操作，`overwrite` 为 `false` 会抛出异常。

### 契约

> **注意：**
>
> 当`overwrite` 为 `true`时，`rename`的一个隐含行为是删除目标位置的原有文件或者目录，如果目标位置是目录，将会递归删除目录内的所有内容，需要谨慎使用。

参数：

- sourcePath: String - 待重命名的地址。
- to!: String - 目标地址。
- overwrite!: Bool - 是否覆盖目标地址，默认值为 `false`。

异常：

- FSException - 操作系统执行 rename 方法失败时抛出异常。
- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

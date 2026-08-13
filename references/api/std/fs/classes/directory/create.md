<!-- cj-doc kind="api-member" level="6" id="std.fs.class.directory.create" parent="std.fs.class.directory" -->
# Directory.create

[← Directory](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func create(Path, Bool)

### 签名

```cangjie role=signature
public static func create(path: Path, recursive!: Bool = false): Unit
```

创建目录。

### 契约

可指定是否递归创建，如果需要递归创建，将逐级创建路径中不存在的目录。

参数：

- path: Path - 待创建的目录路径。
- recursive!: Bool - 是否递归创建目录，true 代表递归创建，false 代表不递归创建，默认 false。

异常：

- FSException - 目录已存在、非递归创建时中间有不存在的目录、权限不足或其他原因导致无法创建目录时，则抛出异常。
- IllegalArgumentException - 目录为空、目录为当前目录、目录为根目录或目录中存在空字符时抛出异常。

## static func create(String, Bool)

### 签名

```cangjie role=signature
public static func create(path: String, recursive!: Bool = false): Unit
```

创建目录。

### 契约

可指定是否递归创建，如果需要递归创建，将逐级创建路径中不存在的目录。

参数：

- path: String - 待创建的目录路径。
- recursive!: Bool - 是否递归创建目录，true 代表递归创建，false 代表不递归创建，默认 false。

异常：

- FSException - 目录已存在、非递归创建时中间有不存在的目录、权限不足或其他原因导致无法创建目录时，则抛出异常。
- IllegalArgumentException - 目录为空、目录为当前目录、目录为根目录或目录中存在空字符时抛出异常。

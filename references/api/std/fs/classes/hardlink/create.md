<!-- cj-doc kind="api-member" level="6" id="std.fs.class.hardlink.create" parent="std.fs.class.hardlink" -->
# HardLink.create

[← HardLink](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func create(Path, Path)

### 签名

```cangjie role=signature
public static func create(link: Path, to!: Path): Unit
```

创建一个新的硬链接到现有路径。

### 契约

功能：创建一个新的硬链接到现有路径。如果新的路径存在，则不会覆盖。

参数：

- link: Path - 新路径的名称。
- to!: Path - 现有路径的名称。

异常：

- IllegalArgumentException - 参数中路径为空、或者包含空字符时抛出异常。
- FSException - 创建硬链接失败时，抛出异常。

## static func create(String, String)

### 签名

```cangjie role=signature
public static func create(link: String, to!: String): Unit
```

创建一个新的硬链接到现有路径。

### 契约

功能：创建一个新的硬链接到现有路径。如果新的路径存在，则不会覆盖。

参数：

- link: String - 新路径的名称。
- to!: String - 现有路径的名称。

异常：

- IllegalArgumentException - 参数中路径为空、或者包含空字符时抛出异常。
- FSException - 创建硬链接失败时，抛出异常。

<!-- cj-doc kind="api-member" level="6" id="std.fs.class.symboliclink.create" parent="std.fs.class.symboliclink" -->
# SymbolicLink.create

[← SymbolicLink](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func create(Path, Path)

### 签名

```cangjie role=signature
public static func create(link: Path, to!: Path): Unit
```

创建一个新的符号链接到现有路径。

### 契约

> **说明：**
>
> 在 Windows 上，创建一个目标不存在的符号链接时，会创建一个文件符号链接，如果目标路径后来被创建为目录，则符号链接将不起作用。

参数：

- link: Path - 待创建的符号链接。
- to!: Path - 待创建的符号链接的目标的路径。

异常：

- IllegalArgumentException - 参数中路径为空、或者包含空字符时抛出异常。
- FSException - 创建符号链接失败时，抛出异常。

## static func create(String, String)

### 签名

```cangjie role=signature
public static func create(link: String, to!: String): Unit
```

创建一个新的符号链接到现有路径。

### 契约

> **说明：**
>
> 在 Windows 上，创建一个目标不存在的符号链接时，会创建一个文件符号链接，如果目标路径后来被创建为目录，则符号链接将不起作用。

参数：

- link: String - 待创建的符号链接。
- to!: String - 待创建的符号链接的目标的路径。

异常：

- IllegalArgumentException - 参数中路径为空、或者包含空字符时抛出异常。
- FSException - 创建符号链接失败时，抛出异常。

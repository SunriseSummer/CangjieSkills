<!-- cj-doc kind="api-member" level="6" id="std.fs.class.symboliclink.readfrom" parent="std.fs.class.symboliclink" -->
# SymbolicLink.readFrom

[← SymbolicLink](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func readFrom(Path, Bool)

### 签名

```cangjie role=signature
public static func readFrom(path: Path, recursive!: Bool = false): Path
```

获取指定符号链接的目标。

### 契约

功能：获取指定符号链接的目标。当指定 'recursive' 为 'true' 时，表示跟踪指向最终目标的链接，并且返回目标的全路径，当指定 'recursive' 为 'false' 时，读取当前目标链接并且返回。

参数：

- path: Path - 符号链接的地址。
- recursive!: Bool - 是否递归读取目标地址，默认为 'false'。

返回值：

- Path - 符号链接的目标地址。

异常：

- IllegalArgumentException - 参数中路径为空、或者包含空字符时抛出异常。
- FSException - 读取符号链接失败时，抛出异常。

## static func readFrom(String, Bool)

### 签名

```cangjie role=signature
public static func readFrom(path: String, recursive!: Bool = false): Path
```

获取指定符号链接的目标。

### 契约

功能：获取指定符号链接的目标。当指定 'recursive' 为 'true' 时，表示跟踪指向最终目标的链接，并且返回目标的全路径，当指定 'recursive' 为 'false' 时，读取当前目标链接并且返回。

参数：

- path: String - 符号链接的地址。
- recursive!: Bool - 是否递归读取目标地址，默认为 'false'。

返回值：

- Path - 符号链接的目标地址。

异常：

- IllegalArgumentException - 参数中路径为空、或者包含空字符时抛出异常。
- FSException - 读取符号链接失败时，抛出异常。

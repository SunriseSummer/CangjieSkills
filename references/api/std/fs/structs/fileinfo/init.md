<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.fileinfo.init" parent="std.fs.struct.fileinfo" -->
# FileInfo.init

[← FileInfo](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Path)

### 签名

```cangjie role=signature
public init(path: Path)
```

创建 FileInfo 实例。

### 契约

参数：

- path: Path - Path 形式的目录路径。

异常：

- FSException - 当路径非法时，抛出异常。
- IllegalArgumentException - 当路径为空，或包含字符串结束符则抛出异常。

## init(String)

### 签名

```cangjie role=signature
public init(path: String)
```

创建 FileInfo 实例。

### 契约

参数：

- path: String - String 形式的目录路径。

异常：

- FSException - 当路径非法时，抛出异常。
- IllegalArgumentException - 当路径为空，或包含字符串结束符则抛出异常。

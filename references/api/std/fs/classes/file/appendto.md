<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.appendto" parent="std.fs.class.file" -->
# File.appendTo

[← File](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func appendTo(Path, Array<Byte>)

### 签名

```cangjie role=signature
public static func appendTo(path: Path, buffer: Array<Byte>): Unit
```

打开指定路径的文件并将 buffer 以追加的方式写入，文件不存在则将创建文件。

### 契约

参数：

- path: Path - 文件路径。
- buffer: Array\<Byte> - 待写入的 bytes。

异常：

- FSException - 文件打开失败或写入失败，则抛出异常。
- IllegalArgumentException - 如果文件路径为空或包含空字符，则抛出异常。

## static func appendTo(String, Array<Byte>)

### 签名

```cangjie role=signature
public static func appendTo(path: String, buffer: Array<Byte>): Unit
```

打开指定路径的文件并将 buffer 以追加的方式写入，文件不存在则将创建文件。

### 契约

参数：

- path: String - 文件路径字符串。
- buffer: Array\<Byte> - 待写入的 bytes。

异常：

- FSException - 文件打开失败或写入失败，则抛出异常。
- IllegalArgumentException - 如果文件路径为空或包含空字符，则抛出异常。

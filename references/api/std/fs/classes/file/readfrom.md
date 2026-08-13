<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.readfrom" parent="std.fs.class.file" -->
# File.readFrom

[← File](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func readFrom(Path)

### 签名

```cangjie role=signature
public static func readFrom(path: Path): Array<Byte>
```

根据指定路径读取文件全部内容，以字节数组的形式返回其内容。

### 契约

参数：

- path: Path - 文件路径。

返回值：

- Array\<Byte> - 字节数组形式的文件全部内容。

异常：

- FSException - 文件路径为空、文件不可读、文件读取失败，则抛出异常。
- IllegalArgumentException - 文件路径包含空字符则抛出异常。

## static func readFrom(String)

### 签名

```cangjie role=signature
public static func readFrom(path: String): Array<Byte>
```

根据指定路径读取文件全部内容，以字节数组的形式返回其内容。

### 契约

参数：

- path: String - 文件路径字符串。

返回值：

- Array\<Byte> - 字节数组形式的文件全部内容。

异常：

- FSException - 文件读取失败、文件关闭失败、文件路径为空、文件不可读，则抛出异常。
- IllegalArgumentException - 文件路径包含空字符则抛出异常。

## 典型示例

`File.readFrom` 一次读取全部字节；文本内容需按实际编码解码。下例使用 `String` 路径重载并以 UTF-8 往返。

```cangjie cjtest=run id=api.file-readfrom.run form=unit timeout=30s
package file_readfrom_example

import std.fs.File

main(): Unit {
    let path = "message.txt"
    File.writeTo(path, "仓颉 UTF-8".toArray())
    let bytes = File.readFrom(path)
    println(String.fromUtf8(bytes))
}
```

```text cjtest=expect for=api.file-readfrom.run stream=stdout match=exact
仓颉 UTF-8
```

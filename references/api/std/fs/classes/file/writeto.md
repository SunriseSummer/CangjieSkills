<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.writeto" parent="std.fs.class.file" -->
# File.writeTo

[← File](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func writeTo(Path, Array<Byte>)

### 签名

```cangjie role=signature
public static func writeTo(path: Path, buffer: Array<Byte>): Unit
```

打开指定路径的文件并将 buffer 以覆盖的方式写入，即文件存在时会将该文件截断为零字节大小，文件不存在则将创建文件。

### 契约

参数：

- path: Path - 文件路径。
- buffer: Array\<Byte> - 待写入的 bytes。

异常：

- FSException - 文件打开失败或写入失败，则抛出异常。
- IllegalArgumentException - 如果文件路径为空或包含空字符，则抛出异常。

## static func writeTo(String, Array<Byte>)

### 签名

```cangjie role=signature
public static func writeTo(path: String, buffer: Array<Byte>): Unit
```

打开指定路径的文件并将 buffer 以覆盖的方式写入，即文件存在时会将该文件截断为零字节大小，文件不存在则将创建文件。

### 契约

参数：

- path: String - 文件路径字符串。
- buffer: Array\<Byte> - 待写入的 bytes。

异常：

- FSException - 文件打开失败或写入失败，则抛出异常。
- IllegalArgumentException - 如果文件路径为空字符串或包含空字符，则抛出异常。

## 典型示例

`writeTo` 会覆盖已有文件。示例随后读回 UTF-8 内容，并删除临时文件，避免污染项目目录。

```cangjie cjtest=run id=api.file.writeto.run form=unit timeout=20s
package file_writeto_example

import std.fs.*

main(): Unit {
    let path = "cjdoc-write-to.txt"
    File.writeTo(path, "Cangjie".toArray())
    println(String.fromUtf8(File.readFrom(path)))
    removeIfExists(path)
}
```

```text cjtest=expect for=api.file.writeto.run stream=stdout match=exact
Cangjie
```

<!-- cj-doc kind="example-leaf" level="4" id="examples.files.file-write" parent="examples.files" -->
# 写入 UTF-8 文件

[← 文件与目录](index.md)

使用 String 路径重载把 UTF-8 字节写入文件，并明确覆盖行为。

## 典型示例

`writeTo` 会覆盖已有文件。示例随后读回 UTF-8 内容，并删除临时文件，避免污染项目目录。

```cangjie cjtest=run id=examples.files.file-write.api.file.writeto.run form=unit timeout=20s
package file_writeto_example

import std.fs.*

main(): Unit {
    let path = "cjdoc-write-to.txt"
    File.writeTo(path, "Cangjie".toArray())
    println(String.fromUtf8(File.readFrom(path)))
    removeIfExists(path)
}
```

预期标准输出：

```text cjtest=expect for=examples.files.file-write.api.file.writeto.run stream=stdout match=exact
Cangjie
```

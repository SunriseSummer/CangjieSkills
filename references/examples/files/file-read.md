<!-- cj-doc kind="example-leaf" level="4" id="examples.files.file-read" parent="examples.files" -->
# 读取 UTF-8 文件

[← 文件与目录](index.md)

使用 String 路径重载读取全部字节，再按 UTF-8 恢复文本。

## 典型示例

`File.readFrom` 一次读取全部字节；文本内容需按实际编码解码。下例使用 `String` 路径重载并以 UTF-8 往返。

```cangjie cjtest=run id=examples.files.file-read.api.file-readfrom.run form=unit timeout=30s
package file_readfrom_example

import std.fs.File

main(): Unit {
    let path = "message.txt"
    File.writeTo(path, "仓颉 UTF-8".toArray())
    let bytes = File.readFrom(path)
    println(String.fromUtf8(bytes))
}
```

预期标准输出：

```text cjtest=expect for=examples.files.file-read.api.file-readfrom.run stream=stdout match=exact
仓颉 UTF-8
```

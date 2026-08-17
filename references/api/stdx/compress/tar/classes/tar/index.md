<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.tar" parent="stdx.compress.tar" -->
# Tar

[← stdx.compress.tar](../../index.md)

`class Tar`

归档和提取目录或流。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func archive(fromDir!: Path, filter!: (Path) -> Bool, destFile!: Path, includeBaseDirectory!: Bool): Unit（6 个重载）`](archive.md) | 配合过滤函数选择性地将指定目录归档为 .tar 文件。 |
| [`static func extract(fromTar!: Path, destDir!: Path, overwrite!: Bool): Unit（4 个重载）`](extract.md) | 将 .tar 文件提取至指定目录。 |


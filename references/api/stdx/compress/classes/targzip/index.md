<!-- cj-doc kind="api-type" level="5" id="stdx.compress.class.targzip" parent="stdx.compress" -->
# TarGzip

[← stdx.compress](../../index.md)

`class TarGzip`

压缩和解压目录或流。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func archive(fromDir!: Path, filter!: (Path) -> Bool, destFile!: Path, includeBaseDirectory!: Bool): Unit（6 个重载）`](archive.md) | 配合过滤函数选择性地将指定目录压缩为 .tar.gz 文件。内部先以 tar 格式归档目录，再以 gzip 压缩归档结果。 |
| [`static func extract(fromTarGzip!: Path, destDir!: Path, overwrite!: Bool): Unit（4 个重载）`](extract.md) | 将 .tar.gz 文件解压至指定目录。内部先以 gzip 解压缩，再以 tar 解包。 |


<!-- cj-doc kind="api-type" level="5" id="std.fs.class.symboliclink" parent="std.fs" -->
# SymbolicLink

[← std.fs](../../index.md)

`SymbolicLink`

提供处理文件系统符号链接相关接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static create(link: Path, to!: Path): Unit`](create.md) | 创建一个新的符号链接到现有路径。 |
| [`static create(link: String, to!: String): Unit`](create.md) | 创建一个新的符号链接到现有路径。 |
| [`static readFrom(path: Path, recursive!: Bool = false): Path`](readfrom.md) | 获取指定符号链接的目标。 |
| [`static readFrom(path: String, recursive!: Bool = false): Path`](readfrom.md) | 获取指定符号链接的目标。 |

<!-- cj-doc kind="api-type" level="5" id="std.fs.class.directory" parent="std.fs" -->
# Directory

[← std.fs](../../index.md)

`Directory`

对应文件系统中的目录，它提供创建、移动、复制、删除、查询属性以及遍历目录等能力。

## 方法

| 签名 | 功能 |
|---|---|
| [`static create(path: Path, recursive!: Bool = false): Unit`](create.md) | 创建目录。 |
| [`static create(path: String, recursive!: Bool = false): Unit`](create.md) | 创建目录。 |
| [`static createTemp(directoryPath: Path): Path`](createtemp.md) | 在指定目录下创建临时目录。 |
| [`static createTemp(directoryPath: String): Path`](createtemp.md) | 在指定目录下创建临时目录。 |
| [`static isEmpty(path: Path): Bool`](isempty.md) | 判断指定目录是否为空。 |
| [`static isEmpty(path: String): Bool`](isempty.md) | 判断指定目录是否为空。 |
| [`static readFrom(path: Path): Array<FileInfo>`](readfrom.md) | 获取当前目录的子项目列表。 |
| [`static readFrom(path: String): Array<FileInfo>`](readfrom.md) | 获取当前目录的子项目列表。 |
| [`static walk(path: Path, f: (FileInfo)->Bool): Unit`](walk.md) | 遍历 path 对应的目录下的子项目（非递归，即不包含子目录的子项目），对每一个子项目执行回调函数。 |
| [`static walk(path: String, f: (FileInfo)->Bool): Unit`](walk.md) | 遍历 path 对应的目录下的子项目（非递归，即不包含子目录的子项目），对每一个子项目执行回调函数。 |

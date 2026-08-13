<!-- cj-doc kind="api-type" level="5" id="std.fs.struct.fileinfo" parent="std.fs" -->
# FileInfo

[← std.fs](../../index.md)

`FileInfo <: Equatable<FileInfo>`

对应文件系统中的文件元数据。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`creationTime: DateTime`](prop-creationtime.md) | 获取创建时间。 |
| [`lastAccessTime: DateTime`](prop-lastaccesstime.md) | 获取最后访问时间。 |
| [`lastModificationTime: DateTime`](prop-lastmodificationtime.md) | 获取最后修改时间。 |
| [`name: String`](prop-name.md) | 获取当前实例对应的文件名或目录名。 |
| [`parentDirectory: Option<FileInfo>`](prop-parentdirectory.md) | 获得父级目录元数据，以 Option<FileInfo> 形式返回，有父级返回 Option<FileInfo>.Some(v)；否则返回 Option<FileInfo>.None。 |
| [`path: Path`](prop-path.md) | 获得当前文件路径，以 Path 形式返回。 |
| [`size: Int64`](prop-size.md) | 返回当前文件大小。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Path)`](init.md) | 创建 FileInfo 实例。 |
| [`init(path: String)`](init.md) | 创建 FileInfo 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`canExecute(): Bool`](canexecute.md) | 判断当前用户是否有权限执行该实例对应的文件。 |
| [`canRead(): Bool`](canread.md) | 判断当前用户是否有权限读取该实例对应的文件。 |
| [`canWrite(): Bool`](canwrite.md) | 判断当前用户是否有权限写入该实例对应的文件。 |
| [`isDirectory(): Bool`](isdirectory.md) | 判断当前文件是否是目录。 |
| [`isHidden(): Bool`](ishidden.md) | 判断当前文件是否隐藏。 |
| [`isReadOnly(): Bool`](isreadonly.md) | 判断当前文件是否只读。 |
| [`isRegular(): Bool`](isregular.md) | 判断当前文件是否是普通文件。 |
| [`isSymbolicLink(): Bool`](issymboliclink.md) | 判断当前文件是否是软链接。 |
| [`setExecutable(executable: Bool): Bool`](setexecutable.md) | 对当前实例对应的文件设置文件所有者是否可执行的权限，当前用户没有权限修改则抛出异常。 |
| [`setReadable(readable: Bool): Bool`](setreadable.md) | 对当前实例对应的文件设置文件所有者是否可读取的权限，当前用户没有权限修改则抛出异常。 |
| [`setWritable(writable: Bool): Bool`](setwritable.md) | 对当前实例对应的文件设置文件所有者是否可写入的权限，当前用户没有权限修改则抛出异常。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator ==(that: FileInfo): Bool`](operator-eq.md) | 判断当前 FileInfo 和另一个 FileInfo 是否对应同一文件。 |

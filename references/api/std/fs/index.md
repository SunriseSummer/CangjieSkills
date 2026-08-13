<!-- cj-doc kind="api-package" level="4" id="std.fs" parent="api.std" -->
# std.fs

[← std 包索引](../index.md)

操作文件、目录、路径和文件元数据。

包路径：`std.fs`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Directory`](classes/directory/index.md) | 对应文件系统中的目录，它提供创建、移动、复制、删除、查询属性以及遍历目录等能力。 |
| [`File <: Resource & IOStream & Seekable`](classes/file/index.md) | 提供一些对文件进行操作的函数，包括文件的打开、创建、关闭、移动、复制、删除，文件的流式读写操作，查询属性以及一些其他函数。 |
| [`HardLink`](classes/hardlink/index.md) | 提供处理文件系统硬链接相关接口。 |
| [`SymbolicLink`](classes/symboliclink/index.md) | 提供处理文件系统符号链接相关接口。 |
| [`FSException <: IOException`](classes/fsexception/index.md) | 文件流异常类，继承了 IO 流异常类。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`FileDescriptor`](structs/filedescriptor/index.md) | 用于获取文件句柄信息。 |
| [`FileInfo <: Equatable<FileInfo>`](structs/fileinfo/index.md) | 对应文件系统中的文件元数据。 |
| [`Path <: Equatable<Path> & Hashable & ToString`](structs/path/index.md) | 提供路径相关的函数。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`OpenMode <: ToString & Equatable<OpenMode>`](enums/openmode/index.md) | 表示不同的文件打开模式。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`canonicalize(…) — 2 个重载`](functions/canonicalize.md) | 将 Path 实例规范化，获取绝对路径形式的规范化路径。 |
| [`copy(…) — 2 个重载`](functions/copy.md) | 实现文件系统的拷贝功能，用于复制文件或目录。 |
| [`exists(…) — 2 个重载`](functions/exists.md) | 判断目标地址是否存在。 |
| [`remove(…) — 2 个重载`](functions/remove.md) | 删除文件或目录。 |
| [`removeIfExists(…) — 2 个重载`](functions/removeifexists.md) | 判断目标是否存在，如果存在则执行 remove 方法，并返回 `true`。 |
| [`rename(…) — 2 个重载`](functions/rename.md) | 将 `sourcePath` 指定的文件或者目录重命名为由 `to` 给定的名称，`sourcePath` 必须是现有文件或者目录的路径，如果 `to` 是现有文件或者目录的路径时，其具体行为由 `overwrite` 指定， 如果 `overwrite` 为 `true`，将会删除现有的文件或者目录，再执行重命名操作，否则会抛出异常。 |

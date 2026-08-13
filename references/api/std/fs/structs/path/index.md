<!-- cj-doc kind="api-type" level="5" id="std.fs.struct.path" parent="std.fs" -->
# Path

[← std.fs](../../index.md)

`Path <: Equatable<Path> & Hashable & ToString`

提供路径相关的函数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`ListSeparator: String = PATH_LISTSEPARATOR`](field-listseparator.md) | 获取路径列表分隔符，用于分隔路径列表中的不同路径。 |
| [`Separator: String = PATH_SEPARATOR`](field-separator.md) | 获取路径分隔符，用于分隔多级目录。 |
| [`extensionName: String`](prop-extensionname.md) | 获得 Path 的文件扩展名部分。 |
| [`fileName: String`](prop-filename.md) | 获得 Path 的文件名（含扩展名）部分。 |
| [`fileNameWithoutExtension: String`](prop-filenamewithoutextension.md) | 获得 Path 的文件名（不含扩展名）部分。 |
| [`parent: Path`](prop-parent.md) | 获得该 Path 实例的父路径。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(rawPath: String)`](init.md) | 创建 Path 实例时不检查路径字符串是否合法，支持绝对路径和相对路径。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 获得 Path 的哈希值。 |
| [`isAbsolute(): Bool`](isabsolute.md) | 判断 Path 是否是绝对路径。 |
| [`isEmpty(): Bool`](isempty.md) | 判断当前实例是否为空路径。 |
| [`isRelative(): Bool`](isrelative.md) | 判断 Path 是否是相对路径，其结果与函数 isAbsolute 结果相反。 |
| [`join(path: Path): Path`](join.md) | 在当前路径后拼接另一个路径字符串形成新路径。 |
| [`join(path: String): Path`](join.md) | 在当前路径后拼接另一个路径字符串形成新路径。 |
| [`normalize(): Path`](normalize.md) | 将路径字符串进行规范化处理，并用规范化后的字符串构造新的 Path 实例。 |
| [`toString(): String`](tostring.md) | 获得 Path 的路径字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator ==(that: Path): Bool`](operator-eq.md) | 判断 Path 是否相等。 |

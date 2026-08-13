<!-- cj-doc kind="api-type" level="5" id="std.fs.class.file" parent="std.fs" -->
# File

[← std.fs](../../index.md)

`File <: Resource & IOStream & Seekable`

提供一些对文件进行操作的函数，包括文件的打开、创建、关闭、移动、复制、删除，文件的流式读写操作，查询属性以及一些其他函数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`fileDescriptor: FileDescriptor`](prop-filedescriptor.md) | 获取文件描述符信息。 |
| [`info: FileInfo`](prop-info.md) | 获取文件元数据信息。 |
| [`length: Int64`](prop-length.md) | 获取文件头至文件尾的数据字节数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Path, mode: OpenMode)`](init.md) | 创建一个 File 对象。 |
| [`init(path: String, mode: OpenMode)`](init.md) | 创建 File 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static appendTo(path: Path, buffer: Array<Byte>): Unit`](appendto.md) | 打开指定路径的文件并将 buffer 以追加的方式写入，文件不存在则将创建文件。 |
| [`static appendTo(path: String, buffer: Array<Byte>): Unit`](appendto.md) | 打开指定路径的文件并将 buffer 以追加的方式写入，文件不存在则将创建文件。 |
| [`static create(path: Path): File`](create.md) | 创建指定路径的文件并返回只写模式的 File 实例。 |
| [`static create(path: String): File`](create.md) | 创建指定路径的文件并返回只写模式的 File 实例。 |
| [`static createTemp(directoryPath: Path): File`](createtemp.md) | 在指定目录下创建临时文件。 |
| [`static createTemp(directoryPath: String): File`](createtemp.md) | 在指定目录下创建临时文件。 |
| [`static readFrom(path: Path): Array<Byte>`](readfrom.md) | 根据指定路径读取文件全部内容，以字节数组的形式返回其内容。 |
| [`static readFrom(path: String): Array<Byte>`](readfrom.md) | 根据指定路径读取文件全部内容，以字节数组的形式返回其内容。 |
| [`static writeTo(path: Path, buffer: Array<Byte>): Unit`](writeto.md) | 打开指定路径的文件并将 buffer 以覆盖的方式写入，即文件存在时会将该文件截断为零字节大小，文件不存在则将创建文件。 |
| [`static writeTo(path: String, buffer: Array<Byte>): Unit`](writeto.md) | 打开指定路径的文件并将 buffer 以覆盖的方式写入，即文件存在时会将该文件截断为零字节大小，文件不存在则将创建文件。 |
| [`canRead(): Bool`](canread.md) | 判断当前 File 对象是否可读。 |
| [`canWrite(): Bool`](canwrite.md) | 判断当前 File 对象是否可写。 |
| [`close(): Unit`](close.md) | 关闭当前 File 对象。 |
| [`flush(): Unit`](flush.md) | 将缓冲区数据写入流。 |
| [`isClosed(): Bool`](isclosed.md) | 判断当前 File 对象是否已关闭。 |
| [`read(buffer: Array<Byte>): Int64`](read.md) | 从文件中读出数据到 buffer 中。 |
| [`seek(sp: SeekPosition): Int64`](seek.md) | 将光标跳转到指定位置。 |
| [`setLength(length: Int64): Unit`](setlength.md) | 将当前文件截断为指定长度。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 将 buffer 中的数据写入到文件中。 |

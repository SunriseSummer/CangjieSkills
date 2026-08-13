<!-- cj-doc kind="api-package" level="4" id="std.io" parent="api.std" -->
# std.io

[← std 包索引](../index.md)

提供程序与外部设备进行数据交换的能力。

包路径：`std.io`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`BufferedInputStream<T> <: InputStream where T <: InputStream`](classes/bufferedinputstream/index.md) | 提供带缓冲区的输入流。 |
| [`BufferedOutputStream<T> <: OutputStream where T <: OutputStream`](classes/bufferedoutputstream/index.md) | 提供带缓冲区的输出流。 |
| [`ByteBuffer <: IOStream & Seekable`](classes/bytebuffer/index.md) | 基于 Array<Byte> 数据类型，提供对字节流的写入、读取等操作。 |
| [`ChainedInputStream<T> <: InputStream where T <: InputStream`](classes/chainedinputstream/index.md) | 提供顺序从 InputStream 数组中读取数据的能力。 |
| [`MultiOutputStream<T> <: OutputStream where T <: OutputStream`](classes/multioutputstream/index.md) | 提供将数据同时写入到 OutputStream 数组中每个输出流中的能力。 |
| [`StringReader<T> where T <: InputStream`](classes/stringreader/index.md) | 提供从 InputStream 输入流中读出数据并转换成字符或字符串的能力。 |
| [`StringWriter<T> where T <: OutputStream`](classes/stringwriter/index.md) | 提供将 String 以及一些 ToString 类型转换成指定编码格式和字节序配置的字符串并写入到输出流的能力。 |
| [`ContentFormatException <: Exception`](classes/contentformatexception/index.md) | 提供字符格式相关的异常处理。 |
| [`open IOException <: Exception`](classes/ioexception/index.md) | 提供 IO 流相关的异常处理。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`InputStream`](interfaces/inputstream/index.md) | 输入流接口。 |
| [`IOStream <: InputStream & OutputStream`](interfaces/iostream.md) | 输入输出流接口。 |
| [`OutputStream`](interfaces/outputstream/index.md) | 输出流接口。 |
| [`Seekable`](interfaces/seekable/index.md) | 移动光标接口。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`SeekPosition`](enums/seekposition/index.md) | 该枚举类型表示光标在文件中的位置。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`copy(from: InputStream, to!: OutputStream): Int64`](functions/copy-inputstream-outputstream.md) | 将一个输入流中未被读取的数据拷贝到另一个输出流中。 |
| [`readString<T>(from: T): String where T <: InputStream & Seekable`](functions/readstring-t-t-where-t-inputstream-seekable.md) | 读取入参中的所有剩余内容，并返回一个字符串。 |
| [`unsafe readStringUnchecked<T>(from: T): String where T <: InputStream & Seekable`](functions/readstringunchecked-t-t-where-t-inputstream-seekable.md) | 读取入参中的所有剩余内容，并返回一个字符串。 |
| [`readToEnd<T>(from: T): Array<Byte> where T <: InputStream & Seekable`](functions/readtoend-t-t-where-t-inputstream-seekable.md) | 获取入参中未被读取的数据。 |

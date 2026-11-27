<!-- cj-doc kind="api-type" level="5" id="std.env.class.consolewriter" parent="std.env" -->
# ConsoleWriter

[← std.env](../../index.md)

`ConsoleWriter <: OutputStream`

此类提供保证线程安全的标准输出功能。

## 方法

| 签名 | 功能 |
|---|---|
| [`flush(): Unit`](flush.md) | 刷新输出流。 |
| [`write(buffer: Array<Byte>): Unit`](write/index.md) | 指定的将字节数组 buffer 写入标准输出或标准错误流中。 |
| [`write(v: Bool): Unit`](write/index.md) | 将指定的布尔值的文本表示形式写入标准输出或标准错误流中。 |
| [`write(v: Float16): Unit`](write/index.md) | 将指定的 16 位浮点数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Float32): Unit`](write/index.md) | 将指定的 32 位浮点数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Float64): Unit`](write/index.md) | 将指定的 64 位浮点数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Int16): Unit`](write/index.md) | 将指定的 16 位有符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Int32): Unit`](write/index.md) | 将指定的 32 位有符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Int64): Unit`](write/index.md) | 将指定的 64 位有符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Int8): Unit`](write/index.md) | 将指定的 8 位有符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: Rune): Unit`](write/index.md) | 将指定的 Rune 的 Unicode 字符值写入标准输出或标准错误流中。 |
| [`write(v: String): Unit`](write/index.md) | 将指定的字符串值写入标准输出或标准错误流中。 |
| [`write(v: UInt16): Unit`](write/index.md) | 将指定的 16 位无符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: UInt32): Unit`](write/index.md) | 将指定的 32 位无符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: UInt64): Unit`](write/index.md) | 将指定的 64 位无符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write(v: UInt8): Unit`](write/index.md) | 将指定的 8 位无符号整数值的文本表示写入标准输出或标准错误流中。 |
| [`write<T>(v: T): Unit where T <: ToString`](write/index.md) | 将实现了 ToString 接口的数据类型写入标准输出或标准错误流中。 |
| [`writeln(buffer: Array<Byte>): Unit`](writeln/index.md) | 指定的将字节数组 buffer （后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Bool): Unit`](writeln/index.md) | 将指定的布尔值的文本表示形式（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Float16): Unit`](writeln/index.md) | 将指定的 16 位浮点数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Float32): Unit`](writeln/index.md) | 将指定的 32 位浮点数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Float64): Unit`](writeln/index.md) | 将指定的 64 位浮点数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Int16): Unit`](writeln/index.md) | 将指定的 16 位有符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Int32): Unit`](writeln/index.md) | 将指定的 32 位有符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Int64): Unit`](writeln/index.md) | 将指定的 64 位有符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Int8): Unit`](writeln/index.md) | 将指定的 8 位有符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: Rune): Unit`](writeln/index.md) | 将指定的 Unicode 字符值（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: String): Unit`](writeln/index.md) | 将指定的字符串值（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: UInt16): Unit`](writeln/index.md) | 将指定的 16 位无符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: UInt32): Unit`](writeln/index.md) | 将指定的 32 位无符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: UInt64): Unit`](writeln/index.md) | 将指定的 64 位无符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln(v: UInt8): Unit`](writeln/index.md) | 将指定的 8 位无符号整数值的文本表示（后跟换行符）写入标准输出或标准错误流中。 |
| [`writeln<T>(v: T): Unit where T <: ToString`](writeln/index.md) | 将实现了 ToString 接口的数据类型转换成的字符串（后跟换行符）写入标准输出或标准错误流中。 |

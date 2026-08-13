<!-- cj-doc kind="api-type" level="5" id="std.io.class.stringwriter" parent="std.io" -->
# StringWriter<T> where T <: OutputStream

[← std.io](../../index.md)

`StringWriter<T> where T <: OutputStream`

提供将 String 以及一些 ToString 类型转换成指定编码格式和字节序配置的字符串并写入到输出流的能力。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(output: T)`](init.md) | 创建 StringWriter 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`flush(): Unit`](flush.md) | 刷新内部缓冲区，将缓冲区数据写入 output 中，并刷新 output。 |
| [`write(v: Bool): Unit`](write/index.md) | 写入 Bool 类型。 |
| [`write(v: Float16): Unit`](write/index.md) | 写入 Float16 类型。 |
| [`write(v: Float32): Unit`](write/index.md) | 写入 Float32 类型。 |
| [`write(v: Float64): Unit`](write/index.md) | 写入 Float64 类型。 |
| [`write(v: Int16): Unit`](write/index.md) | 写入 Int16 类型。 |
| [`write(v: Int32): Unit`](write/index.md) | 写入 Int32 类型。 |
| [`write(v: Int64): Unit`](write/index.md) | 写入 Int64 类型。 |
| [`write(v: Int8): Unit`](write/index.md) | 写入 Int8 类型。 |
| [`write(v: Rune): Unit`](write/index.md) | 写入 Rune 类型。 |
| [`write(v: String): Unit`](write/index.md) | 写入字符串。 |
| [`write(v: UInt16): Unit`](write/index.md) | 写入 UInt16 类型。 |
| [`write(v: UInt32): Unit`](write/index.md) | 写入 UInt32 类型。 |
| [`write(v: UInt64): Unit`](write/index.md) | 写入 UInt64 类型。 |
| [`write(v: UInt8): Unit`](write/index.md) | 写入 UInt8 类型。 |
| [`write<T>(v: T): Unit where T <: ToString`](write/index.md) | 写入 ToString 类型。 |
| [`writeln(): Unit`](writeln/index.md) | 写入换行符。 |
| [`writeln(v: Bool): Unit`](writeln/index.md) | 写入 Bool 类型 + 换行符。 |
| [`writeln(v: Float16): Unit`](writeln/index.md) | 写入 Float16 类型 + 换行符。 |
| [`writeln(v: Float32): Unit`](writeln/index.md) | 写入 Float32 类型 + 换行符。 |
| [`writeln(v: Float64): Unit`](writeln/index.md) | 写入 Float64 类型 + 换行符。 |
| [`writeln(v: Int16): Unit`](writeln/index.md) | 写入 Int16 类型 + 换行符。 |
| [`writeln(v: Int32): Unit`](writeln/index.md) | 写入 Int32 类型 + 换行符。 |
| [`writeln(v: Int64): Unit`](writeln/index.md) | 写入 Int64 类型 + 换行符。 |
| [`writeln(v: Int8): Unit`](writeln/index.md) | 写入 Int8 类型 + 换行符。 |
| [`writeln(v: Rune): Unit`](writeln/index.md) | 写入 Rune 类型 + 换行符。 |
| [`writeln(v: String): Unit`](writeln/index.md) | 写入字符串 + 换行符。 |
| [`writeln(v: UInt16): Unit`](writeln/index.md) | 写入 UInt16 类型 + 换行符。 |
| [`writeln(v: UInt32): Unit`](writeln/index.md) | 写入 UInt32 类型 + 换行符。 |
| [`writeln(v: UInt64): Unit`](writeln/index.md) | 写入 UInt64 类型 + 换行符。 |
| [`writeln(v: UInt8): Unit`](writeln/index.md) | 写入 UInt8 类型 + 换行符。 |
| [`writeln<T>(v: T): Unit where T <: ToString`](writeln/index.md) | 写入 ToString 类型 + 换行符。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> StringWriter<T> <: Resource where T <: Resource`](extensions/extend-t-stringwriter-t-resource-where-t-resource.md) | 为 StringWriter 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。 |
| [`extend<T> StringWriter<T> <: Seekable where T <: Seekable`](extensions/extend-t-stringwriter-t-seekable-where-t-seekable.md) | 为 StringWriter 实现 Seekable 接口，支持查询数据长度，移动光标等操作。 |

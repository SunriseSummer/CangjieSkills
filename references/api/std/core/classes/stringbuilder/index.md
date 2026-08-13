<!-- cj-doc kind="api-type" level="5" id="std.core.class.stringbuilder" parent="std.core" -->
# StringBuilder

[← std.core](../../index.md)

`StringBuilder <: ToString`

该类主要用于字符串的构建。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 获取 StringBuilder 实例此时能容纳字符串的长度，该值会随扩容的发生而变大。 |
| [`size: Int64`](prop-size.md) | 获取 StringBuilder 实例中字符串长度。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个初始容量为 32 的空 StringBuilder 实例。 |
| [`init(value: Array<Rune>)`](init.md) | 使用参数 `value` 指定的字符数组初始化一个 StringBuilder 实例，该实例的初始容量为 `value` 大小，初始内容为 `value` 包含的字符内容。 |
| [`init(capacity: Int64)`](init.md) | 使用参数 `capacity` 指定的容量初始化一个空 StringBuilder 实例，该实例的初始容量为 `value` 大小，初始内容为若干 `\0` 字符。 |
| [`init(r: Rune, n: Int64)`](init.md) | 使用 `n` 个 `r` 字符初始化 StringBuilder 实例，该实例的初始容量为 `n`，初始内容为 `n` 个 `r` 字符。 |
| [`init(str: String)`](init.md) | 根据指定初始字符串构造 StringBuilder 实例，该实例的初始容量为指定字符串的大小，初始内容为指定字符串。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`append(runeArr: Array<Rune>): Unit`](append/index.md) | 在 StringBuilder 末尾插入一个 `Rune` 数组中所有字符。 |
| [`append(b: Bool): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `b` 的字符串表示。 |
| [`append(cstr: CString): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `cstr` 指定 CString 中的内容。 |
| [`append(n: Float16): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: Float32): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: Float64): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: Int16): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: Int32): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: Int64): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: Int8): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(r: Rune): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `r` 指定的字符。 |
| [`append(str: String): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `str` 指定的字符串。 |
| [`append(sb: StringBuilder): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `sb` 指定的 StringBuilder 中的内容。 |
| [`append(n: UInt16): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: UInt32): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: UInt64): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append(n: UInt8): Unit`](append/index.md) | 在 StringBuilder 末尾插入参数 `n` 的字符串表示。 |
| [`append<T>(val: Array<T>): Unit where T <: ToString`](append/index.md) | 在 StringBuilder 末尾插入参数 `val` 指定的 Array<T> 的字符串表示，类型 `T` 需要实现 ToString 接口。 |
| [`append<T>(v: T): Unit where T <: ToString`](append/index.md) | 在 StringBuilder 末尾插入参数 `v` 指定 `T` 类型的字符串表示，类型 `T` 需要实现 ToString 接口。 |
| [`appendFromUtf8(arr: Array<Byte>): Unit`](appendfromutf8.md) | 在 StringBuilder 末尾插入参数 `arr` 指向的字节数组。 |
| [`unsafe appendFromUtf8Unchecked(arr: Array<Byte>): Unit`](appendfromutf8unchecked.md) | 在 StringBuilder 末尾插入参数 `arr` 指向的字节数组。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 将 StringBuilder 扩容 `additional` 大小。 |
| [`reset(capacity!: Option<Int64> = None): Unit`](reset.md) | 清空当前 StringBuilder，并将容量重置为 `capacity` 指定的值。 |
| [`toString(): String`](tostring.md) | 获取 StringBuilder 实例中的字符串。 |

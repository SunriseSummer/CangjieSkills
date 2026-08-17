<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.enum.tarentryformat" parent="stdx.compress.tar" -->
# TarEntryFormat

[← stdx.compress.tar](../../index.md)

`enum TarEntryFormat`

tar 条目格式。

## 方法

| 签名 | 功能 |
|---|---|
| [`func toString(): String`](tostring.md) | 返回当前 tar 文件头部格式枚举实例的 字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator func !=(rhs: TarEntryFormat): Bool`](operator-ne.md) | 判断当前 tar 文件头部格式枚举实例是否与传入的 tar 文件头部格式枚举实例不相等。 |
| [`operator func ==(rhs: TarEntryFormat): Bool`](operator-eq.md) | 判断当前 tar 文件头部格式枚举实例是否与传入的 tar 文件头部格式枚举实例相等。 |

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Gnu`](value-gnu.md) | 构造一个 GNU 扩展格式枚举实例。 |
| [`Pax`](value-pax.md) | 构造一个 PAX 格式枚举实例，表示 POSIX.1-2001 扩展格式，兼容 USTAR，并可通过扩展头记录额外元数据。 |
| [`Ustar`](value-ustar.md) | 构造一个 USTAR 格式枚举实例，表示 POSIX.1-1988 定义的标准格式。 |
| [`V7`](value-v7.md) | 构造一个 V7 格式枚举实例，表示最初的 UNIX 第七版 tar 格式（1979）。 |


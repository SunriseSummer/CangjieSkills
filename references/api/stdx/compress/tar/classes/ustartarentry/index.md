<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.ustartarentry" parent="stdx.compress.tar" -->
# UstarTarEntry

[← stdx.compress.tar](../../index.md)

`class UstarTarEntry <: PosixTarEntry`

表示 Ustar tar 文件条目。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Path)（2 个重载）`](init.md) | 从文件、目录、软链接构造一个 Ustar tar 文件条目。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override func writeTo(target: OutputStream): Unit`](writeto.md) | 将当前条目写入到指定的输出流中。 |


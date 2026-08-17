<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.gnutarentry" parent="stdx.compress.tar" -->
# GnuTarEntry

[← stdx.compress.tar](../../index.md)

`class GnuTarEntry <: PosixTarEntry`

表示 Gnu tar 文件条目。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop accessTime: DateTime`](prop-accesstime.md) | 获取当前条目的访问时间。 |
| [`prop changeTime: DateTime`](prop-changetime.md) | 获取当前条目的修改时间。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Path)（2 个重载）`](init.md) | 从文件、目录、软链接构造一个 Gnu tar 文件条目。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override func writeTo(target: OutputStream): Unit`](writeto.md) | 将当前条目写入到指定的输出流中。 |


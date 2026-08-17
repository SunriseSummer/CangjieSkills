<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.paxtarentry" parent="stdx.compress.tar" -->
# PaxTarEntry

[← stdx.compress.tar](../../index.md)

`class PaxTarEntry <: PosixTarEntry`

表示 Pax tar 文件条目。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Path)（2 个重载）`](init.md) | 从文件、目录、软链接构造一个 Pax tar 文件条目。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func getPaxData(key: String): ?String`](getpaxdata.md) | 获取当前条目的 Pax 数据。 |
| [`override func writeTo(target: OutputStream): Unit`](writeto.md) | 将当前条目写入到指定的输出流中。 |


<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.posixtarentry" parent="stdx.compress.tar" -->
# PosixTarEntry

[← stdx.compress.tar](../../index.md)

`abstract class PosixTarEntry <: TarEntry`

表示含有 Ustar Gnu Pax 格式共有字段的 tar 文件条目。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop deviceMajor: Int32`](prop-devicemajor.md) | 获取当前条目的设备主编号。 |
| [`prop deviceMinor: Int32`](prop-deviceminor.md) | 获取当前条目的设备次编号。 |
| [`prop groupName: String`](prop-groupname.md) | 获取当前条目的组名。 |
| [`prop userName: String`](prop-username.md) | 获取当前条目的用户名。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Path)（2 个重载）`](init.md) | 从文件、目录、软链接构造一个 tar 文件条目。 |


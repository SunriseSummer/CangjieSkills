<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.tarentry" parent="stdx.compress.tar" -->
# TarEntry

[← stdx.compress.tar](../../index.md)

`abstract class TarEntry`

表示一个 tar 文件中的条目，用于和 TarReader 和 TarWriter 进行交互。可从 TarReader 中获取 TarEntry 实例，表示 tar 归档文件中的一个条目。也可通过 TarWriter 将其写入到 tar 归档文件中。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop entryType: TarEntryType`](prop-entrytype.md) | 获取当前条目的条目类型。 |
| [`mut prop gid: Int32`](prop-gid.md) | 获取当前条目的组 ID。 |
| [`mut prop mode: Int32`](prop-mode.md) | 获取当前条目的权限模式。 |
| [`prop modificationTime: DateTime`](prop-modificationtime.md) | 获取当前条目的最后修改时间。 |
| [`mut prop name: String`](prop-name.md) | 获取当前条目的文件名。 |
| [`prop size: Int64`](prop-size.md) | 获取当前条目的大小。 |
| [`prop stream: ?InputStream`](prop-stream.md) | 获取当前条目的输入流。如果实例由 TarReader 创建，则本属性返回流中为条目的数据，若条目没有数据则返回 None。如果实例由构造函数创建，则本属性返回的是创建的文件流，传入 TarWriter 时会调用该属性用于写入条目数据。 |
| [`mut prop uid: Int32`](prop-uid.md) | 获取当前条目的用户 ID。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`protected init(path: Path)（2 个重载）`](init.md) | 从文件、目录、软链接构造一个 tar 文件条目。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`open func writeTo(target: OutputStream): Unit`](writeto.md) | 将当前条目写入到指定的输出流中。 |


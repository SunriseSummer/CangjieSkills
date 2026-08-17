<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.tarwriter" parent="stdx.compress.tar" -->
# TarWriter

[← stdx.compress.tar](../../index.md)

`class TarWriter<T> where T <: OutputStream`

将条目写入到流中，并完成 tar 文件的写入。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop format: TarEntryFormat`](prop-format.md) | 获取当前 tar 文件的条目格式。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(stream: T)（2 个重载）`](init.md) | 从指定的流中创建一个 tar 文件写入器，默认为 Pax 格式。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func finish(): Unit`](finish.md) | 写入 tar 结尾标志，即 1024 个空字节，结束 tar 格式的写入。 |
| [`func flush(): Unit`](flush.md) | 刷新内部流。 |
| [`func write(info: FileInfo, entryName!: String): Unit（5 个重载）`](write.md) | 将指定文件、目录、软链接写入到内部流中。 |

## 扩展实现

| 签名 | 功能 |
|---|---|
| [`extend<T> TarWriter<T> <: Resource where T <: Resource`](extensions/extend-t-tarwriter-t-resource-where-t-resource.md) | 为 TarWriter 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。 |


<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.class.tarreader" parent="stdx.compress.tar" -->
# TarReader

[← stdx.compress.tar](../../index.md)

`class TarReader<T> <: Iterable<TarEntry> where T <: InputStream`

从流中按照 tar 格式读取条目。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(stream: T)`](init.md) | 从指定的流中创建一个 tar 文件读取器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func iterator(): Iterator<TarEntry>`](iterator.md) | 返回一个迭代器，迭代 tar 文件中的条目。 |

## 扩展实现

| 签名 | 功能 |
|---|---|
| [`extend<T> TarReader<T> <: Resource where T <: Resource`](extensions/extend-t-tarreader-t-resource-where-t-resource.md) | 为 TarReader 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。 |


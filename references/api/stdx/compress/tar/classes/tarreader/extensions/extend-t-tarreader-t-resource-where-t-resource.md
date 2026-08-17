<!-- cj-doc kind="api-extension" level="6" id="stdx.compress.tar.class.tarreader.extension.extend-t-tarreader-t-resource-where-t-resource" parent="stdx.compress.tar.class.tarreader" -->
# extend<T> TarReader<T> <: Resource where T <: Resource

[← TarReader](../index.md)

`extend<T> TarReader<T> <: Resource where T <: Resource`

为 TarReader 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。

## 父类型

- Resource

关闭内部流。

## 注意
>
调用此方法后不可再调用 TarReader 的其他接口，否则会造成不可期现象。

## 成员

| 签名 | 功能 |
|---|---|
| `func close(): Unit` | 关闭内部流。 |
| `func isClosed(): Bool` | 判断内部流是否关闭。 |


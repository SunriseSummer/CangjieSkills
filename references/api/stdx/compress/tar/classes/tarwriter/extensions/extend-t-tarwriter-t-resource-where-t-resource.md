<!-- cj-doc kind="api-extension" level="6" id="stdx.compress.tar.class.tarwriter.extension.extend-t-tarwriter-t-resource-where-t-resource" parent="stdx.compress.tar.class.tarwriter" -->
# extend<T> TarWriter<T> <: Resource where T <: Resource

[← TarWriter](../index.md)

`extend<T> TarWriter<T> <: Resource where T <: Resource`

为 TarWriter 实现 Resource 接口，该类型对象可在 `try-with-resource` 语法上下文中实现自动资源释放。

## 父类型

- Resource

写入 tar 结尾标志，并关闭内部流。

## 注意
>
调用此方法后不可再调用 TarWriter 的其他接口，否则会造成不可期现象。

## 成员

| 签名 | 功能 |
|---|---|
| `func close(): Unit` | 写入 tar 结尾标志，并关闭内部流。 |
| `func isClosed(): Bool` | 判断内部流是否关闭。 |


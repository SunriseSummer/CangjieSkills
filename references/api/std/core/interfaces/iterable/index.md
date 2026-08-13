<!-- cj-doc kind="api-type" level="5" id="std.core.interface.iterable" parent="std.core" -->
# Iterable<E>

[← std.core](../../index.md)

`Iterable<E>`

该接口表示可迭代，实现了该接口的类型（通常为容器类型）可以在 `for-in` 语句中实现迭代，也可以获取其对应的迭代器类型实例，调用 `next` 函数实现迭代。

## 方法

| 签名 | 功能 |
|---|---|
| [`iterator(): Iterator<E>`](iterator.md) | 获取迭代器。 |

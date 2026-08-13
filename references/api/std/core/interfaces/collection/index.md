<!-- cj-doc kind="api-type" level="5" id="std.core.interface.collection" parent="std.core" -->
# Collection<T>

[← std.core](../../index.md)

`Collection<T> <: Iterable<T>`

该接口用来表示集合，通常容器类型应该实现该接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`size: Int64`](prop-size.md) | 获取当前集合的大小，即集合中元素的个数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isEmpty(): Bool`](isempty.md) | 判断当前集合是否为空。 |
| [`toArray(): Array<T>`](toarray.md) | 将当前集合转为数组类型。 |

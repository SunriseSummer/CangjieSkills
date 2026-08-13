<!-- cj-doc kind="api-type" level="5" id="stdx.unittest.data.class.serializableprovider" parent="stdx.unittest.data" -->
# SerializableProvider

[← stdx.unittest.data](../../index.md)

`SerializableProvider<T> <: DataProvider<T> where T <: Serializable<T>`

获取序列化数据 DataProvider 接口的实现。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`isInfinite: Bool`](prop-isinfinite.md) | 是否生成无限的数据。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override provide(): Iterable<T>`](provide.md) | 获取数据迭代器。 |

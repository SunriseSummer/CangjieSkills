<!-- cj-doc kind="api-type" level="5" id="stdx.unittest.data.class.jsonstrategy" parent="stdx.unittest.data" -->
# JsonStrategy

[← stdx.unittest.data](../../index.md)

`JsonStrategy<T> <: DataStrategy<T> where T <: Serializable<T>`

DataStrategy 对 JSON 数据格式的序列化实现。

## 方法

| 签名 | 功能 |
|---|---|
| [`override provider(configuration: Configuration): SerializableProvider<T>`](provider.md) | 生成序列化数据迭代器。 |

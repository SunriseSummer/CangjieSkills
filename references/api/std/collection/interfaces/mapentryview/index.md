<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.mapentryview" parent="std.collection" -->
# MapEntryView<K, V>

[← std.collection](../../index.md)

`MapEntryView<K, V>`

提供映射中的某个 key 对应的视图。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`key: K`](prop-key.md) | 返回视图中的 key，如果视图的 key 不在原始映射中，则返回一个该 key 的空视图。 |
| [`mut value: ?V`](prop-value.md) | 读取或修改视图对应原始映射的 value。 |

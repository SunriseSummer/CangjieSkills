<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.hashmap.extension.extend-k-v-hashmap-k-v-tostring-where-v-tostring-k-tostring" parent="std.collection.class.hashmap" -->
# extend<K, V> HashMap<K, V> <: ToString where V <: ToString, K <: ToString

[← HashMap<K, V> where K <: Hashable & Equatable<K>](../index.md)

`extend<K, V> HashMap<K, V> <: ToString where V <: ToString, K <: ToString`

为 HashMap<K, V> 扩展 ToString 接口，支持转字符串操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`toString(): String`](../tostring.md) | 将当前 HashMap<K, V> 实例转换为字符串。 |

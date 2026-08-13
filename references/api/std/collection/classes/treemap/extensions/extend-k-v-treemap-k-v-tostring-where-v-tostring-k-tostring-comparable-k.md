<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.treemap.extension.extend-k-v-treemap-k-v-tostring-where-v-tostring-k-tostring-comparable-k" parent="std.collection.class.treemap" -->
# extend<K, V> TreeMap<K, V> <: ToString where V <: ToString, K <: ToString & Comparable<K>

[← TreeMap<K, V> where K <: Comparable<K>](../index.md)

`extend<K, V> TreeMap<K, V> <: ToString where V <: ToString, K <: ToString & Comparable<K>`

为 TreeMap<K, V> 扩展 ToString 接口，支持转字符串操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`toString(): String`](../tostring.md) | 将当前 TreeMap<K, V> 实例转换为字符串。 |

<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.shrink.extension.extend-k-v-hashmap-k-v-shrink-hashmap-k-v" parent="std.unittest.prop_test.interface.shrink" -->
# extend<K, V> HashMap<K, V> <: Shrink<HashMap<K, V>>

[← Shrink<T>](../index.md)

`extend<K, V> HashMap<K, V> <: Shrink<HashMap<K, V>>`

为 HashMap<T> 实现了 Shrink<HashMap<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`shrink(): Iterable<HashMap<K, V>>`](../shrink/index.md) | 将该值缩小为一组可能的“较小”值。 |

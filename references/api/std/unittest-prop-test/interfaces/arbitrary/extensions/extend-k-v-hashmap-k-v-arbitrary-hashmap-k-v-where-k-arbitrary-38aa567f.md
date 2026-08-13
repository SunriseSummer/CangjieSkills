<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitrary.extension.extend-k-v-hashmap-k-v-arbitrary-hashmap-k-v-where-k-arbitrary-38aa567f" parent="std.unittest.prop_test.interface.arbitrary" -->
# extend<K, V> HashMap<K, V> <: Arbitrary<HashMap<K, V>> where K <: Arbitrary<K>, V <: Arbitrary<V>

[← Arbitrary<T>](../index.md)

`extend<K, V> HashMap<K, V> <: Arbitrary<HashMap<K, V>> where K <: Arbitrary<K>, V <: Arbitrary<V>`

为 HashMap<T> 实现了 Arbitrary 接口，且 T 需实现 Arbitrary<T> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<HashMap<K, V>>`](../arbitrary/index.md) | 获取生成 HashMap<K, V> 类型随机值生成器。 |

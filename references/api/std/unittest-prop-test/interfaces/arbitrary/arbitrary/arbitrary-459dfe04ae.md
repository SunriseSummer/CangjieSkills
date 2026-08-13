<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-459dfe04ae" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<HashMap<K, V>>
```

获取生成 HashMap<K, V> 类型随机值生成器。

适用扩展：[extend<K, V> HashMap<K, V> <: Arbitrary<HashMap<K, V>> where K <: Arbitrary<K>, V <: Arbitrary<V>](../extensions/extend-k-v-hashmap-k-v-arbitrary-hashmap-k-v-where-k-arbitrary-38aa567f.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<HashMap\<K, V>> - 生成 HashMap\<K, V> 类型随机值生成器。

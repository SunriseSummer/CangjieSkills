<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.shrink.shrink.shrink-b01df8a1fb" parent="std.unittest.prop_test.interface.shrink.shrink" -->
# Shrink<T>.func shrink()

[← Shrink<T>.shrink](index.md)

## 签名

```cangjie role=signature
func shrink(): Iterable<HashMap<K, V>>
```

将该值缩小为一组可能的“较小”值。

适用扩展：[extend<K, V> HashMap<K, V> <: Shrink<HashMap<K, V>>](../extensions/extend-k-v-hashmap-k-v-shrink-hashmap-k-v.md)。

## 契约

返回值：

- Iterable\<HashMap\<K, V>> - 一组可能的“较小”值的迭代器。

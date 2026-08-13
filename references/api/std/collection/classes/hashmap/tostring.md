<!-- cj-doc kind="api-member" level="7" id="std.collection.class.hashmap.tostring" parent="std.collection.class.hashmap.extension.extend-k-v-hashmap-k-v-tostring-where-v-tostring-k-tostring" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.toString

[← extend<K, V> HashMap<K, V> <: ToString where V <: ToString, K <: ToString](extensions/extend-k-v-hashmap-k-v-tostring-where-v-tostring-k-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将当前 HashMap<K, V> 实例转换为字符串。

## 契约

该字符串包含 HashMap\<K, V> 内每个键值对的字符串表示，形如："[(k1, v1), (k2, v2), (k3, v3)]"。

返回值：

- String - 转换得到的字符串。

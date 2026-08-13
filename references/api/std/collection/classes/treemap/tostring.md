<!-- cj-doc kind="api-member" level="7" id="std.collection.class.treemap.tostring" parent="std.collection.class.treemap.extension.extend-k-v-treemap-k-v-tostring-where-v-tostring-k-tostring-comparable-k" -->
# TreeMap<K, V> where K <: Comparable<K>.toString

[← extend<K, V> TreeMap<K, V> <: ToString where V <: ToString, K <: ToString & Comparable<K>](extensions/extend-k-v-treemap-k-v-tostring-where-v-tostring-k-tostring-comparable-k.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将当前 TreeMap<K, V> 实例转换为字符串。

## 契约

该字符串包含 TreeMap\<K, V> 内每个键值对的字符串表示，形如："[(k1, v1), (k2, v2), (k3, v3)]"。

返回值：

- String - 转换得到的字符串。

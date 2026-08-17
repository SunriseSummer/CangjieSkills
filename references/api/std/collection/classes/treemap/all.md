<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.all" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.all

[← TreeMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func all(predicate: (K, V) -> Bool): Bool
```

判断 TreeMap 中所有键值对是否都满足条件。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (K, V) -> Bool - 给定的条件。

## 返回值

- Bool - 如果 TreeMap 中所有键值对都满足条件，返回 true，否则返回 false


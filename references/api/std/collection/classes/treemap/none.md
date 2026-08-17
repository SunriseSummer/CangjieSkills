<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.none" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.none

[← TreeMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func none(predicate: (K, V) -> Bool): Bool
```

判断 TreeMap 中所有键值对是否都不满足条件。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (K, V) -> Bool - 给定的条件。

## 返回值

- Bool - 当前 TreeMap 中键值对是否都不满足条件。


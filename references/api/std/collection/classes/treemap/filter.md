<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.filter" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.filter

[← TreeMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func filter(predicate: (K, V) -> Bool): TreeMap<K, V>
```

返回一个满足筛选条件的键值对的新 TreeMap<K, V>。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (K, V) -> Bool - 给定的条件。

## 返回值

- TreeMap<K, V> - 返回一个满足筛选条件的键值对的新集合。


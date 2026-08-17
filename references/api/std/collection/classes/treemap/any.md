<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.any" parent="std.collection.class.treemap" -->
# TreeMap<K, V>.any

[← TreeMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func any(predicate: (K, V) -> Bool): Bool
```

判断 TreeMap 是否存在任意一个满足条件的键值对。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (K, V) -> Bool - 给定的条件。

## 返回值

- Bool - 是否存在任意满足条件的键值对。


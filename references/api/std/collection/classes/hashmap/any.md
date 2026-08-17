<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.any" parent="std.collection.class.hashmap" -->
# HashMap<K, V>.any

[← HashMap<K, V>](index.md)

## 签名

```cangjie role=signature
public func any(predicate: (K, V) -> Bool): Bool
```

判断 HashMap 是否存在任意一个满足条件的键值对。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (K, V) -> Bool - 给定的条件。

## 返回值

- Bool - 是否存在任意满足条件的键值对。


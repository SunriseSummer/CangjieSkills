<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.removeif" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.removeIf

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public func removeIf(predicate: (K, V) -> Bool): Unit
```

传入 lambda 表达式，如果满足条件，则删除对应的键值。

## 契约

参数：

- predicate: (K, V) ->Bool - 传递一个 lambda 表达式进行判断。

异常：

- ConcurrentModificationException - 当 `predicate` 中增删或者修改 TreeMap 内键值对时，抛出异常。

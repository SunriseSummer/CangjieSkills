<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.removeif" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.removeIf

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func removeIf(predicate: (K, V) -> Bool): Unit
```

传入 lambda 表达式，如果满足条件，则删除对应的键值对。

## 契约

该函数会遍历整个 HashMap，所以满足 `predicate(K, V) == true` 的键值对都会被删除。

参数：

- predicate: (K, V) ->Bool - 传递一个 lambda 表达式进行判断。

异常：

- ConcurrentModificationException - 当 `predicate` 中增删或者修改 HashMap 内键值对时，抛出异常。

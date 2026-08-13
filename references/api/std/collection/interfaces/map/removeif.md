<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.removeif" parent="std.collection.interface.map" -->
# Map<K, V>.removeIf

[← Map<K, V>](index.md)

## 签名

```cangjie role=signature
func removeIf(predicate: (K, V) -> Bool): Unit
```

传入 lambda 表达式，如果满足条件，则删除对应的键值对。

## 契约

参数：

- predicate: (K, V) ->Bool - 传递一个 lambda 表达式进行判断。

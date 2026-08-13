<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.set.removeif" parent="std.collection.interface.set" -->
# Set<T>.removeIf

[← Set<T>](index.md)

## 签名

```cangjie role=signature
func removeIf(predicate: (T) -> Bool): Unit
```

传入 lambda 表达式，如果满足 `true` 条件，则删除对应的元素。

## 契约

参数：

- predicate: (T) ->Bool - 传入一个 lambda 表达式进行判断。

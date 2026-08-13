<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.list.removeif" parent="std.collection.interface.list" -->
# List<T>.removeIf

[← List<T>](index.md)

## 签名

```cangjie role=signature
func removeIf(predicate: (T) -> Bool): Unit
```

删除此列表中满足给定 lambda 表达式或函数的所有元素。

## 契约

参数：

- predicate: (T) ->Bool - 传递判断删除的条件。

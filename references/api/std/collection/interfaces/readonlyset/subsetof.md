<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlyset.subsetof" parent="std.collection.interface.readonlyset" -->
# ReadOnlySet<T>.subsetOf

[← ReadOnlySet<T>](index.md)

## 签名

```cangjie role=signature
func subsetOf(other: ReadOnlySet<T>): Bool
```

检查该集合是否为其他集合的子集。

## 契约

参数：

- other: ReadOnlySet\<T> - 其他集合。

返回值：

- Bool - 果该集合是指定集合的子集，则返回 true；否则，返回 false。

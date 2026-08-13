<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.list.operator-indexer" parent="std.collection.interface.list" -->
# List<T>.[]

[← List<T>](index.md)

## 签名

```cangjie role=signature
operator func [](index: Int64, value!: T): Unit
```

操作符重载 - set，通过下标运算符用指定的元素替换此列表中指定位置的元素。

## 契约

参数：

- index: Int64 - 要设置的索引值。
- value!: T - 要设置的 T 类型的值。

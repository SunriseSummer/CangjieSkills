<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashset.operator-bitor" parent="std.collection.class.hashset" -->
# HashSet<T> where T <: Hashable & Equatable<T>.|

[← HashSet<T> where T <: Hashable & Equatable<T>](index.md)

## 签名

```cangjie role=signature
public operator func |(other: ReadOnlySet<T>): HashSet<T>
```

返回包含两个集合并集的元素的新集合。

## 契约

参数：

- other: ReadOnlySet\<T> - 传入集合。

返回值：

- HashSet\<T> - T 类型集合。

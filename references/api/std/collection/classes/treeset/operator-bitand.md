<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.operator-bitand" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.&

[← TreeSet<T> where T <: Comparable<T>](index.md)

## 签名

```cangjie role=signature
public operator func &(other: ReadOnlySet<T>): TreeSet<T>
```

返回包含两个集合交集的元素的新集合。

## 契约

参数：

- other: ReadOnlySet\<T> - 传入集合。

返回值：

- TreeSet\<T> - T 类型集合。

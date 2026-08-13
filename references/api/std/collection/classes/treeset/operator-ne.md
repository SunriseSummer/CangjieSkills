<!-- cj-doc kind="api-member" level="7" id="std.collection.class.treeset.operator-ne" parent="std.collection.class.treeset.extension.extend-t-treeset-t-equatable-treeset-t" -->
# TreeSet<T> where T <: Comparable<T>.!=

[← extend<T> TreeSet<T> <: Equatable<TreeSet<T>>](extensions/extend-t-treeset-t-equatable-treeset-t.md)

## 签名

```cangjie role=signature
public operator func !=(that: TreeSet<T>): Bool
```

判断当前实例与参数指向的 TreeSet<T> 实例是否不等。

## 契约

参数：

- that: TreeSet\<T> - 被比较的对象。

返回值：

- Bool - 如果不等，则返回 true，否则返回 false。

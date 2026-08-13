<!-- cj-doc kind="api-member" level="7" id="std.collection.class.treeset.operator-eq" parent="std.collection.class.treeset.extension.extend-t-treeset-t-equatable-treeset-t" -->
# TreeSet<T> where T <: Comparable<T>.==

[← extend<T> TreeSet<T> <: Equatable<TreeSet<T>>](extensions/extend-t-treeset-t-equatable-treeset-t.md)

## 签名

```cangjie role=signature
public operator func ==(that: TreeSet<T>): Bool
```

判断当前实例与参数指向的 TreeSet<T> 实例是否相等。

## 契约

两个 TreeSet\<T> 相等指的是其中包含的元素完全相等。

参数：

- that: TreeSet\<T> - 被比较的对象。

返回值：

- Bool - 如果相等，则返回 true，否则返回 false。

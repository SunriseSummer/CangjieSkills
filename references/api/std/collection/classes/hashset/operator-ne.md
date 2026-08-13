<!-- cj-doc kind="api-member" level="7" id="std.collection.class.hashset.operator-ne" parent="std.collection.class.hashset.extension.extend-t-hashset-t-equatable-hashset-t" -->
# HashSet<T> where T <: Hashable & Equatable<T>.!=

[← extend<T> HashSet<T> <: Equatable<HashSet<T>>](extensions/extend-t-hashset-t-equatable-hashset-t.md)

## 签名

```cangjie role=signature
public operator func !=(that: HashSet<T>): Bool
```

判断当前实例与参数指向的 HashSet<T> 实例是否不等。

## 契约

参数：

- that: HashSet\<T> - 被比较的对象。

返回值：

- Bool - 如果不等，则返回 true，否则返回 false。

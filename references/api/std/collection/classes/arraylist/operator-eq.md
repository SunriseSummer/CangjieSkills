<!-- cj-doc kind="api-member" level="7" id="std.collection.class.arraylist.operator-eq" parent="std.collection.class.arraylist.extension.extend-t-arraylist-t-equatable-arraylist-t-where-t-equatable-t" -->
# ArrayList<T>.==

[← extend<T> ArrayList<T> <: Equatable<ArrayList<T>> where T <: Equatable<T>](extensions/extend-t-arraylist-t-equatable-arraylist-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public operator func ==(that: ArrayList<T>): Bool
```

判断当前实例与参数指向的 ArrayList 实例是否相等。

## 契约

两个数组相等指的是两者对应位置的元素分别相等。

参数：

- that: ArrayList\<T> - 被比较的对象。

返回值：

- Bool - 如果相等，则返回 true，否则返回 false。

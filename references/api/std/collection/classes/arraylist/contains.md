<!-- cj-doc kind="api-member" level="7" id="std.collection.class.arraylist.contains" parent="std.collection.class.arraylist.extension.extend-t-arraylist-t-equatable-arraylist-t-where-t-equatable-t" -->
# ArrayList<T>.contains

[← extend<T> ArrayList<T> <: Equatable<ArrayList<T>> where T <: Equatable<T>](extensions/extend-t-arraylist-t-equatable-arraylist-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public func contains(element: T): Bool
```

判断当前数组中是否含有指定元素 `element`。

## 契约

参数：

- element: T - 待寻找的元素。

返回值：

- Bool - 如果数组中包含指定元素，返回 true，否则返回 false。

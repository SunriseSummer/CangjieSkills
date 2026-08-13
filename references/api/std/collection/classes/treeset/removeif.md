<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.removeif" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.removeIf

[← TreeSet<T> where T <: Comparable<T>](index.md)

## 签名

```cangjie role=signature
public func removeIf(predicate: (T) -> Bool): Unit
```

传入 lambda 表达式，如果满足 `true` 条件，则删除对应的元素。

## 契约

参数：

- predicate: (T) ->Bool - 是否删除元素的判断条件。

异常：

- ConcurrentModificationException - 当 `predicate` 中增删或者修改 TreeSet 内元素时，抛出异常。

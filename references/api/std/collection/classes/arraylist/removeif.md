<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.removeif" parent="std.collection.class.arraylist" -->
# ArrayList<T>.removeIf

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func removeIf(predicate: (T) -> Bool): Unit
```

删除此 ArrayList 中满足给定 lambda 表达式或函数的所有元素。

## 契约

参数：

- predicate: (T) ->Bool - 传递判断删除的条件。

异常：

- ConcurrentModificationException - 当 `predicate` 中增删或者修改 ArrayList 内元素时，抛出异常。

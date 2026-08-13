<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.filter" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.filter

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func filter(predicate: (T)-> Bool): Iterator<T>
```

筛选出满足条件的元素。

## 契约

参数：

- predicate: (T) -> Bool - 给定的条件，条件为 `true` 的元素会按顺序出现在返回的迭代器里。

返回值：

- Iterator\<T> - 返回一个新迭代器。

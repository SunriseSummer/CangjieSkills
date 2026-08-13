<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.any" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.any

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func any(predicate: (T)-> Bool): Bool
```

判断迭代器是否存在任意一个满足条件的元素。

## 契约

功能：判断迭代器是否存在任意一个满足条件的元素。此方法会重复获取并消耗迭代器中元素直到某个元素满足条件。

参数：

- predicate: (T) -> Bool - 给定的条件。

返回值：

- Bool - 是否存在任意满足条件的元素。

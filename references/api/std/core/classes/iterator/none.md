<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.none" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.none

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func none(predicate: (T)-> Bool): Bool
```

判断当前迭代器中所有元素是否都不满足条件。

## 契约

功能：判断当前迭代器中所有元素是否都不满足条件。此方法会重复获取并消耗迭代器中元素直到某个元素满足条件。

参数：

- predicate: (T) -> Bool - 给定的条件。

返回值：

- Bool - 当前迭代器中元素是否都不满足条件。

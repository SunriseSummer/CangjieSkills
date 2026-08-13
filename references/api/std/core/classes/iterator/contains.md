<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.contains" parent="std.core.class.iterator.extension.extend-t-iterator-t-where-t-equatable-t" -->
# Iterator<T>.contains

[← extend<T> Iterator<T> where T <: Equatable<T>](extensions/extend-t-iterator-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public func contains(element: T): Bool
```

遍历所有元素，判断是否包含指定元素。

## 契约

功能：遍历所有元素，判断是否包含指定元素。此方法会重复获取并消耗迭代器中元素直到某个元素与参数 `element` 相等。

参数：

- element: T - 要查找的元素。

返回值：

- Bool - 是否包含指定元素。

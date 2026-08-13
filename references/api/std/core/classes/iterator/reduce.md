<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.reduce" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.reduce

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func reduce(operation: (T, T) -> T): Option<T>
```

使用第一个元素作为初始值，从左向右计算。

## 契约

功能：使用第一个元素作为初始值，从左向右计算。此方法会消耗迭代器中的所有元素。

参数：

- operation: (T, T) -> T - 给定的计算函数。

返回值：

- Option\<T> - 返回计算结果。

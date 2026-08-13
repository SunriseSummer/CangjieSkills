<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.fold" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.fold

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func fold<R>(initial: R, operation: (R, T)->R): R
```

使用指定初始值，从左向右计算。

## 契约

功能：使用指定初始值，从左向右计算。此方法会消耗迭代器中的所有元素。

参数：

- initial: R - 给定的 R 类型的初始值。
- operation: (R, T) -> R - 给定的计算函数。

返回值：

- R - 返回最终计算得到的值。

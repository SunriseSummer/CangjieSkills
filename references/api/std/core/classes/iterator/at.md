<!-- cj-doc kind="api-member" level="7" id="std.core.class.iterator.at" parent="std.core.class.iterator.extension.extend-t-iterator-t" -->
# Iterator<T>.at

[← extend<T> Iterator<T>](extensions/extend-t-iterator-t.md)

## 签名

```cangjie role=signature
public func at(n: Int64): Option<T>
```

获取当前迭代器第 n 个元素，n 从 0 开始计数。

## 契约

功能：获取当前迭代器第 n 个元素，n 从 0 开始计数。此方法会消耗指定元素前的所有元素（包括指定元素）。

参数：

- n: Int64 - 给定的元素序号，序号从 0 开始。

返回值：

- Option\<T> - 返回对应位置元素，若 n 大于剩余元素数量则返回 None。

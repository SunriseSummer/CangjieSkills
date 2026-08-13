<!-- cj-doc kind="api-member" level="7" id="std.core.class.box.compare" parent="std.core.class.box.extension.extend-t-box-t-comparable-box-t-where-t-comparable-t" -->
# Box<T>.compare

[← extend<T> Box<T> <: Comparable<Box<T>> where T <: Comparable<T>](extensions/extend-t-box-t-comparable-box-t-where-t-comparable-t.md)

## 签名

```cangjie role=signature
public func compare(that: Box<T>): Ordering
```

判断当前 Box 实例与另一个 Box 实例的大小关系。

## 契约

参数：

- that: Box\<T> - 比较的另外一个 Box 对象。

返回值：

- Ordering - 如果当前 Box 实例大于 that，返回 Ordering.GT，等于返回 Ordering.EQ，小于返回 Ordering.LT。

<!-- cj-doc kind="api-member" level="7" id="std.core.enum.ordering.compare" parent="std.core.enum.ordering.extension.extend-ordering-comparable" -->
# Ordering.compare

[← extend Ordering <: Comparable](extensions/extend-ordering-comparable.md)

## 签名

```cangjie role=signature
public func compare(that: Ordering): Ordering
```

判断当前 Ordering 实例与参数指定的 Ordering 实例的大小关系。

## 契约

Ordering 枚举的大小关系为：GT > EQ > LT。

参数：

- that: Ordering - 待比较的 Ordering 实例。

返回值：

- Ordering - 如果大于，返回 GT；如果等于，返回 EQ；如果小于，返回 LT。

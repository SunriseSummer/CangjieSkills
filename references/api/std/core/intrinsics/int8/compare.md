<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int8.compare" parent="std.core.intrinsic.int8.extension.extend-int8-comparable-int8" -->
# Int8.compare

[← extend Int8 <: Comparable<Int8>](extensions/extend-int8-comparable-int8.md)

## 签名

```cangjie role=signature
public func compare(rhs: Int8): Ordering
```

判断当前 Int8 值与指定 Int8 值的大小关系。

## 契约

参数：

- rhs: Int8 - 待比较的另一个 Int8 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

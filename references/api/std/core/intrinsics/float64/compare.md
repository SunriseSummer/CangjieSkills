<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float64.compare" parent="std.core.intrinsic.float64.extension.extend-float64-comparable-float64" -->
# Float64.compare

[← extend Float64 <: Comparable<Float64>](extensions/extend-float64-comparable-float64.md)

## 签名

```cangjie role=signature
public func compare(rhs: Float64): Ordering
```

判断当前 Float64 值与指定 Float64 值的大小关系。

## 契约

参数：

- rhs: Float64 - 待比较的另一个 Float64 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

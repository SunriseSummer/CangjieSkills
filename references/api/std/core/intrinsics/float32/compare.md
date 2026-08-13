<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float32.compare" parent="std.core.intrinsic.float32.extension.extend-float32-comparable-float32" -->
# Float32.compare

[← extend Float32 <: Comparable<Float32>](extensions/extend-float32-comparable-float32.md)

## 签名

```cangjie role=signature
public func compare(rhs: Float32): Ordering
```

判断当前 Float32 值与指定 Float32 值的大小关系。

## 契约

参数：

- rhs: Float32 - 待比较的另一个 Float32 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

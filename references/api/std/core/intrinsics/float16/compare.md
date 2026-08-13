<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float16.compare" parent="std.core.intrinsic.float16.extension.extend-float16-comparable-float16" -->
# Float16.compare

[← extend Float16 <: Comparable<Float16>](extensions/extend-float16-comparable-float16.md)

## 签名

```cangjie role=signature
public func compare(rhs: Float16): Ordering
```

判断当前 Float16 值与指定 Float16 值的大小关系。

## 契约

参数：

- rhs: Float16 - 待比较的另一个 Float16 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

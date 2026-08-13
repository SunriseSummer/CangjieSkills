<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int64.compare" parent="std.core.intrinsic.int64.extension.extend-int64-comparable-int64" -->
# Int64.compare

[← extend Int64 <: Comparable<Int64>](extensions/extend-int64-comparable-int64.md)

## 签名

```cangjie role=signature
public func compare(rhs: Int64): Ordering
```

判断当前 Int64 值与指定 Int64 值的大小关系。

## 契约

参数：

- rhs: Int64 - 待比较的另一个 Int64 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ 如果小于，返回 Ordering.LT。

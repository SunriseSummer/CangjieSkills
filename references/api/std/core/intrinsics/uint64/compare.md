<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint64.compare" parent="std.core.intrinsic.uint64.extension.extend-uint64-comparable-uint64" -->
# UInt64.compare

[← extend UInt64 <: Comparable<UInt64>](extensions/extend-uint64-comparable-uint64.md)

## 签名

```cangjie role=signature
public func compare(rhs: UInt64): Ordering
```

判断当前 UInt64 值与指定 UInt64 值的大小关系。

## 契约

参数：

- rhs: UInt64 - 待比较的另一个 UInt64 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

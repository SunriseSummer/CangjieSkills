<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint32.compare" parent="std.core.intrinsic.uint32.extension.extend-uint32-comparable-uint32" -->
# UInt32.compare

[← extend UInt32 <: Comparable<UInt32>](extensions/extend-uint32-comparable-uint32.md)

## 签名

```cangjie role=signature
public func compare(rhs: UInt32): Ordering
```

判断当前 UInt32 值与指定 UInt32 值的大小关系。

## 契约

参数：

- rhs: UInt32 - 待比较的另一个 UInt32 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

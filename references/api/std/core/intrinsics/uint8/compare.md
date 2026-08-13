<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint8.compare" parent="std.core.intrinsic.uint8.extension.extend-uint8-comparable-uint8" -->
# UInt8.compare

[← extend UInt8 <: Comparable<UInt8>](extensions/extend-uint8-comparable-uint8.md)

## 签名

```cangjie role=signature
public func compare(rhs: UInt8): Ordering
```

判断当前 UInt8 值与指定 UInt8 值的大小关系。

## 契约

参数：

- rhs: UInt8 - 待比较的另一个 UInt8 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

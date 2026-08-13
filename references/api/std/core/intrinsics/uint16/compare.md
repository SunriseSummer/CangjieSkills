<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint16.compare" parent="std.core.intrinsic.uint16.extension.extend-uint16-comparable-uint16" -->
# UInt16.compare

[← extend UInt16 <: Comparable<UInt16>](extensions/extend-uint16-comparable-uint16.md)

## 签名

```cangjie role=signature
public func compare(rhs: UInt16): Ordering
```

判断当前 UInt16 值与指定 UInt16 值的大小关系。

## 契约

参数：

- rhs: UInt16 - 待比较的另一个 UInt16 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int32.compare" parent="std.core.intrinsic.int32.extension.extend-int32-comparable-int32" -->
# Int32.compare

[← extend Int32 <: Comparable<Int32>](extensions/extend-int32-comparable-int32.md)

## 签名

```cangjie role=signature
public func compare(rhs: Int32): Ordering
```

判断当前 Int32 值与指定 Int32 值的大小关系。

## 契约

参数：

- rhs: Int32 - 待比较的另一个 Int32 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

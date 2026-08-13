<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int16.compare" parent="std.core.intrinsic.int16.extension.extend-int16-comparable-int16" -->
# Int16.compare

[← extend Int16 <: Comparable<Int16>](extensions/extend-int16-comparable-int16.md)

## 签名

```cangjie role=signature
public func compare(rhs: Int16): Ordering
```

判断当前 Int16 值与指定 Int16 值的大小关系。

## 契约

参数：

- rhs: Int16 - 待比较的另一个 Int16 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

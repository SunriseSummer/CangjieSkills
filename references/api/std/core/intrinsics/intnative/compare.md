<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.intnative.compare" parent="std.core.intrinsic.intnative.extension.extend-intnative-comparable-intnative" -->
# IntNative.compare

[← extend IntNative <: Comparable<IntNative>](extensions/extend-intnative-comparable-intnative.md)

## 签名

```cangjie role=signature
public func compare(rhs: IntNative): Ordering
```

判断当前 IntNative 值与指定 IntNative 值的大小关系。

## 契约

参数：

- rhs: IntNative - 待比较的另一个 IntNative 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

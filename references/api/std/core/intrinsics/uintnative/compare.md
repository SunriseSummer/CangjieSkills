<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uintnative.compare" parent="std.core.intrinsic.uintnative.extension.extend-uintnative-comparable-uintnative" -->
# UIntNative.compare

[← extend UIntNative <: Comparable<UIntNative>](extensions/extend-uintnative-comparable-uintnative.md)

## 签名

```cangjie role=signature
public func compare(rhs: UIntNative): Ordering
```

判断当前 UIntNative 值与指定 UIntNative 值的大小关系。

## 契约

参数：

- rhs: UIntNative - 待比较的另一个 UIntNative 值。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

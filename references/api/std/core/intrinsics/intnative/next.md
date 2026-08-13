<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.intnative.next" parent="std.core.intrinsic.intnative.extension.extend-intnative-countable-intnative" -->
# IntNative.next

[← extend IntNative <: Countable<IntNative>](extensions/extend-intnative-countable-intnative.md)

## 签名

```cangjie role=signature
public func next(right: Int64): IntNative
```

获取在数轴上当前 IntNative 位置往右移动 `right` 后对应位置的 IntNative 值。

## 契约

功能：获取在数轴上当前 IntNative 位置往右移动 `right` 后对应位置的 IntNative 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- IntNative - 往右数 `right` 后所到位置的 IntNative 值。

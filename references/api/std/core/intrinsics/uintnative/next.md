<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uintnative.next" parent="std.core.intrinsic.uintnative.extension.extend-uintnative-countable" -->
# UIntNative.next

[← extend UIntNative <: Countable](extensions/extend-uintnative-countable.md)

## 签名

```cangjie role=signature
public func next(right: Int64): UIntNative
```

获取在数轴上当前 UIntNative 位置往右移动 `right` 后对应位置的 UIntNative 值。

## 契约

功能：获取在数轴上当前 UIntNative 位置往右移动 `right` 后对应位置的 UIntNative 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- UIntNative - 往右数 `right` 后所到位置的 UIntNative 值。

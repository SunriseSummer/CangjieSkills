<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint16.next" parent="std.core.intrinsic.uint16.extension.extend-uint16-countable-uint16" -->
# UInt16.next

[← extend UInt16 <: Countable<UInt16>](extensions/extend-uint16-countable-uint16.md)

## 签名

```cangjie role=signature
public func next(right: Int64): UInt16
```

获取在数轴上当前 UInt16 位置往右移动 `right` 后对应位置的 UInt16 值。

## 契约

功能：获取在数轴上当前 UInt16 位置往右移动 `right` 后对应位置的 UInt16 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- UInt16 - 往右数 `right` 后所到位置的 UInt16 值。

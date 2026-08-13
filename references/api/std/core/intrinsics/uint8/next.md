<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint8.next" parent="std.core.intrinsic.uint8.extension.extend-uint8-countable-uint8" -->
# UInt8.next

[← extend UInt8 <: Countable<UInt8>](extensions/extend-uint8-countable-uint8.md)

## 签名

```cangjie role=signature
public func next(right: Int64): UInt8
```

获取在数轴上当前 UInt8 位置往右移动 `right` 后对应位置的 UInt8 值。

## 契约

功能：获取在数轴上当前 UInt8 位置往右移动 `right` 后对应位置的 UInt8 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- UInt8 - 往右数 `right` 后所到位置的 UInt8 值。

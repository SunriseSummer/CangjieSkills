<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint32.next" parent="std.core.intrinsic.uint32.extension.extend-uint32-countable-uint32" -->
# UInt32.next

[← extend UInt32 <: Countable<UInt32>](extensions/extend-uint32-countable-uint32.md)

## 签名

```cangjie role=signature
public func next(right: Int64): UInt32
```

获取在数轴上当前 UInt32 位置往右移动 `right` 后对应位置的 UInt32 值。

## 契约

功能：获取在数轴上当前 UInt32 位置往右移动 `right` 后对应位置的 UInt32 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- UInt32 - 往右数 `right` 后所到位置的 UInt32 值。

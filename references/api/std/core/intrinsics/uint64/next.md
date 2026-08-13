<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint64.next" parent="std.core.intrinsic.uint64.extension.extend-uint64-countable-uint64" -->
# UInt64.next

[← extend UInt64 <: Countable<UInt64>](extensions/extend-uint64-countable-uint64.md)

## 签名

```cangjie role=signature
public func next(right: Int64): UInt64
```

获取在数轴上当前 UInt64 位置往右移动 `right` 后对应位置的 UInt64 值。

## 契约

功能：获取在数轴上当前 UInt64 位置往右移动 `right` 后对应位置的 UInt64 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- UInt64 - 往右数 `right` 后所到位置的 UInt64 值。

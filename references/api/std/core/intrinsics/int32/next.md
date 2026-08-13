<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int32.next" parent="std.core.intrinsic.int32.extension.extend-int32-countable-int32" -->
# Int32.next

[← extend Int32 <: Countable<Int32>](extensions/extend-int32-countable-int32.md)

## 签名

```cangjie role=signature
public func next(right: Int64): Int32
```

获取在数轴上当前 Int32 位置往右移动 `right` 后对应位置的 Int32 值。

## 契约

功能：获取在数轴上当前 Int32 位置往右移动 `right` 后对应位置的 Int32 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- Int32 - 往右数 `right` 后所到位置的 Int32 值。

<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int64.next" parent="std.core.intrinsic.int64.extension.extend-int64-countable-int64" -->
# Int64.next

[← extend Int64 <: Countable<Int64>](extensions/extend-int64-countable-int64.md)

## 签名

```cangjie role=signature
public func next(right: Int64): Int64
```

获取在数轴上当前 Int64 位置往右移动 `right` 后对应位置的 Int64 值。

## 契约

功能：获取在数轴上当前 Int64 位置往右移动 `right` 后对应位置的 Int64 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- Int64 - 往右数 `right` 后所到位置的 Int64 值。

<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int16.next" parent="std.core.intrinsic.int16.extension.extend-int16-countable-int16" -->
# Int16.next

[← extend Int16 <: Countable<Int16>](extensions/extend-int16-countable-int16.md)

## 签名

```cangjie role=signature
public func next(right: Int64): Int16
```

获取在数轴上当前 Int16 位置往右移动 `right` 后对应位置的 Int16 值。

## 契约

功能：获取在数轴上当前 Int16 位置往右移动 `right` 后对应位置的 Int16 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- Int16 - 往右数 `right` 后所到位置的 Int16 值。

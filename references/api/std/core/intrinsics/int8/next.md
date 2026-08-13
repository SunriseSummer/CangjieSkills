<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.int8.next" parent="std.core.intrinsic.int8.extension.extend-int8-countable-int8" -->
# Int8.next

[← extend Int8 <: Countable<Int8>](extensions/extend-int8-countable-int8.md)

## 签名

```cangjie role=signature
public func next(right: Int64): Int8
```

获取在数轴上当前 Int8 位置往右移动 `right` 后对应位置的 Int8 值。

## 契约

功能：获取在数轴上当前 Int8 位置往右移动 `right` 后对应位置的 Int8 值。如果值溢出，则会从数轴最左边继续移动。

参数：

- right: Int64 - 往右数的个数。

返回值：

- Int8 - 往右数 `right` 后所到位置的 Int8 值。

<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.uint16.extension.extend-uint16-countable-uint16" parent="std.core.intrinsic.uint16" -->
# extend UInt16 <: Countable<UInt16>

[← UInt16](../index.md)

`extend UInt16 <: Countable<UInt16>`

为 UInt16 类型扩展 Countable<UInt16> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): UInt16`](../next.md) | 获取在数轴上当前 UInt16 位置往右移动 `right` 后对应位置的 UInt16 值。 |
| [`position(): Int64`](../position.md) | 获取当前 UInt16 值的位置信息，即将该 UInt16 转换为 Int64 值。 |

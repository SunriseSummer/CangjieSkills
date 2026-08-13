<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.uint8.extension.extend-uint8-countable-uint8" parent="std.core.intrinsic.uint8" -->
# extend UInt8 <: Countable<UInt8>

[← UInt8](../index.md)

`extend UInt8 <: Countable<UInt8>`

为 UInt8 类型扩展 Countable<UInt8> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): UInt8`](../next.md) | 获取在数轴上当前 UInt8 位置往右移动 `right` 后对应位置的 UInt8 值。 |
| [`position(): Int64`](../position.md) | 获取当前 UInt8 值的位置信息，即将该 UInt8 转换为 Int64 值。 |

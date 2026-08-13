<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.uint32.extension.extend-uint32-countable-uint32" parent="std.core.intrinsic.uint32" -->
# extend UInt32 <: Countable<UInt32>

[← UInt32](../index.md)

`extend UInt32 <: Countable<UInt32>`

为 UInt32 类型扩展 Countable<UInt32> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): UInt32`](../next.md) | 获取在数轴上当前 UInt32 位置往右移动 `right` 后对应位置的 UInt32 值。 |
| [`position(): Int64`](../position.md) | 获取当前 UInt32 值的位置信息，即将该 UInt32 转换为 UInt64 值。 |

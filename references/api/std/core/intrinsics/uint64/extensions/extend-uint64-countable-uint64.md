<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.uint64.extension.extend-uint64-countable-uint64" parent="std.core.intrinsic.uint64" -->
# extend UInt64 <: Countable<UInt64>

[← UInt64](../index.md)

`extend UInt64 <: Countable<UInt64>`

为 UInt64 类型扩展 Countable<UInt64> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): UInt64`](../next.md) | 获取在数轴上当前 UInt64 位置往右移动 `right` 后对应位置的 UInt64 值。 |
| [`position(): Int64`](../position.md) | 获取当前 UInt64 值的位置信息，即将该 UInt64 转换为 Int64 值。 |

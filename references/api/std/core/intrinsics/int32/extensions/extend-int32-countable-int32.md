<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.int32.extension.extend-int32-countable-int32" parent="std.core.intrinsic.int32" -->
# extend Int32 <: Countable<Int32>

[← Int32](../index.md)

`extend Int32 <: Countable<Int32>`

为 Int32 类型扩展 Countable<Int32> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): Int32`](../next.md) | 获取在数轴上当前 Int32 位置往右移动 `right` 后对应位置的 Int32 值。 |
| [`position(): Int64`](../position.md) | 获取当前 Int32 值的位置信息，即将该 Int32 转换为 Int64 值。 |

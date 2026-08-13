<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.int64.extension.extend-int64-countable-int64" parent="std.core.intrinsic.int64" -->
# extend Int64 <: Countable<Int64>

[← Int64](../index.md)

`extend Int64 <: Countable<Int64>`

为 Int64 类型扩展 Countable<Int64> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): Int64`](../next.md) | 获取在数轴上当前 Int64 位置往右移动 `right` 后对应位置的 Int64 值。 |
| [`position(): Int64`](../position.md) | 获取当前 Int64 值的位置信息，即返回该 Int64 值本身。 |

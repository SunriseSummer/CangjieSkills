<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.int8.extension.extend-int8-countable-int8" parent="std.core.intrinsic.int8" -->
# extend Int8 <: Countable<Int8>

[← Int8](../index.md)

`extend Int8 <: Countable<Int8>`

为 Int8 类型扩展 Countable<Int8> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): Int8`](../next.md) | 获取在数轴上当前 Int8 位置往右移动 `right` 后对应位置的 Int8 值。 |
| [`position(): Int64`](../position.md) | 获取当前 Int8 值的位置信息，即将该 Int8 转换为 Int64 值。 |

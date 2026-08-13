<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.float16" parent="std.core" -->
# Float16

[← std.core](../../index.md)

表示 16 位浮点数，符合 `IEEE 754` 中的半精度格式（`binary16`）。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16`](extensions/extend-float16.md) | 拓展半精度浮点数以支持一些数学常数。 |
| [`extend Float16`](extensions/extend-float16-2.md) | 支持与 UInt16 互相转换。 |
| [`extend Float16 <: Comparable<Float16>`](extensions/extend-float16-comparable-float16.md) | 为 Float16 类型扩展 Comparable<Float16> 接口，支持比较操作。 |
| [`extend Float16 <: Hashable`](extensions/extend-float16-hashable.md) | 为 Float16 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Float16 <: ToString`](extensions/extend-float16-tostring.md) | 为 Float16 类型其扩展 ToString 接口，实现向 String 类型的转换。 |

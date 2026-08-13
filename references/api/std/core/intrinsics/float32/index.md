<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.float32" parent="std.core" -->
# Float32

[← std.core](../../index.md)

表示 32 位浮点数，符合 `IEEE 754` 中的单精度格式（`binary32`）。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float32`](extensions/extend-float32.md) | 拓展单精度浮点数以支持一些数学常数。 |
| [`extend Float32`](extensions/extend-float32-2.md) | 支持与 UInt32 互相转换。 |
| [`extend Float32 <: Comparable<Float32>`](extensions/extend-float32-comparable-float32.md) | 为 Float32 类型扩展 Comparable<Float32> 接口，支持比较操作。 |
| [`extend Float32 <: Hashable`](extensions/extend-float32-hashable.md) | 为 Float32 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Float32 <: ToString`](extensions/extend-float32-tostring.md) | 为 Float32 类型其扩展 ToString 接口，实现向 String 类型的转换。 |

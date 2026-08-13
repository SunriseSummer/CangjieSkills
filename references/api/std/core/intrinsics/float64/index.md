<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.float64" parent="std.core" -->
# Float64

[← std.core](../../index.md)

64 位浮点类型；数值转换用 `Float64(value)`。仓颉 1.0.5 没有 `isFinite()` 成员，有限值判断使用 `!value.isNaN() && !value.isInf()`。

## 关键契约

常用判断：

- `value.isNaN()`：是否为非数。
- `value.isInf()`：是否为正或负无穷。
- `!value.isNaN() && !value.isInf()`：是否为有限值。

`isNormal()` 的语义是正规浮点数，不等同于有限值；零和次正规数是有限值，但 `isNormal()` 返回 `false`。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float64`](extensions/extend-float64.md) | 拓展双精度浮点数以支持一些数学常数。 |
| [`extend Float64`](extensions/extend-float64-2.md) | 支持与 UInt64 互相转换。 |
| [`extend Float64 <: Comparable<Float64>`](extensions/extend-float64-comparable-float64.md) | 为 Float64 类型扩展 Comparable<Float64> 接口，支持比较操作。 |
| [`extend Float64 <: Hashable`](extensions/extend-float64-hashable.md) | 为 Float64 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Float64 <: ToString`](extensions/extend-float64-tostring.md) | 为 Float64 类型其扩展 ToString 接口，实现向 String 类型的转换。 |

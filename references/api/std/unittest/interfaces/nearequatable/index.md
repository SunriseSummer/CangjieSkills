<!-- cj-doc kind="api-type" level="5" id="std.unittest.interface.nearequatable" parent="std.unittest" -->
# NearEquatable<CT, D>

[← std.unittest](../../index.md)

`NearEquatable<CT, D>`

判断某个对象是否基于这个 delta 近似相等。

## 方法

| 签名 | 功能 |
|---|---|
| [`isNear(obj: CT, delta!: D): Bool`](isnear.md) | 判断某个对象是否基于这个 delta 近似相等。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16 <: NearEquatable<Float16, Float16>`](extensions/extend-float16-nearequatable-float16-float16.md) | 对类型 Float16 扩展接口 NearEquatable。 |
| [`extend Float16 <: NearEquatable<Float16, RelativeDelta<Float16>>`](extensions/extend-float16-nearequatable-float16-relativedelta-float16.md) | 对类型 Float16 扩展接口 NearEquatable，且使用 RelativeDelta 做近似计算。 |
| [`extend Float32 <: NearEquatable<Float32, Float32>`](extensions/extend-float32-nearequatable-float32-float32.md) | 对类型 Float32 扩展接口 NearEquatable。 |
| [`extend Float32 <: NearEquatable<Float32, RelativeDelta<Float32>>`](extensions/extend-float32-nearequatable-float32-relativedelta-float32.md) | 对类型 Float32 扩展接口 NearEquatable，且使用 RelativeDelta 做近似计算。 |
| [`extend Float64 <: NearEquatable<Float64, Float64>`](extensions/extend-float64-nearequatable-float64-float64.md) | 对类型 Float64 扩展接口 NearEquatable。 |
| [`extend Float64 <: NearEquatable<Float64, RelativeDelta<Float64>>`](extensions/extend-float64-nearequatable-float64-relativedelta-float64.md) | 对类型 Float64 扩展接口 NearEquatable，且使用 RelativeDelta 做近似计算。 |

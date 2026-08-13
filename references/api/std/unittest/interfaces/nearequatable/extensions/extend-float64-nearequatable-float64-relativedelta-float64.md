<!-- cj-doc kind="api-extension" level="6" id="std.unittest.interface.nearequatable.extension.extend-float64-nearequatable-float64-relativedelta-float64" parent="std.unittest.interface.nearequatable" -->
# extend Float64 <: NearEquatable<Float64, RelativeDelta<Float64>>

[← NearEquatable<CT, D>](../index.md)

`extend Float64 <: NearEquatable<Float64, RelativeDelta<Float64>>`

对类型 Float64 扩展接口 NearEquatable，且使用 RelativeDelta 做近似计算。

## 成员

| 签名 | 功能 |
|---|---|
| [`isNear(obj: Float64, delta!: RelativeDelta<Float64>): Bool`](../isnear.md) | 判断某个对象是否基于这个 delta 近似相等。 |

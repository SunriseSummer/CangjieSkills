<!-- cj-doc kind="api-extension" level="6" id="std.unittest.interface.nearequatable.extension.extend-float16-nearequatable-float16-relativedelta-float16" parent="std.unittest.interface.nearequatable" -->
# extend Float16 <: NearEquatable<Float16, RelativeDelta<Float16>>

[← NearEquatable<CT, D>](../index.md)

`extend Float16 <: NearEquatable<Float16, RelativeDelta<Float16>>`

对类型 Float16 扩展接口 NearEquatable，且使用 RelativeDelta 做近似计算。

## 成员

| 签名 | 功能 |
|---|---|
| [`isNear(obj: Float16, delta!: RelativeDelta<Float16>): Bool`](../isnear.md) | 判断某个对象是否基于这个 delta 近似相等。 |

<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-float64-arbitraryrange-float64" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Float64 <: ArbitraryRange<Float64>

[← ArbitraryRange<T>](../index.md)

`extend Float64 <: ArbitraryRange<Float64>`

为 Float64 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Float64, max: Float64): Generator<Float64>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Float64`](../max/index.md) | 返回最大值。 |
| [`min(): Float64`](../min/index.md) | 返回最小值。 |

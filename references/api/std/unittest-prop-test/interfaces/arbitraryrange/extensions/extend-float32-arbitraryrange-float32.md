<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-float32-arbitraryrange-float32" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Float32 <: ArbitraryRange<Float32>

[← ArbitraryRange<T>](../index.md)

`extend Float32 <: ArbitraryRange<Float32>`

为 Float32 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Float32, max: Float32): c<Float32>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Float32`](../max/index.md) | 返回最大值。 |
| [`min(): Float32`](../min/index.md) | 返回最小值。 |

<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-float16-arbitraryrange-float16" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Float16 <: ArbitraryRange<Float16>

[← ArbitraryRange<T>](../index.md)

`extend Float16 <: ArbitraryRange<Float16>`

为 Float16 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Float16, max: Float16): Generator<Float16>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Float16`](../max/index.md) | 返回最大值。 |
| [`min(): Float16`](../min/index.md) | 返回最小值。 |

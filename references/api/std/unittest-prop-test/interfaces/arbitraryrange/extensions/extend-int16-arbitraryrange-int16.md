<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-int16-arbitraryrange-int16" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Int16 <: ArbitraryRange<Int16>

[← ArbitraryRange<T>](../index.md)

`extend Int16 <: ArbitraryRange<Int16>`

为 Int16 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Int16, max: Int16): Generator<Int16>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Int16`](../max/index.md) | 返回最大值。 |
| [`min(): Int16`](../min/index.md) | 返回最小值。 |

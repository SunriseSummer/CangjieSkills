<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-int8-arbitraryrange-int8" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Int8 <: ArbitraryRange<Int8>

[← ArbitraryRange<T>](../index.md)

`extend Int8 <: ArbitraryRange<Int8>`

为 Int8 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Int8, max: Int8): Generator<Int8>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Int8`](../max/index.md) | 返回最大值。 |
| [`min(): Int8`](../min/index.md) | 返回最小值。 |

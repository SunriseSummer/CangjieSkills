<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-int64-arbitraryrange-int64" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Int64 <: ArbitraryRange<Int64>

[← ArbitraryRange<T>](../index.md)

`extend Int64 <: ArbitraryRange<Int64>`

为 Int64 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Int64, max: Int64): Generator<Int64>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Int64`](../max/index.md) | 返回最大值。 |
| [`min(): Int64`](../min/index.md) | 返回最小值。 |

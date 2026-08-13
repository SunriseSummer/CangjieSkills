<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-int32-arbitraryrange-int32" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend Int32 <: ArbitraryRange<Int32>

[← ArbitraryRange<T>](../index.md)

`extend Int32 <: ArbitraryRange<Int32>`

为 UInt32 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: Int32, max: Int32): Generator<Int32>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): Int32`](../max/index.md) | 返回最大值。 |
| [`min(): Int32`](../min/index.md) | 返回最小值。 |

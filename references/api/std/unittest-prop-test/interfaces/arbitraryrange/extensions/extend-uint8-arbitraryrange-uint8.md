<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-uint8-arbitraryrange-uint8" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend UInt8 <: ArbitraryRange<UInt8>

[← ArbitraryRange<T>](../index.md)

`extend UInt8 <: ArbitraryRange<UInt8>`

为 UInt8 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: UInt8, max: UInt8): Generator<UInt8>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): UInt8`](../max/index.md) | 返回最大值。 |
| [`min(): UInt8`](../min/index.md) | 返回最小值。 |

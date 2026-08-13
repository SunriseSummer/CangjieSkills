<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-uint16-arbitraryrange-uint16" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend UInt16 <: ArbitraryRange<UInt16>

[← ArbitraryRange<T>](../index.md)

`extend UInt16 <: ArbitraryRange<UInt16>`

为 UInt16 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: UInt16, max: UInt16): Generator<UInt16>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): UInt16`](../max/index.md) | 返回最大值。 |
| [`min(): UInt16`](../min/index.md) | 返回最小值。 |

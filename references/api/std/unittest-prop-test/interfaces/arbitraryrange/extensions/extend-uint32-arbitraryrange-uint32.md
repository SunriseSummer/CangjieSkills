<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-uint32-arbitraryrange-uint32" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend UInt32 <: ArbitraryRange<UInt32>

[← ArbitraryRange<T>](../index.md)

`extend UInt32 <: ArbitraryRange<UInt32>`

为 UInt32 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: UInt32, max: UInt32): Generator<UInt32>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): UInt32`](../max/index.md) | 返回最大值。 |
| [`min(): UInt32`](../min/index.md) | 返回最小值。 |

<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-uint64-arbitraryrange-uint64" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend UInt64 <: ArbitraryRange<UInt64>

[← ArbitraryRange<T>](../index.md)

`extend UInt64 <: ArbitraryRange<UInt64>`

为 UInt64 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: UInt64, max: UInt64): Generator<UInt64>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): UInt64`](../max/index.md) | 返回最大值。 |
| [`min(): UInt64`](../min/index.md) | 返回最小值。 |

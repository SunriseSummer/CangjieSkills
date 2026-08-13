<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-75e7932ef7" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Float64, Float64)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Float64, max: Float64): Generator<Float64>
```

返回在范围内生成的值。

适用扩展：[extend Float64 <: ArbitraryRange<Float64>](../extensions/extend-float64-arbitraryrange-float64.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Float64 - 可生成范围的最小值。
- max: Float64 - 可生成范围的最大值。

返回值：

- Generator\<Float64> - 生成器。

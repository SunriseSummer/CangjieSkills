<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-fb0debc4b4" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Float16, Float16)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Float16, max: Float16): Generator<Float16>
```

返回在范围内生成的值。

适用扩展：[extend Float16 <: ArbitraryRange<Float16>](../extensions/extend-float16-arbitraryrange-float16.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Float16 - 可生成范围的最小值。
- max: Float16 - 可生成范围的最大值。

返回值：

- Generator\<Float16> - 生成器。

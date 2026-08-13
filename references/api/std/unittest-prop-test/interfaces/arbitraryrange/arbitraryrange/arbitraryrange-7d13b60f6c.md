<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-7d13b60f6c" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Float32, Float32)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Float32, max: Float32): c<Float32>
```

返回在范围内生成的值。

适用扩展：[extend Float32 <: ArbitraryRange<Float32>](../extensions/extend-float32-arbitraryrange-float32.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Float32 - 可生成范围的最小值。
- max: Float32 - 可生成范围的最大值。

返回值：

- Generator\<Float32> - 生成器。

<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-d65ec41143" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, UInt8, UInt8)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: UInt8, max: UInt8): Generator<UInt8>
```

返回在范围内生成的值。

适用扩展：[extend UInt8 <: ArbitraryRange<UInt8>](../extensions/extend-uint8-arbitraryrange-uint8.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: UInt8 - 可生成范围的最小值。
- max: UInt8 - 可生成范围的最大值。

返回值：

- Generator\<UInt8> - 生成器。

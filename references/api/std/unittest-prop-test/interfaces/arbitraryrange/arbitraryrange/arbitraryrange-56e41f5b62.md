<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-56e41f5b62" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, UInt16, UInt16)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: UInt16, max: UInt16): Generator<UInt16>
```

返回在范围内生成的值。

适用扩展：[extend UInt16 <: ArbitraryRange<UInt16>](../extensions/extend-uint16-arbitraryrange-uint16.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: UInt16 - 可生成范围的最小值。
- max: UInt16 - 可生成范围的最大值。

返回值：

- Generator\<UInt16> - 生成器。

<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-f5945157af" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, UInt32, UInt32)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: UInt32, max: UInt32): Generator<UInt32>
```

返回在范围内生成的值。

适用扩展：[extend UInt32 <: ArbitraryRange<UInt32>](../extensions/extend-uint32-arbitraryrange-uint32.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: UInt32 - 可生成范围的最小值。
- max: UInt32 - 可生成范围的最大值。

返回值：

- Generator\<UInt32> - 生成器。

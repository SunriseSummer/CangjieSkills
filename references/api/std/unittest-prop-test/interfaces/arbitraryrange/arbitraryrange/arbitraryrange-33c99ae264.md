<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-33c99ae264" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, UInt64, UInt64)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: UInt64, max: UInt64): Generator<UInt64>
```

返回在范围内生成的值。

适用扩展：[extend UInt64 <: ArbitraryRange<UInt64>](../extensions/extend-uint64-arbitraryrange-uint64.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: UInt64 - 可生成范围的最小值。
- max: UInt64 - 可生成范围的最大值。

返回值：

- Generator\<UInt64> - 生成器。

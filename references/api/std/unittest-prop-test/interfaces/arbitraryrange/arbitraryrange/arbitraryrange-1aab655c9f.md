<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-1aab655c9f" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Int16, Int16)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Int16, max: Int16): Generator<Int16>
```

返回在范围内生成的值。

适用扩展：[extend Int16 <: ArbitraryRange<Int16>](../extensions/extend-int16-arbitraryrange-int16.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Int16 - 可生成范围的最小值。
- max: Int16 - 可生成范围的最大值。

返回值：

- Generator\<Int16> - 生成器。

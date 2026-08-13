<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-724742f5a7" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Int64, Int64)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Int64, max: Int64): Generator<Int64>
```

返回在范围内生成的值。

适用扩展：[extend Int64 <: ArbitraryRange<Int64>](../extensions/extend-int64-arbitraryrange-int64.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Int64 - 可生成范围的最小值。
- max: Int64 - 可生成范围的最大值。

返回值：

- Generator\<Int64> - 生成器。

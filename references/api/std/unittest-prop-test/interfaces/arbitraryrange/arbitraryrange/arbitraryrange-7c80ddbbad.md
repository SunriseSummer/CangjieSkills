<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-7c80ddbbad" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Int8, Int8)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Int8, max: Int8): Generator<Int8>
```

返回在范围内生成的值。

适用扩展：[extend Int8 <: ArbitraryRange<Int8>](../extensions/extend-int8-arbitraryrange-int8.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Int8 - 可生成范围的最小值。
- max: Int8 - 可生成范围的最大值。

返回值：

- Generator\<Int8> - 生成器。

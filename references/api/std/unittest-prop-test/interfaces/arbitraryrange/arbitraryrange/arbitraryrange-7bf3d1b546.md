<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-7bf3d1b546" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, Int32, Int32)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: Int32, max: Int32): Generator<Int32>
```

返回在范围内生成的值。

适用扩展：[extend Int32 <: ArbitraryRange<Int32>](../extensions/extend-int32-arbitraryrange-int32.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: Int32 - 可生成范围的最小值。
- max: Int32 - 可生成范围的最大值。

返回值：

- Generator\<Int32> - 生成器。

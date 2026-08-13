<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-9bb633995f" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, IntNative, IntNative)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: IntNative, max: IntNative): Generator<IntNative>
```

返回在范围内生成的值。

适用扩展：[extend IntNative <: ArbitraryRange<IntNative>](../extensions/extend-intnative-arbitraryrange-intnative.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: IntNative - 可生成范围的最小值。
- max: IntNative - 可生成范围的最大值。

返回值：

- Generator\<IntNative> - 生成器。

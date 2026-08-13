<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange.arbitraryrange-973c019779" parent="std.unittest.prop_test.interface.arbitraryrange.arbitraryrange" -->
# ArbitraryRange<T>.func arbitraryRange(RandomSource, UIntNative, UIntNative)

[← ArbitraryRange<T>.arbitraryRange](index.md)

## 签名

```cangjie role=signature
func arbitraryRange(random: RandomSource, min: UIntNative, max: UIntNative): Generator<UIntNative>
```

返回在范围内生成的值。

适用扩展：[extend UIntNative <: ArbitraryRange<UIntNative>](../extensions/extend-uintnative-arbitraryrange-uintnative.md)。

## 契约

参数：

- random:RandomSource - 随机数源。
- min: UIntNative - 可生成范围的最小值。
- max: UIntNative - 可生成范围的最大值。

返回值：

- Generator\<UIntNative> - 生成器。

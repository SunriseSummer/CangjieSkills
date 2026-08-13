<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-d0ac9a17d8" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<UInt16>
```

获取生成 UInt16 类型随机值生成器。

适用扩展：[extend UInt16 <: Arbitrary<UInt16>](../extensions/extend-uint16-arbitrary-uint16.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<UInt16> - 生成 UInt16 类型随机值生成器。

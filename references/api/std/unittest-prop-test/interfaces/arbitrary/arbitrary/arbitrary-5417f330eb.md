<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-5417f330eb" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<UInt8>
```

获取生成 UInt8 类型随机值生成器。

适用扩展：[extend UInt8 <: Arbitrary<UInt8>](../extensions/extend-uint8-arbitrary-uint8.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<UInt8> - 生成 UInt8 类型随机值生成器。

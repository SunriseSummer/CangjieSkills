<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-3154aea3fd" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<UInt64>
```

获取生成 UInt64 类型随机值生成器。

适用扩展：[extend UInt64 <: Arbitrary<UInt64>](../extensions/extend-uint64-arbitrary-uint64.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<UInt64> - 生成 UInt64 类型随机值生成器。

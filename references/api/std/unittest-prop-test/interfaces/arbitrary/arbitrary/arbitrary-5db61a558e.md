<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-5db61a558e" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<UInt32>
```

获取生成 UInt32 类型随机值生成器。

适用扩展：[extend UInt32 <: Arbitrary<UInt32>](../extensions/extend-uint32-arbitrary-uint32.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<UInt32> - 生成 UInt32 类型随机值生成器。

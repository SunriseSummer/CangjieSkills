<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-5dc6e84939" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Int16>
```

获取生成 T 类型随机值生成器。

适用扩展：[extend Int16 <: Arbitrary<Int16>](../extensions/extend-int16-arbitrary-int16.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Int16> - 生成 Int16 类型随机值生成器。

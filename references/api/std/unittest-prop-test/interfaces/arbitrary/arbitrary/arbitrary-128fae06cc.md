<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-128fae06cc" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Float16>
```

获取生成 T 类型随机值生成器。

适用扩展：[extend Float16 <: Arbitrary<Float16>](../extensions/extend-float16-arbitrary-float16.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Float16> - 生成 Float16 类型随机值生成器。

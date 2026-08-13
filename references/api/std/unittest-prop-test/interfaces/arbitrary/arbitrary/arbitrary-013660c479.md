<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-013660c479" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<String>
```

获取生成 String 类型随机值生成器。

适用扩展：[extend String <: Arbitrary<String>](../extensions/extend-string-arbitrary-string.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<String> - 生成 String 类型随机值生成器。

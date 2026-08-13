<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-59688520fc" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Rune>
```

获取生成 Rune 类型随机值生成器。

适用扩展：[extend Rune <: Arbitrary<Rune>](../extensions/extend-rune-arbitrary-rune.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Rune> - 生成 Rune 类型随机值生成器。

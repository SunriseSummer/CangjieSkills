<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-298c011c0d" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Ordering>
```

获取生成 Ordering 类型随机值生成器。

适用扩展：[extend Ordering <: Arbitrary<Ordering>](../extensions/extend-ordering-arbitrary-ordering.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Ordering> - 生成 Ordering 类型随机值生成器。

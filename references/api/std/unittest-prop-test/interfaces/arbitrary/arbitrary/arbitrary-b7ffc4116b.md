<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-b7ffc4116b" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Unit>
```

获取生成 Unit 类型随机值生成器。

适用扩展：[extend Unit <: Arbitrary<Unit>](../extensions/extend-unit-arbitrary-unit.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Unit> - 生成 Unit 类型随机值生成器。

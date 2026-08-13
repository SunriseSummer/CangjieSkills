<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-314e61c8d0" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Bool>
```

获取生成 T 类型随机值生成器。

适用扩展：[extend Bool <: Arbitrary<Bool>](../extensions/extend-bool-arbitrary-bool.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Bool> - 生成 Bool 类型随机值生成器。

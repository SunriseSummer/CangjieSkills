<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-34b2c7402d" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Float64>
```

获取生成 T 类型随机值生成器。

适用扩展：[extend Float64 <: Arbitrary<Float64>](../extensions/extend-float64-arbitrary-float64.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Float64> - 生成 Float64 类型随机值生成器。

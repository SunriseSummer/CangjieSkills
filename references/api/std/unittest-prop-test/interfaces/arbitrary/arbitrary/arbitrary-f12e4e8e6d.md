<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-f12e4e8e6d" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Float32>
```

获取生成 T 类型随机值生成器。

适用扩展：[extend Float32 <: Arbitrary<Float32>](../extensions/extend-float32-arbitrary-float32.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Float32> - 生成 Float32 类型随机值生成器。

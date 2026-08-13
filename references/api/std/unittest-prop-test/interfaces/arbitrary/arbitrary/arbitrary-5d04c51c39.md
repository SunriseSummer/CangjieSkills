<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-5d04c51c39" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Int32>
```

获取生成 T 类型随机值生成器。

适用扩展：[extend Int32 <: Arbitrary<Int32>](../extensions/extend-int32-arbitrary-int32.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Int32> - 生成 Int32 类型随机值生成器。

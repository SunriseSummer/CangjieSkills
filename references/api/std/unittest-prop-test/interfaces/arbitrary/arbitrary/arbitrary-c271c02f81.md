<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-c271c02f81" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Int64>
```

获取生成 Int64 类型随机值生成器。

适用扩展：[extend Int64 <: Arbitrary<Int64>](../extensions/extend-int64-arbitrary-int64.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Int64> - 生成 Int64 类型随机值生成器。

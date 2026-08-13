<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-203a4f832b" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<T>
```

获取生成 T 类型随机值生成器。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<T> - 生成 T 类型随机值生成器。

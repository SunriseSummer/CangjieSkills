<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-d45cfbf0a5" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Option<T>>
```

获取生成 option<T> 类型随机值生成器。

适用扩展：[extend<T> Option<T> <: Arbitrary<Option<T>> where T <: Arbitrary<T>](../extensions/extend-t-option-t-arbitrary-option-t-where-t-arbitrary-t.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Option\<T>> - 生成 option\<T> 类型随机值生成器。

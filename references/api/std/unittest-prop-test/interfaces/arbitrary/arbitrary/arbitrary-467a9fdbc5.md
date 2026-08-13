<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-467a9fdbc5" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<Array<T>>
```

获取生成 Array<T> 类型随机值生成器。

适用扩展：[extend<T> Array<T> <: Arbitrary<Array<T>> where T <: Arbitrary<T>](../extensions/extend-t-array-t-arbitrary-array-t-where-t-arbitrary-t.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<Array\<T>> - 生成 Array\<T> 类型随机值生成器。

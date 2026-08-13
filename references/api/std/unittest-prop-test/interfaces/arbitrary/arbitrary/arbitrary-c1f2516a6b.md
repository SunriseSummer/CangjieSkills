<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-c1f2516a6b" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<HashSet<T>>
```

获取生成 HashSet<T> 类型随机值生成器。

适用扩展：[extend<T> HashSet<T> <: Arbitrary<HashSet<T>> where T <: Arbitrary<T>](../extensions/extend-t-hashset-t-arbitrary-hashset-t-where-t-arbitrary-t.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<HashSet\<T>> - 生成 HashSet\<T> 类型随机值生成器。

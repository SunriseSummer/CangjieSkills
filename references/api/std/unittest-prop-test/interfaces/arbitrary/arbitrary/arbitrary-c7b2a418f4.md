<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-c7b2a418f4" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<ArrayList<T>>
```

获取生成 ArrayList<T> 类型随机值生成器。

适用扩展：[extend<T> ArrayList<T> <: Arbitrary<ArrayList<T>> where T <: Arbitrary<T>](../extensions/extend-t-arraylist-t-arbitrary-arraylist-t-where-t-arbitrary-t.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<ArrayList\<T>> - 生成 ArrayList\<T> 类型随机值生成器。

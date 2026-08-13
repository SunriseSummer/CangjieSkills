<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.interface.arbitrary.arbitrary.arbitrary-d0eeab1df6" parent="std.unittest.prop_test.interface.arbitrary.arbitrary" -->
# Arbitrary<T>.static func arbitrary(RandomSource)

[← Arbitrary<T>.arbitrary](index.md)

## 签名

```cangjie role=signature
static func arbitrary(random: RandomSource): Generator<UIntNative>
```

获取生成 UIntNative 类型随机值生成器。

适用扩展：[extend UIntNative <: Arbitrary<UIntNative>](../extensions/extend-uintnative-arbitrary-uintnative.md)。

## 契约

参数：

- random: RandomSource - 随机数。

返回值：

- Generator\<UIntNative> - 生成 UIntNative 类型随机值生成器。

<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitrary.extension.extend-t-option-t-arbitrary-option-t-where-t-arbitrary-t" parent="std.unittest.prop_test.interface.arbitrary" -->
# extend<T> Option<T> <: Arbitrary<Option<T>> where T <: Arbitrary<T>

[← Arbitrary<T>](../index.md)

`extend<T> option<T> <: Arbitrary<Option<T>> where T <: Arbitrary<T>`

为 Option<T> 实现了 Arbitrary<Option<T>> 接口，且 T 需实现 Arbitrary<T> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<Option<T>>`](../arbitrary/index.md) | 获取生成 option<T> 类型随机值生成器。 |

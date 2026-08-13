<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitrary.extension.extend-t-hashset-t-arbitrary-hashset-t-where-t-arbitrary-t" parent="std.unittest.prop_test.interface.arbitrary" -->
# extend<T> HashSet<T> <: Arbitrary<HashSet<T>> where T <: Arbitrary<T>

[← Arbitrary<T>](../index.md)

`extend<T> HashSet<T> <: Arbitrary<HashSet<T>> where T <: Arbitrary<T>`

为 HashSet<T> 实现了 Arbitrary 接口，且 T 需实现 Arbitrary<T> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<HashSet<T>>`](../arbitrary/index.md) | 获取生成 HashSet<T> 类型随机值生成器。 |

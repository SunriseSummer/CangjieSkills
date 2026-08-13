<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitrary.extension.extend-ordering-arbitrary-ordering" parent="std.unittest.prop_test.interface.arbitrary" -->
# extend Ordering <: Arbitrary<Ordering>

[← Arbitrary<T>](../index.md)

`extend Ordering <: Arbitrary<Ordering>`

为 Ordering 实现了 Arbitrary<T> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<Ordering>`](../arbitrary/index.md) | 获取生成 Ordering 类型随机值生成器。 |

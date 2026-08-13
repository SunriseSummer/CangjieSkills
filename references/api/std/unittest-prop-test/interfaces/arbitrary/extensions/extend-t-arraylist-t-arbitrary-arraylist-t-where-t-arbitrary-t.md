<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitrary.extension.extend-t-arraylist-t-arbitrary-arraylist-t-where-t-arbitrary-t" parent="std.unittest.prop_test.interface.arbitrary" -->
# extend<T> ArrayList<T> <: Arbitrary<ArrayList<T>> where T <: Arbitrary<T>

[← Arbitrary<T>](../index.md)

`extend<T> ArrayList<T> <: Arbitrary<ArrayList<T>> where T <: Arbitrary<T>`

为 ArrayList<T> 实现了 Arbitrary 接口，且 T 需实现 Arbitrary<T> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<ArrayList<T>>`](../arbitrary/index.md) | 获取生成 ArrayList<T> 类型随机值生成器。 |

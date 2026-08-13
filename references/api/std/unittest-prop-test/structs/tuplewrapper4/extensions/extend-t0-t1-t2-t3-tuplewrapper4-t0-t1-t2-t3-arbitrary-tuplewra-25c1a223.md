<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.struct.tuplewrapper4.extension.extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-arbitrary-tuplewra-25c1a223" parent="std.unittest.prop_test.struct.tuplewrapper4" -->
# extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3><: Arbitrary<TupleWrapper4<T0, T1, T2, T3>> where where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>,T3 <: Arbitrary<T3>

[← TupleWrapper4<T0, T1, T2, T3>](../index.md)

`extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3><: Arbitrary<TupleWrapper4<T0, T1, T2, T3>> where where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>,T3 <: Arbitrary<T3>`

为 TupleWrapper4 扩展 Arbitrary 实现。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<TupleWrapper2<T0, T1, T2, T3>>`](../arbitrary.md) | 获取生成 TupleWrapper4<T0, T1, T2, T3> 类型随机值生成器。 |

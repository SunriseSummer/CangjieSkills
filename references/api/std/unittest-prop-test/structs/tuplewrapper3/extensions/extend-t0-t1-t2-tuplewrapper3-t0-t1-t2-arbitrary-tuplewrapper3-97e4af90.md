<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.struct.tuplewrapper3.extension.extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-arbitrary-tuplewrapper3-97e4af90" parent="std.unittest.prop_test.struct.tuplewrapper3" -->
# extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Arbitrary<TupleWrapper3<T0, T1, T2>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>

[← TupleWrapper3<T0, T1, T2>](../index.md)

`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Arbitrary<TupleWrapper3<T0, T1, T2>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>`

为 TupleWrapper3 扩展 Arbitrary 实现。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<TupleWrapper3<T0, T1, T2>>`](../arbitrary.md) | 获取生成 TupleWrapper3<T0, T1, T2> 类型随机值生成器。 |

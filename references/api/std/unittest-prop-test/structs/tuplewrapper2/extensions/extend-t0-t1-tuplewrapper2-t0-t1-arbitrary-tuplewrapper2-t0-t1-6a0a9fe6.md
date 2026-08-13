<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.struct.tuplewrapper2.extension.extend-t0-t1-tuplewrapper2-t0-t1-arbitrary-tuplewrapper2-t0-t1-6a0a9fe6" parent="std.unittest.prop_test.struct.tuplewrapper2" -->
# extend<T0, T1> TupleWrapper2<T0, T1> <: Arbitrary<TupleWrapper2<T0, T1>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>

[← TupleWrapper2<T0, T1>](../index.md)

`extend<T0, T1> TupleWrapper2<T0, T1> <: Arbitrary<TupleWrapper2<T0, T1>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>`

为 TupleWrapper2 扩展 Arbitrary 实现。

## 成员

| 签名 | 功能 |
|---|---|
| [`static arbitrary(random: RandomSource): Generator<TupleWrapper2<T0, T1>>`](../arbitrary.md) | 获取生成 TupleWrapper2<T0, T1> 类型随机值生成器。 |

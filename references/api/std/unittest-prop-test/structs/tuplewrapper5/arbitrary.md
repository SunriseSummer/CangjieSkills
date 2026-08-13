<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper5.arbitrary" parent="std.unittest.prop_test.struct.tuplewrapper5.extension.extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-arbitrary-tu-d7537ae5" -->
# TupleWrapper5<T0, T1, T2, T3, T4>.arbitrary

[← extend<T0, T1, T2, T3, T4> TupleWrapper5<T0, T1, T2, T3, T4> <: Arbitrary<TupleWrapper2<T0, T1, T2, T3, T4>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>,T3 <: Arbitrary<T3>,T4 <: Arbitrary<T4>](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-arbitrary-tu-d7537ae5.md)

## 签名

```cangjie role=signature
public static func arbitrary(random: RandomSource): Generator<TupleWrapper5<T0, T1, T2, T3, T4>>
```

获取生成 TupleWrapper5<T0, T1, T2, T3, T4> 类型随机值生成器。

## 契约

返回值：

- Generator\[TupleWrapper5](#struct-tuplewrapper5t0-t1-t2-t3-t4)\<T0, T1, T2, T3, T4>> - 生成器。

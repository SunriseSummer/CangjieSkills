<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper3.arbitrary" parent="std.unittest.prop_test.struct.tuplewrapper3.extension.extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-arbitrary-tuplewrapper3-97e4af90" -->
# TupleWrapper3<T0, T1, T2>.arbitrary

[← extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Arbitrary<TupleWrapper3<T0, T1, T2>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>](extensions/extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-arbitrary-tuplewrapper3-97e4af90.md)

## 签名

```cangjie role=signature
public static func arbitrary(random: RandomSource): Generator<TupleWrapper3<T0, T1, T2>>
```

获取生成 TupleWrapper3<T0, T1, T2> 类型随机值生成器。

## 契约

返回值：

- Generator\<TupleWrapper3\<T0, T1, T2>> - 生成器。

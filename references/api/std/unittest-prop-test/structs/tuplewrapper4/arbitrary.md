<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper4.arbitrary" parent="std.unittest.prop_test.struct.tuplewrapper4.extension.extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-arbitrary-tuplewra-25c1a223" -->
# TupleWrapper4<T0, T1, T2, T3>.arbitrary

[← extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3><: Arbitrary<TupleWrapper4<T0, T1, T2, T3>> where where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>,T3 <: Arbitrary<T3>](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-arbitrary-tuplewra-25c1a223.md)

## 签名

```cangjie role=signature
public static func arbitrary(random: RandomSource): Generator<TupleWrapper2<T0, T1, T2, T3>>
```

获取生成 TupleWrapper4<T0, T1, T2, T3> 类型随机值生成器。

## 契约

返回值：

- Generator\<TupleWrapper4\<T0, T1, T2, T3>> - 生成器。

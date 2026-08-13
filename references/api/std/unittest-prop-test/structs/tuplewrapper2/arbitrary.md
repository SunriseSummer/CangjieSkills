<!-- cj-doc kind="api-member" level="7" id="std.unittest.prop_test.struct.tuplewrapper2.arbitrary" parent="std.unittest.prop_test.struct.tuplewrapper2.extension.extend-t0-t1-tuplewrapper2-t0-t1-arbitrary-tuplewrapper2-t0-t1-6a0a9fe6" -->
# TupleWrapper2<T0, T1>.arbitrary

[← extend<T0, T1> TupleWrapper2<T0, T1> <: Arbitrary<TupleWrapper2<T0, T1>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>](extensions/extend-t0-t1-tuplewrapper2-t0-t1-arbitrary-tuplewrapper2-t0-t1-6a0a9fe6.md)

## 签名

```cangjie role=signature
public static func arbitrary(random: RandomSource): Generator<TupleWrapper2<T0, T1>>
```

获取生成 TupleWrapper2<T0, T1> 类型随机值生成器。

## 契约

返回值：

- Generator\<TupleWrapper2\<T0, T1>> - 生成器。

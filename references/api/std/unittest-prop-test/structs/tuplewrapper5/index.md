<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.struct.tuplewrapper5" parent="std.unittest.prop_test" -->
# TupleWrapper5<T0, T1, T2, T3, T4>

[← std.unittest.prop_test](../../index.md)

`TupleWrapper5<T0, T1, T2, T3, T4>`

将闭包封装为结构体。

## 方法

| 签名 | 功能 |
|---|---|
| [`TupleWrapper5(public let tuple: (T0, T1, T2, T3, T4))`](tuplewrapper5-t0-t1-t2-t3-t4.md) | TupleWrapper5 构造器。 |
| [`apply<R>(f: (T0, T1, T2, T3, T4) -> R): R`](apply.md) | 执行闭包函数。 |
| [`override shrink(): Iterable<TupleWrapper5<T0, T1, T2, T3, T4>>`](shrink.md) | 缩减元组。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`tuple: (T0, T1, T2, T3, T4)`](field-tuple.md) | 元组自身。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T0, T1, T2, T3, T4> TupleWrapper5<T0, T1, T2, T3, T4> <: ToString`](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-tostring.md) | 为 TupleWrapper5 扩展 ToString 实现。 |
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Equatable<TupleWrapper3<T0, T1, T2>>`](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-equatable-tu-48f2fa5b.md) | 为 TupleWrapper5 扩展 Equatable 实现。 |
| [`extend<T0, T1, T2, T3, T4> TupleWrapper5<T0, T1, T2, T3, T4> <: IndexAccess`](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-indexaccess.md) | 为 TupleWrapper5 扩展 IndexAccess 实现。 |
| [`extend<T0, T1, T2, T3, T4> TupleWrapper5<T0, T1, T2, T3, T4> <: Arbitrary<TupleWrapper2<T0, T1, T2, T3, T4>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>,T3 <: Arbitrary<T3>,T4 <: Arbitrary<T4>`](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-arbitrary-tu-d7537ae5.md) | 为 TupleWrapper5 扩展 Arbitrary 实现。 |
| [`extend<T0, T1, T2, T3, T4> TupleWrapper5<T0, T1, T2, T3, T4> <: Shrink<TupleWrapper5<T0, T1, T2, T3, T4>> where T0 <: Shrink<T0>, T1 <: Shrink<T1>, T2 <: Shrink<T2>, T3 <: Shrink<T3>, T4 <: Shrink<T4>`](extensions/extend-t0-t1-t2-t3-t4-tuplewrapper5-t0-t1-t2-t3-t4-shrink-tuple-4e12193c.md) | 为 TupleWrapper5<T0, T1, T2, T3, T4> 提供 Shrink<TupleWrapper5<T0, T1, T2, T3, T4>> 扩展实现。 |

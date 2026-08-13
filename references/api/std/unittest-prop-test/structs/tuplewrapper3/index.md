<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.struct.tuplewrapper3" parent="std.unittest.prop_test" -->
# TupleWrapper3<T0, T1, T2>

[← std.unittest.prop_test](../../index.md)

`TupleWrapper3<T0, T1, T2>`

将闭包封装为结构体。

## 方法

| 签名 | 功能 |
|---|---|
| [`TupleWrapper3(public let tuple: (T0, T1, T2))`](tuplewrapper3-t0-t1-t2.md) | TupleWrapper3 构造器。 |
| [`apply<R>(f: (T0, T1,T2) -> R): R`](apply.md) | 执行闭包函数。 |
| [`override shrink(): Iterable<TupleWrapper3<T0, T1, T2>>`](shrink.md) | 缩减元组。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`tuple: (T0, T1, T2)`](field-tuple.md) | 元组自身。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: ToString`](extensions/extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-tostring.md) | 为 TupleWrapper3 扩展 ToString 实现。 |
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Equatable<TupleWrapper3<T0, T1, T2>>`](extensions/extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-equatable-tuplewrapper3-t0-t1-t2.md) | 为 TupleWrapper3 扩展 Equatable 实现。 |
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: IndexAccess`](extensions/extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-indexaccess.md) | 为 TupleWrapper3 扩展 IndexAccess 实现。 |
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Arbitrary<TupleWrapper3<T0, T1, T2>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>`](extensions/extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-arbitrary-tuplewrapper3-97e4af90.md) | 为 TupleWrapper3 扩展 Arbitrary 实现。 |
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Shrink<TupleWrapper3<T0, T1, T2>> where T0 <: Shrink<T0>, T1 <: Shrink<T1>, T2 <: Shrink<T2>`](extensions/extend-t0-t1-t2-tuplewrapper3-t0-t1-t2-shrink-tuplewrapper3-t0-23e14871.md) | 为 TupleWrapper3<T0, T1, T2> 提供 Shrink<TupleWrapper3<T0, T1, T2>> 扩展实现。 |

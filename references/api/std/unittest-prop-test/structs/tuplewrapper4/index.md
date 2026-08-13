<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.struct.tuplewrapper4" parent="std.unittest.prop_test" -->
# TupleWrapper4<T0, T1, T2, T3>

[← std.unittest.prop_test](../../index.md)

`TupleWrapper4<T0, T1, T2, T3>`

将闭包封装为结构体。

## 方法

| 签名 | 功能 |
|---|---|
| [`TupleWrapper4(public let tuple: (T0, T1, T2, T3))`](tuplewrapper4-t0-t1-t2-t3.md) | TupleWrapper4 构造器。 |
| [`apply<R>(f: (T0, T1, T2, T3) -> R): R`](apply.md) | 执行闭包函数。 |
| [`override shrink(): Iterable<TupleWrapper4<T0, T1, T2, T3>>`](shrink.md) | 缩减元组。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`tuple: (T0, T1, T2, T3)`](field-tuple.md) | 元组自身。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3> <: ToString`](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-tostring.md) | 为 TupleWrapper4 扩展 ToString 实现。 |
| [`extend<T0, T1, T2> TupleWrapper3<T0, T1, T2> <: Equatable<TupleWrapper3<T0, T1, T2>>`](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-equatable-tuplewra-1dcd6196.md) | 为 TupleWrapper4 扩展 Equatable 实现。 |
| [`extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3> <: IndexAccess`](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-indexaccess.md) | 为 TupleWrapper4 扩展 IndexAccess 实现。 |
| [`extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3><: Arbitrary<TupleWrapper4<T0, T1, T2, T3>> where where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>,T2 <: Arbitrary<T2>,T3 <: Arbitrary<T3>`](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-arbitrary-tuplewra-25c1a223.md) | 为 TupleWrapper4 扩展 Arbitrary 实现。 |
| [`extend<T0, T1, T2, T3> TupleWrapper4<T0, T1, T2, T3> <: Shrink<TupleWrapper4<T0, T1, T2, T3>> where T0 <: Shrink<T0>, T1 <: Shrink<T1>, T2 <: Shrink<T2>, T3 <: Shrink<T3>`](extensions/extend-t0-t1-t2-t3-tuplewrapper4-t0-t1-t2-t3-shrink-tuplewrappe-ef08b361.md) | 为 TupleWrapper4<T0, T1, T2, T3> 提供 Shrink<TupleWrapper4<T0, T1, T2, T3>> 扩展实现。 |

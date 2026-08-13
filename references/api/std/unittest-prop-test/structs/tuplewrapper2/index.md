<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.struct.tuplewrapper2" parent="std.unittest.prop_test" -->
# TupleWrapper2<T0, T1>

[← std.unittest.prop_test](../../index.md)

`TupleWrapper2<T0, T1>`

将闭包封装为结构体。

## 方法

| 签名 | 功能 |
|---|---|
| [`TupleWrapper2(public let tuple: (T0, T1))`](tuplewrapper2-t0-t1.md) | TupleWrapper2 构造器。 |
| [`apply<R>(f: (T0, T1) -> R): R`](apply.md) | 执行闭包函数。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`tuple: (T0, T1)`](field-tuple.md) | 元组自身。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T0, T1> TupleWrapper2<T0, T1> <: ToString`](extensions/extend-t0-t1-tuplewrapper2-t0-t1-tostring.md) | 为 TupleWrapper2 扩展 ToString 实现。 |
| [`extend<T0, T1> TupleWrapper2<T0, T1> <: Equatable<TupleWrapper2<T0, T1>>`](extensions/extend-t0-t1-tuplewrapper2-t0-t1-equatable-tuplewrapper2-t0-t1.md) | 为 TupleWrapper2 扩展 Equatable 实现。 |
| [`extend<T0, T1> TupleWrapper2<T0, T1> <: IndexAccess`](extensions/extend-t0-t1-tuplewrapper2-t0-t1-indexaccess.md) | 为 TupleWrapper2 扩展 IndexAccess 实现。 |
| [`extend<T0, T1> TupleWrapper2<T0, T1> <: Arbitrary<TupleWrapper2<T0, T1>> where T0 <: Arbitrary<T0>,T1 <: Arbitrary<T1>`](extensions/extend-t0-t1-tuplewrapper2-t0-t1-arbitrary-tuplewrapper2-t0-t1-6a0a9fe6.md) | 为 TupleWrapper2 扩展 Arbitrary 实现。 |
| [`extend<T0, T1> TupleWrapper2<T0, T1> <: Shrink<TupleWrapper2<T0, T1>> where T0 <: Shrink<T0>, T1 <: Shrink<T1>`](extensions/extend-t0-t1-tuplewrapper2-t0-t1-shrink-tuplewrapper2-t0-t1-whe-aca344e1.md) | 为 TupleWrapper2<T0, T1> 提供 Shrink<TupleWrapper2<T0, T1>> 扩展实现。 |

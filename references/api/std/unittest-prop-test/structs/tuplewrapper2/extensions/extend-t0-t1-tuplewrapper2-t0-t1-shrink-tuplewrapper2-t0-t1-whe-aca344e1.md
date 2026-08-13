<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.struct.tuplewrapper2.extension.extend-t0-t1-tuplewrapper2-t0-t1-shrink-tuplewrapper2-t0-t1-whe-aca344e1" parent="std.unittest.prop_test.struct.tuplewrapper2" -->
# extend<T0, T1> TupleWrapper2<T0, T1> <: Shrink<TupleWrapper2<T0, T1>> where T0 <: Shrink<T0>,T1 <: Shrink<T1>

[← TupleWrapper2<T0, T1>](../index.md)

`extend<T0, T1> TupleWrapper2<T0, T1> <: Shrink<TupleWrapper2<T0, T1>> where T0 <: Shrink<T0>, T1 <: Shrink<T1>`

为 TupleWrapper2<T0, T1> 提供 Shrink<TupleWrapper2<T0, T1>> 扩展实现。

## 成员

| 签名 | 功能 |
|---|---|
| [`override shrink(): Iterable<TupleWrapper2<T0, T1>>`](../shrink.md) | 缩减元组。 |

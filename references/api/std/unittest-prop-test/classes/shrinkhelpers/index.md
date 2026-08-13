<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.shrinkhelpers" parent="std.unittest.prop_test" -->
# ShrinkHelpers

[← std.unittest.prop_test](../../index.md)

`ShrinkHelpers`

提供对元组实现缩减迭代器的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`static shrinkTuple<T0, T1>( tuple: (T0, T1), t0: Iterable<T0>, t1: Iterable<T1> ): Iterable<(T0, T1)>`](shrinktuple.md) | 实现元组的缩减迭代器。 |
| [`static shrinkTuple<T0, T1, T2>( tuple: (T0, T1, T2), t0: Iterable<T0>, t1: Iterable<T1>, t2: Iterable<T2> ): Iterable<(T0, T1, T2)>`](shrinktuple.md) | 实现元组的缩减迭代器。 |
| [`static shrinkTuple<T0, T1, T2, T3>( tuple: (T0, T1, T2, T3), t0: Iterable<T0>, t1: Iterable<T1>, t2: Iterable<T2>, t3: Iterable<T3> ): Iterable<(T0, T1, T2, T3)>`](shrinktuple.md) | 实现元组的缩减迭代器。 |
| [`static shrinkTuple<T0, T1, T2, T3, T4>( tuple: (T0, T1, T2, T3, T4), t0: Iterable<T0>, t1: Iterable<T1>, t2: Iterable<T2>, t3: Iterable<T3>, t4: Iterable<T4> ): Iterable<(T0, T1, T2, T3, T4)>`](shrinktuple.md) | 实现元组的缩减迭代器。 |
| [`static mix<T>(iterables: Array<Iterable<T>>): Iterable<T>`](mix.md) | 将迭代器列表混合为一个迭代器。 |

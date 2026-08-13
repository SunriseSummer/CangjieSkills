<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.generators" parent="std.unittest.prop_test" -->
# Generators

[← std.unittest.prop_test](../../index.md)

`Generators`

包含辅助函数的类，可帮助开发人员编写自己的生成器。

## 方法

| 签名 | 功能 |
|---|---|
| [`static generate<T>(l: T, r: T, body: (T, T) -> T): Generator<T>`](generate.md) | 通过重复调用函数生成值的生成器，范围为 [l, r]。 |
| [`static generate<T>(body: () -> T): Generator<T>`](generate.md) | 通过重复调用函数生成值的生成器。 |
| [`static iterable<T>(random: RandomSource, collection: Array<T>): Generator<T>`](iterable.md) | 通过从数组中随机选取来生成值的生成器。 |
| [`static lookup<T>(random: RandomSource): Generator<T> where T <: Arbitrary<T>`](lookup.md) | 通过 T 的 Arbitrary 实例提供的生成器。 |
| [`static mapped<T, R>(random: RandomSource, body: (T) -> R): Generator<R> where T <: Arbitrary<T>`](mapped.md) | 获取 T 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。 |
| [`static mapped<T1, T2, R>(random: RandomSource, body: (T1, T2) -> R): Generator<R> where T1 <: Arbitrary<T1>, T2 <: Arbitrary<T2>`](mapped.md) | 获取 T1，T2 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。 |
| [`static mapped<T1, T2, T3, R>(random: RandomSource, body: (T1, T2, T3) -> R): Generator<R> where T1 <: Arbitrary<T1>, T2 <: Arbitrary<T2>, T3 <: Arbitrary<T3>`](mapped.md) | 获取 T1,T2,T3 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。 |
| [`static mapped<T1, T2, T3, T4, R>(random: RandomSource, body: (T1, T2, T3, T4) -> R): Generator<R> where T1 <: Arbitrary<T1>, T2 <: Arbitrary<T2>, T3 <: Arbitrary<T3>, T4 <: Arbitrary<T4>`](mapped.md) | 获取 T1,T2,T3,T4 的 Arbitrary 实例提供的生成器，并使用函数体生成 R 类型的值。 |
| [`static pick<T>(random: RandomSource, variants: Array<Generator<T>>): Generator<T>`](pick.md) | 通过从生成器数组中随机选取来生成值的生成器。 |
| [`static single<T>(value: T): Generator<T>`](single.md) | 生成器始终返回同一个值。 |
| [`static weighted<T>(random: RandomSource, variants: Array<(UInt64, Generator<T>)>): Generator<T>`](weighted.md) | 通过从成对数组（权重、生成器）中随机选取来生成值的生成器。 |

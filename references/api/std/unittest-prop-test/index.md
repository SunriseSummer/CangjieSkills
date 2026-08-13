<!-- cj-doc kind="api-package" level="4" id="std.unittest.prop_test" parent="api.std" -->
# std.unittest.prop_test

[← std 包索引](../index.md)

单元测试框架提供了参数化测试所需的类型和方法。

包路径：`std.unittest.prop_test`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Generators`](classes/generators/index.md) | 包含辅助函数的类，可帮助开发人员编写自己的生成器。 |
| [`RandomDataProvider<T> <: DataProvider<T> where T <: Arbitrary<T>`](classes/randomdataprovider/index.md) | 使用随机数据生成的 DataProvider 接口的实现。 |
| [`RandomDataProviderRange<T> <: DataProvider<T> where T <: ArbitraryRange<T>`](classes/randomdataproviderrange/index.md) | 可按照给定范围生成的数据提供器。 |
| [`RandomDataShrinker<T> <: DataShrinker<T>`](classes/randomdatashrinker/index.md) | 使用随机数据生成的 DataShrinker 接口的实现。 |
| [`RandomDataShrinkerRange<T> <: DataShrinker<T> where T <: Comparable<T>`](classes/randomdatashrinkerrange/index.md) | 可按照给定范围生成的数据缩减器。 |
| [`RandomDataStrategy<T> <: DataStrategy<T> where T <: Arbitrary<T>`](classes/randomdatastrategy/index.md) | 使用随机数据生成的 DataStrategy 接口的实现。 |
| [`RandomDataStrategyRange<T> <: DataStrategy<T> where T <: ArbitraryRange<T>`](classes/randomdatastrategyrange/index.md) | 可按照给定范围生成的数据策略器。 |
| [`LazySeq<T> <: Iterable<T>`](classes/lazyseq/index.md) | 延迟计算的 T 类型值序列。 |
| [`ShrinkHelpers`](classes/shrinkhelpers/index.md) | 提供对元组实现缩减迭代器的方法。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`ArbitraryRange<T> where T <: Arbitrary<T> & Comparable<T>`](interfaces/arbitraryrange/index.md) | 接口为不同类型提供可以在一定范围内生成值的方法。 |
| [`Arbitrary<T>`](interfaces/arbitrary/index.md) | 生成 T 类型随机值的接口。 |
| [`Generator<T>`](interfaces/generator/index.md) | 生成器生成 T 类型的值。 |
| [`IndexAccess`](interfaces/indexaccess/index.md) | 通过索引访问元组元素的实用程序接口。 |
| [`RandomSource`](interfaces/randomsource/index.md) | 提供 Arbitrary 所需的随机生成基础类型数据的能力。 |
| [`Shrink<T>`](interfaces/shrink/index.md) | 将 T 类型的值缩减到多个“更小”的值。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`Function0Wrapper<R>`](structs/function0wrapper/index.md) | 将闭包封装为结构体。 |
| [`KeyRandom <: KeyFor<RandomSource>`](structs/keyrandom/index.md) | 用于在 Configuration 创建键值。 |
| [`TupleWrapper2<T0, T1>`](structs/tuplewrapper2/index.md) | 将闭包封装为结构体。 |
| [`TupleWrapper3<T0, T1, T2>`](structs/tuplewrapper3/index.md) | 将闭包封装为结构体。 |
| [`TupleWrapper4<T0, T1, T2, T3>`](structs/tuplewrapper4/index.md) | 将闭包封装为结构体。 |
| [`TupleWrapper5<T0, T1, T2, T3, T4>`](structs/tuplewrapper5/index.md) | 将闭包封装为结构体。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`emptyIterable<T>(): Iterable<T>`](functions/emptyiterable-t.md) | 创建一个空的迭代器。 |
| [`random<T>(): RandomDataStrategy<T> where T <: Arbitrary<T>`](functions/random-t-where-t-arbitrary-t.md) | 该函数生成 T 类型的随机数据，其中 T 必须实现接口 Arbitrary<T> 。 |
| [`randomInRange<T>(min!: Option<T> = None, max!: Option<T> = None): RandomDataStrategyRange<T> where T <: ArbitraryRange<T>`](functions/randominrange-t-option-t-option-t.md) | 创建一个 RandomDataStrategyRange<T> |

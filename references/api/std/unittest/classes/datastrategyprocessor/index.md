<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.datastrategyprocessor" parent="std.unittest" -->
# DataStrategyProcessor<T>

[← std.unittest](../../index.md)

`abstract sealed DataStrategyProcessor<T>`

所有 DataStrategy 组件的基类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`protected isInfinite: Bool`](prop-isinfinite.md) | 获取该策略是否为无限。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`intoBenchmark( caseName!: String, configuration!: Configuration, doRun!: (T, Int64, Int64) -> Float64 ): Benchmark`](intobenchmark.md) | 宏生成的代码使用的辅助函数。 |
| [`intoUnitTestCase( caseName!: String, configuration!: Configuration, doRun!: (T) -> Unit ): UnitTestCase`](intounittestcase.md) | 宏生成的代码使用的辅助函数。 |
| [`protected lastItemInfo(): Array<InputParameter>`](lastiteminfo.md) | 获取上一个处理条目的信息。 |
| [`protected lastItem(configuration: Configuration): T`](lastitem.md) | 获取上一个处理条目。 |
| [`protected provide(configuration: Configuration): Iterable<T>`](provide.md) | 生成依据配置信息和数据策略生成的数据迭代器。 |
| [`protected shrinkLastItem(configuration: Configuration, engine: LazyCyclicNode): Iterable<T>`](shrinklastitem.md) | 收缩上一个条目。 |
| [`static start(s: DataStrategy<T>, name: String): SimpleProcessor<T>`](start.md) | DataStrategy 的组合和映射的起点。 |
| [`static start<U>( f: () -> DataStrategy<U>, name: String ): DataStrategyProcessor<U> where U <: BenchInputProvider < T >`](start.md) | DataStrategy 的组合和映射的起点。 |
| [`static start( f: () -> DataStrategy<T>, name: String, x!: Int64 = 0 ): SimpleProcessor<T>`](start.md) | DataStrategy 的组合和映射的起点。 |
| [`static start(f: () -> DataStrategyProcessor<T>, name: String): DataStrategyProcessor<T>`](start.md) | DataStrategy 的组合和映射的起点。 |
| [`static start<U>( f: () -> DataStrategyProcessor<U>, name: String, x!: Int64 = 0 ): DataStrategyProcessor<U> where U <: BenchInputProvider<T>`](start.md) | DataStrategy 的组合和映射的起点。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend <T> DataStrategyProcessor<T>`](extensions/extend-t-datastrategyprocessor-t.md) | 声明该类型的扩展实现及其约束。 |

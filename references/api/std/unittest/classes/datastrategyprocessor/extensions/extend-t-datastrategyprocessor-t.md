<!-- cj-doc kind="api-extension" level="6" id="std.unittest.class.datastrategyprocessor.extension.extend-t-datastrategyprocessor-t" parent="std.unittest.class.datastrategyprocessor" -->
# extend <T> DataStrategyProcessor<T>

[← DataStrategyProcessor<T>](../index.md)

`extend <T> DataStrategyProcessor<T>`

声明该类型的扩展实现及其约束。

## 成员

| 签名 | 功能 |
|---|---|
| [`map<R>(f: (T) -> R): MapProcessor<T, R>`](../map.md) | 简单地将 `f` 应用于原始数据策略的每个项目。 |
| [`mapWithConfig<R>(f: (T, Configuration) -> R): MapProcessor<T, R>`](../mapwithconfig.md) | 可以访问当前的 Configuration ，只需将 `f` 应用于原始数据策略的每个项目。 |
| [`flatMap<R>(f: (T) -> DataProvider<R>): FlatMapProcessor<T, R>`](../flatmap.md) | 简单地将 `f` 应用于原始数据策略的每个项目，然后展平结果。 |
| [`flatMapStrategy<R>(f: (T) -> DataStrategy<R>): FlatMapStrategyProcessor<T, R>`](../flatmapstrategy.md) | 简单地将 `f` 应用于原始数据策略的每个项目，然后展平结果。 |
| [`product<R>(p: DataStrategyProcessor<R>): CartesianProductProcessor<T, R>`](../product.md) | 笛卡尔积组合器创建包含原始策略中元素的所有可能排列的数据策略。 |
| [`productWithUnit<P>(p: P): MapProcessor<(T, Unit), T> where P <: DataStrategyProcessor<Unit>`](../productwithunit.md) | DataStrategyProcessor 的便捷适配器。 |

<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.randomdatastrategyrange" parent="std.unittest.prop_test" -->
# RandomDataStrategyRange<T>

[← std.unittest.prop_test](../../index.md)

`RandomDataStrategyRange<T> <: DataStrategy<T> where T <: ArbitraryRange<T>`

可按照给定范围生成的数据策略器。

## 方法

| 签名 | 功能 |
|---|---|
| [`override provider(configuration: Configuration): RandomDataProviderRange<T>`](provider.md) | 获取随机数据的提供者。 |
| [`override shrinker(_: Configuration): RandomDataShrinkerRange<T>`](shrinker.md) | 获取随机数据的缩减器。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`isInfinite: Bool`](prop-isinfinite.md) | 当该策略为无穷尽时，值为 true, 否则为 false。 |

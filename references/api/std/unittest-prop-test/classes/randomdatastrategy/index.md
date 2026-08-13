<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.randomdatastrategy" parent="std.unittest.prop_test" -->
# RandomDataStrategy<T>

[← std.unittest.prop_test](../../index.md)

`RandomDataStrategy<T> <: DataStrategy<T> where T <: Arbitrary<T>`

使用随机数据生成的 DataStrategy 接口的实现。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`override isInfinite: Bool`](prop-isinfinite.md) | 当该策略为无穷尽时，值为 true, 否则为 false。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override provider(configuration: Configuration): RandomDataProvider<T>`](provider.md) | 获取随机数据的提供者。 |
| [`override shrinker(_: Configuration): RandomDataShrinker<T>`](shrinker.md) | 获取随机数据的缩减器。 |

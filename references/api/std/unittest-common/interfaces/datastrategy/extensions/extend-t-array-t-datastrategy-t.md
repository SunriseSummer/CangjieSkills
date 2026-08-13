<!-- cj-doc kind="api-extension" level="6" id="std.unittest.common.interface.datastrategy.extension.extend-t-array-t-datastrategy-t" parent="std.unittest.common.interface.datastrategy" -->
# extend<T> Array<T> <: DataStrategy<T>

[← DataStrategy](../index.md)

`extend<T> Array<T> <: DataStrategy<T>`

对 Array<T> 进行扩展。

## 成员

| 签名 | 功能 |
|---|---|
| [`isInfinite: Bool`](../prop-isinfinite.md) | 是否无法穷尽。 |
| [`provider(configuration: Configuration): DataProvider<T>`](../provider.md) | 获取提供测试数据组件。 |
| [`shrinker(configuration: Configuration): DataShrinker<T>`](../shrinker.md) | 获取缩减测试数据的组件。 |

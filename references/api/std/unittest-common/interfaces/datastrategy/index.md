<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.interface.datastrategy" parent="std.unittest.common" -->
# DataStrategy

[← std.unittest.common](../../index.md)

`DataStrategy<T>`

为参数化测试提供数据的策略，T 指定该策略操作的数据类型。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`isInfinite: Bool`](prop-isinfinite.md) | 是否无法穷尽。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`provider(configuration: Configuration): DataProvider<T>`](provider.md) | 获取提供测试数据组件。 |
| [`shrinker(configuration: Configuration): DataShrinker<T>`](shrinker.md) | 获取缩减测试数据的组件。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Array<T> <: DataStrategy<T>`](extensions/extend-t-array-t-datastrategy-t.md) | 对 Array<T> 进行扩展。 |
| [`extend<T> Range<T> <: DataStrategy<T>`](extensions/extend-t-range-t-datastrategy-t.md) | 对 Range<T> 进行扩展。 |

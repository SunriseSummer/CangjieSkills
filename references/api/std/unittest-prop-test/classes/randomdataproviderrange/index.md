<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.randomdataproviderrange" parent="std.unittest.prop_test" -->
# RandomDataProviderRange<T>

[← std.unittest.prop_test](../../index.md)

`RandomDataProviderRange<T> <: DataProvider<T> where T <: ArbitraryRange<T>`

可按照给定范围生成的数据提供器。

## 方法

| 签名 | 功能 |
|---|---|
| [`RandomDataProviderRange(configuration: Configuration, min: T, max: T)`](randomdataproviderrange-configuration-t-t.md) | 构造器。 |
| [`override provide(): Iterable<T>`](provide.md) | 提供随机化生成的数据。 |

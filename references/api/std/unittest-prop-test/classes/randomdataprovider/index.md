<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.class.randomdataprovider" parent="std.unittest.prop_test" -->
# RandomDataProvider<T>

[← std.unittest.prop_test](../../index.md)

`RandomDataProvider<T> <: DataProvider<T> where T <: Arbitrary<T>`

使用随机数据生成的 DataProvider 接口的实现。

## 方法

| 签名 | 功能 |
|---|---|
| [`RandomDataProvider(private let configuration: Configuration)`](randomdataprovider-configuration.md) | 构造一个随机数据提供者 RandomDataProvider 的对象。 |
| [`override provide(): Iterable<T>`](provide.md) | 提供随机化生成的数据。 |

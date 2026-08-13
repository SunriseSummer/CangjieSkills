<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.benchmark" parent="std.unittest" -->
# Benchmark

[← std.unittest](../../index.md)

`Benchmark`

该类提供创建和运行单个性能测试用例的方法。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`name: String`](prop-name.md) | 获取用例名称。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`run(): BenchReport`](run.md) | 运行该性能用例。 |
| [`static create( name: String, configuration!: Configuration = Configuration(), measurement!: Measurement = TimeNow(), body!: () -> Unit ): Benchmark`](create.md) | 创建一个性能测试用例对象。 |
| [`static createParameterized<T>( name: String, strategy: DataStrategy<T>, configuration!: Configuration = Configuration(), measurement!: Measurement = TimeNow(), body!: (T) -> Unit ): Benchmark`](createparameterized.md) | 创建一个参数化的性能测试用例对象。 |
| [`static createParameterized<T>( name: String, strategy: DataStrategyProcessor<T>, configuration!: Configuration = Configuration(), measurement!: Measurement = TimeNow(), body!: (T) -> Unit ): Benchmark`](createparameterized.md) | 创建一个参数化的性能测试用例对象。 |

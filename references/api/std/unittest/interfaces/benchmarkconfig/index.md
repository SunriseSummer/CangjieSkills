<!-- cj-doc kind="api-type" level="5" id="std.unittest.interface.benchmarkconfig" parent="std.unittest" -->
# BenchmarkConfig

[← std.unittest](../../index.md)

`BenchmarkConfig`

该接口提供为 Configuration 宏配置性能测试相关信息的函数签名。

## 方法

| 签名 | 功能 |
|---|---|
| [`batchSize(b: Int64): Unit`](batchsize.md) | 可实现该函数，为 `@Configuration` 宏配置批次的大小。 |
| [`batchSize(x: Range<Int64>): Unit`](batchsize.md) | 可实现该函数，为 `@Configuration` 宏配置批次的大小。 |
| [`explicitGC(x: ExplicitGcType): Unit`](explicitgc.md) | 可实现该函数，为 `@Configuration` 宏配置 GC 的类型。 |
| [`minBatches(x: Int64): Unit`](minbatches.md) | 可实现该函数，为 `@Configuration` 宏配置最小批次个数。 |
| [`minDuration(x: Duration): Unit`](minduration.md) | 可实现该函数，为 `@Configuration` 宏配置性能测试最小执行时间。 |
| [`warmup(x: Int64): Unit`](warmup.md) | 可实现该函数，为 `@Configuration` 宏配置预热期的执行次数。 |
| [`warmup(x: Duration): Unit`](warmup.md) | 可实现该函数，为 `@Configuration` 宏配置预热期的执行时间。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Configuration <: BenchmarkConfig`](extensions/extend-configuration-benchmarkconfig.md) | 为 Configuration 扩展 BenchmarkConfig 接口。 |

<!-- cj-doc kind="api-extension" level="6" id="std.unittest.interface.benchmarkconfig.extension.extend-configuration-benchmarkconfig" parent="std.unittest.interface.benchmarkconfig" -->
# extend Configuration <: BenchmarkConfig

[← BenchmarkConfig](../index.md)

`extend Configuration <: BenchmarkConfig`

为 Configuration 扩展 BenchmarkConfig 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`batchSize(b: Int64)`](../batchsize.md) | 配置性能测试时一个批次的执行次数。 |
| [`batchSize(x: Range<Int64>)`](../batchsize.md) | 配置性能测试时一个批次的执行次数范围。 |
| [`explicitGC(x: ExplicitGcType)`](../explicitgc.md) | 配置性能测试时执行 GC 的方式。 |
| [`minBatches(x: Int64)`](../minbatches.md) | 配置性能测试时最少的批次数。 |
| [`minDuration(x: Duration)`](../minduration.md) | 配置性能测试时最短的执行时长。 |
| [`warmup(x: Int64)`](../warmup.md) | 配置性能测试时预热的秒数。 |
| [`warmup(x: Duration)`](../warmup.md) | 配置性能测试时预热的时长。 |

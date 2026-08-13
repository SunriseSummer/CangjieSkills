<!-- cj-doc kind="api-type" level="5" id="std.unittest.struct.cpucycles" parent="std.unittest" -->
# CpuCycles

[← std.unittest](../../index.md)

`CpuCycles <: Measurement`

使用本机 `rdtscp` 指令测量 CPU 周期数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`conversionTable: MeasurementUnitTable`](prop-conversiontable.md) | 提供当前时间的单位换算表。 |
| [`name: String`](prop-name.md) | 提供当前时间单位唯一的显示名称，例如：`CpuCycles`。 |
| [`textDescription: String`](prop-textdescription.md) | 描述此测量的简单文本将显示在某些报告中。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`measure(): Float64`](measure.md) | 返回执行了多少个 CPU 周期。 |
| [`setup()`](setup.md) | 在测量前执行的配置动作。 |

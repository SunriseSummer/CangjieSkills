<!-- cj-doc kind="api-type" level="5" id="std.unittest.struct.perf" parent="std.unittest" -->
# Perf

[← std.unittest](../../index.md)

`Perf <: Measurement`

使用 Linux 系统调用 `perf_event_open` 测量各种硬件和软件 CPU 计数器。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`conversionTable: MeasurementUnitTable`](prop-conversiontable.md) | 提供对应 CPU 计数器的换算表。 |
| [`name: String`](prop-name.md) | 为当前 CPU 计数器提供唯一的显示名称，例如：`Perf(cycles)`。 |
| [`textDescription: String`](prop-textdescription.md) | 描述此测量的简单文本将显示在某些报告中。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 使用 CPU 周期计数器的默认构造函数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`Perf(counter: PerfCounter)`](perf-perfcounter.md) | 指定要测量的 CPU 计数器的构造函数。 |
| [`measure(): Float64`](measure.md) | 返回指定 CPU 计数器的值。 |
| [`setup()`](setup.md) | 此 CPU 计数器的初始化例程。 |

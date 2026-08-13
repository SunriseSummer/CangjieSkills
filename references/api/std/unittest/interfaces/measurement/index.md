<!-- cj-doc kind="api-type" level="5" id="std.unittest.interface.measurement" parent="std.unittest" -->
# Measurement

[← std.unittest](../../index.md)

`Measurement`

该接口指定如何在性能测试期间测量数据以及如何在报告中显示数据。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`conversionTable: MeasurementUnitTable`](prop-conversiontable.md) | 用于在性能测试报告中构建测量值的表示。 |
| [`name: String`](prop-name.md) | 当前 `Measurement` 类型的唯一显示名称。 |
| [`textDescription: String`](prop-textdescription.md) | 描述此测量的简单文本将显示在某些报告中。 |
| [`info`](prop-info.md) | 具体测量的汇总信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`measure(): Float64`](measure.md) | 将用于统计分析的测量运行时间的方法。 |
| [`setup()`](setup.md) | 此测量的初始化例程。 |

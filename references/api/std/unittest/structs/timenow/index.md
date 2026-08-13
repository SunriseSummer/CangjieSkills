<!-- cj-doc kind="api-type" level="5" id="std.unittest.struct.timenow" parent="std.unittest" -->
# TimeNow

[← std.unittest](../../index.md)

`TimeNow <: Measurement`

Measurement 的实现，用于测量执行一个函数所花费的时间。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`conversionTable: MeasurementUnitTable`](prop-conversiontable.md) | 提供当前时间的单位换算表。 |
| [`name: String`](prop-name.md) | 提供当前时间单位唯一的显示名称，例如：`Duration(ns)` 或 `Duration(s)`。 |
| [`textDescription: String`](prop-textdescription.md) | 描述此测量的简单文本将显示在某些报告中。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 自动选择输出格式的默认构造函数。 |
| [`init(unit: ?TimeUnit)`](init.md) | `unit` 参数用于指定打印结果时将使用的时间单位。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`measure(): Float64`](measure.md) | 获取当前时间用于统计分析。 |

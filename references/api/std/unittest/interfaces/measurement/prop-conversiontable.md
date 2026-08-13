<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.measurement.prop-conversiontable" parent="std.unittest.interface.measurement" -->
# Measurement.conversionTable

[← Measurement](index.md)

## 签名

```cangjie role=signature
prop conversionTable: MeasurementUnitTable
```

用于在性能测试报告中构建测量值的表示。

## 契约

功能：用于在性能测试报告中构建测量值的表示。
包含测量单位的边界对。
根据值的边界，使用最合适的单位。
对于 CSV 格式报告，始终选择下限以简化结果处理。
默认值为 `[(1.0, "")]`。

类型：MeasurementUnitTable。

<!-- cj-doc kind="api-member" level="5" id="std.unittest.type.measurementunittable" parent="std.unittest" -->
# MeasurementUnitTable

[← std.unittest](../index.md)

## 签名

```cangjie role=signature
type MeasurementUnitTable = Array<(Float64, String)>
```

用作 Measurement 中性能测试结果单位转换表的“边界-单位”对数组的别名。

## 契约

要显示的性能测试结果值是根据归一化期间的边界从该表计算得出的。
例如，对于时间单位，它可以遵循 `[(1.0, "ns"), (1_000.0, "us"), (1_000_000.0, "ms"), (1_000_000_000.0, "s"), ...]`。

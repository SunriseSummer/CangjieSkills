<!-- cj-doc kind="api-member" level="6" id="std.unittest.struct.timenow.prop-conversiontable" parent="std.unittest.struct.timenow" -->
# TimeNow.conversionTable

[← TimeNow](index.md)

## 签名

```cangjie role=signature
prop conversionTable: MeasurementUnitTable
```

提供当前时间的单位换算表。

## 契约

功能：提供当前时间的单位换算表。
例如 `[(1.0, "ns"), (1e3, "us"), (1e6, "ms"), (1e9, "s")]`。

类型：MeasurementUnitTable。

<!-- cj-doc kind="api-member" level="6" id="std.interop.class.exportedref.validatehandle" parent="std.interop.class.exportedref" -->
# ExportedRef.validateHandle

[← ExportedRef](index.md)

## 签名

```cangjie role=signature
protected func validateHandle(): Unit
```

为此类型生成有效的句柄。

调用后子类可通过受保护字段 `handle` 取得结果。该值可能为 `0`，有效性必须由 `ExportTable.getExportedRef(handle)` 判断；不要与字段初始值作哨兵比较。

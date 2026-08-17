<!-- cj-doc kind="api-member" level="6" id="std.interop.class.exporttable.getexportedref" parent="std.interop.class.exporttable" -->
# ExportTable.getExportedRef

[← ExportTable](index.md)

## 签名

```cangjie role=signature
public static func getExportedRef(handle: UInt64): ?ExportedRef
```

根据 `handle` 返回 ExportedRef 对象，如果 `handle` 无效，返回 None。

## 参数

- handle: UInt64 - createExportHandle 的返回值。

## 返回值

- ?ExportedRef - 如果 `handle` 有效，则返回 ExportedRef 对象，否则返回 `None`。


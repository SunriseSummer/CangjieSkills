<!-- cj-doc kind="api-member" level="6" id="std.interop.class.exporttable.createexporthandle" parent="std.interop.class.exporttable" -->
# ExportTable.createExportHandle

[← ExportTable](index.md)

## 签名

```cangjie role=signature
public static func createExportHandle(ref: ExportedRef): UInt64
```

为 ExportedRef 生成 `handle`。

## 参数

- ref: ExportedRef - 需要生成 `handle` 的对象实例。

## 返回值

- UInt64 - 为 ExportedRef 对象生成的 `handle`。

该值是完全不透明的表键；仓颉 1.1.3 中 `0` 也可能是有效句柄。不要用数值范围判断有效性，改用 `ExportTable.getExportedRef(handle)`。

<!-- cj-doc kind="api-member" level="6" id="std.interop.class.exporttable.crossaccessbarrier" parent="std.interop.class.exporttable" -->
# ExportTable.crossAccessBarrier

[← ExportTable](index.md)

## 签名

```cangjie role=signature
public static func crossAccessBarrier(handle: UInt64): Unit
```

此接口用于外部语言通过 `handle` 间接访问 ExportedRef 对象的场景，当前只被互操作库相关的 `API` 使用，开发者请勿随意使用。

## 参数

- handle: UInt64 - createExportHandle 的返回值。


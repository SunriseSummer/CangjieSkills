<!-- cj-doc kind="api-type" level="5" id="std.interop.class.exporttable" parent="std.interop" -->
# ExportTable

[← std.interop](../../index.md)

`class ExportTable`

此类通过类型为 UInt64 的 `handle` 管理 ExportedRef 的实例对象的生命周期，可实现为 ExportedRef 对象生成 `handle`，根据 `handle` 获取 ExportedRef 对象， 根据 `handle` 移除 ExportedRef 对象等操作。

## 关键契约

- `createExportHandle`/`validateHandle` 返回的句柄只用于回查和移除，不承诺单调、非零或可复用规则；1.1.3 的首个有效句柄可以为 `0`。
- 使用 `getExportedRef` 判定句柄是否仍有效，并将得到的基类显式转换为自己的 `ExportedRef` 子类。
- `removeExportedRef` 后旧句柄立即无法回查；跨语言侧应同步停止访问。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func createExportHandle(ref: ExportedRef): UInt64`](createexporthandle.md) | 为 ExportedRef 生成 `handle`。 |
| [`static func crossAccessBarrier(handle: UInt64): Unit`](crossaccessbarrier.md) | 此接口用于外部语言通过 `handle` 间接访问 ExportedRef 对象的场景，当前只被互操作库相关的 `API` 使用，开发者请勿随意使用。 |
| [`static func getExportedRef(handle: UInt64): ?ExportedRef`](getexportedref.md) | 根据 `handle` 返回 ExportedRef 对象，如果 `handle` 无效，返回 None。 |
| [`static func removeExportedRef(handle: UInt64): Unit`](removeexportedref.md) | 根据 `handle` 移除 ExportedRef 对象。 |

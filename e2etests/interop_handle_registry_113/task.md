# 1.1.3 跨语言导出句柄注册表

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `interop_handle_registry_113`。将随题提供的 `interop_handle_registry_113_test.cj` 原样复制到项目 `src/`，测试不可修改。

基于新包 `std.interop` 实现以下公开类型：

```cangjie
public class RegistryContext <: InteropContext
public class StringExport <: ExportedRef {
    public init(value: String, context: InteropContext)
    public func publish(): UInt64
    public func value(): String
}
public class ExportRegistry {
    public init()
    public func publish(value: String): UInt64
    public func resolve(handle: UInt64): ?String
    public func remove(handle: UInt64): Bool
}
```

要求：

- `RegistryContext` 调用受保护的父类构造函数，并实现 `Equatable<InteropContext>` 要求的 `operator ==`；循环引用处理回调不得抛异常。
- `StringExport` 用 `super(value, context)` 保存被导出值；`publish()` 调用 `validateHandle()` 后返回受保护字段 `handle`；`value()` 对 `ref` 做受控类型转换。
- `ExportRegistry.publish` 为每个值创建新的 `StringExport` 并发布；`resolve` 通过 `ExportTable.getExportedRef` 查询、转换后返回文本；`remove` 只在句柄当前有效时调用 `removeExportedRef` 并返回 `true`，无效句柄返回 `false`。
- 句柄是完全不透明的 `UInt64`，有效句柄可以为 `0`；不得用 `> 0`、`!= 0`、递增规律或自建整数表判断有效性。
- 不得用 HashMap 或其他容器替代 `ExportTable` 的生命周期管理。

最终执行 `cjpm clean && cjpm test`（PowerShell 可分两条命令）；全部测试通过且生产源码零 warning。


<!-- cj-doc kind="api-package" level="4" id="std.interop" parent="api.std" -->
# std.interop

[← std 包索引](../index.md)

为跨语言互操作库提供对象导出、句柄生命周期管理与跨运行时循环引用协同能力；当前用于 ArkTS 互操作。

包路径：`std.interop`。在代码中只导入实际使用的类型或函数。

## 关键契约

- `ExportedRef` 与 `InteropContext` 是互操作库作者使用的抽象基类，不是普通业务对象容器；上下文子类还必须实现 `Equatable<InteropContext>` 的 `operator ==`。
- 子类通过 `validateHandle()` 取得并保存句柄。句柄是完全不透明的 `UInt64`，Windows x86_64 cjnative 1.1.3 实测首个有效句柄可以为 `0`；不得以正数或非零判断有效性，应调用 `ExportTable.getExportedRef(handle)`。
- `removeExportedRef(handle)` 结束表中的强引用关系；移除后 `getExportedRef(handle)` 返回 `None`。不要继续从外部语言使用已移除句柄。

## 类

| 声明 | 功能 |
|---|---|
| [`ExportedRef`](classes/exportedref/index.md) | 此类用来包装跨语言互操作场景下需要被外部语言使用的类或函数，此类的实例对象可通过 ExportTable 使用类型为 UInt64 的 `handle` 进行管理，外部语言亦可通过 `handle` 间接引用此对象。 |
| [`ExportTable`](classes/exporttable/index.md) | 此类通过类型为 UInt64 的 `handle` 管理 ExportedRef 的实例对象的生命周期，可实现为 ExportedRef 对象生成 `handle`，根据 `handle` 获取 ExportedRef 对象， 根据 `handle` 移除 ExportedRef 对象等操作。 |
| [`ForeignProxy`](classes/foreignproxy/index.md) | 此类用于代理跨语言互操作场景下外部语言的对象 `handle`。 |
| [`InteropContext`](classes/interopcontext/index.md) | 此类封装了跨语言互操作场景下处理循环引用的函数。此类不具备任何 `public` 的成员与接口，当前只被互操作库相关的 `API` 使用，开发者请勿随意继承此类。 |

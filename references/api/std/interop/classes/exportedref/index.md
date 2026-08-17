<!-- cj-doc kind="api-type" level="5" id="std.interop.class.exportedref" parent="std.interop" -->
# ExportedRef

[← std.interop](../../index.md)

`abstract class ExportedRef`

此类用来包装跨语言互操作场景下需要被外部语言使用的类或函数，此类的实例对象可通过 ExportTable 使用类型为 UInt64 的 `handle` 进行管理，外部语言亦可通过 `handle` 间接引用此对象。

## 关键契约

子类构造时先调用 `super(exportedRef, context)`，需要对外发布时再调用 `validateHandle()`。`handle` 是不透明值，不能把 `0` 当作无效哨兵；有效性以 `ExportTable.getExportedRef(handle)` 的 `Some`/`None` 为准。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`protected let interopContext: InteropContext`](field-interopcontext.md) | 用来表示某种跨语言互操作的上下文环境，在与某一种特定语言进行互操作时，此成员亦为特定值。 |
| [`protected let ref: Any`](field-ref.md) | 被此类型包装的真正被外部依赖的函数或者对象。 |
| [`protected var handle: UInt64 = 0`](field-handle.md) | 用来表示此类型实例对象的句柄, 此值只能为 validateHandle 的返回值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`protected init(exportedRef: Any, context: InteropContext)`](init.md) | 基于要封装的对象或函数实例与互操作上下文环境构造一个 ExportedRef 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`protected func validateHandle(): Unit`](validatehandle.md) | 为此类型生成有效的句柄。 |

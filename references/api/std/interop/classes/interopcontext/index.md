<!-- cj-doc kind="api-type" level="5" id="std.interop.class.interopcontext" parent="std.interop" -->
# InteropContext

[← std.interop](../../index.md)

`abstract class InteropContext <: Equatable<InteropContext>`

此类封装了跨语言互操作场景下处理循环引用的函数。此类不具备任何 `public` 的成员与接口，当前只被互操作库相关的 `API` 使用，开发者请勿随意继承此类。

## 子类契约

子类必须调用受保护构造函数，并实现 `Equatable<InteropContext>` 要求的 `public operator func ==(other: InteropContext): Bool`；参数类型是父类型而不是子类类型。

只有同一互操作上下文语义的实例才应相等；若上下文是无状态单例语义，可按类型或引用身份实现稳定判等。构造函数的循环引用回调应保持无异常，并只执行相应互操作运行时要求的清理动作。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`protected init(handler: (ExportedRef, ForeignProxy) -> Unit)`](init.md) | 用来构造一个 InteropContext 实例。 |

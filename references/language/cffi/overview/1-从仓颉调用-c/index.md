<!-- cj-doc kind="guide-index" level="5" id="language.cffi.overview.1-从仓颉调用-c" parent="language.cffi.overview" -->
# 1. 从仓颉调用 C

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [1.1 foreign 函数声明](1-1-foreign-函数声明.md) | 使用 `@C` 和 `foreign` 修饰符，结合仓颉函数语法声明 C 函数，`@C` 修饰符可省略。 |
| [1.2 CFunc 类型](1-2-cfunc-类型.md) | 以上三个示例函数的类型均为 `CFunc<(CPointer<Int8>) -> Unit>`。 |
| [1.3 inout 参数](1-3-inout-参数.md) | 仅用于 `CFunc` 调用处 |
| [1.4 unsafe 上下文](1-4-unsafe-上下文.md) | 调用以下函数须在 `unsafe` 上下文中：`foreign` 函数、`@C` 函数、`CFunc` 变量、`unsafe` 修饰的函数。 |
| [1.5 调用约定](1-5-调用约定.md) | `@CallingConv[CDECL]`：默认约定，可省略 |

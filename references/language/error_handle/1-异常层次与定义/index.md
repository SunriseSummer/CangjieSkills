<!-- cj-doc kind="guide-index" level="4" id="language.error_handle.1-异常层次与定义" parent="language.error_handle" -->
# 1. 异常层次与定义

[← 错误处理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [1.1 两种基础异常类型](1-1-两种基础异常类型.md) | `Error` — 内部系统/资源耗尽错误。 |
| [1.2 自定义异常规则](1-2-自定义异常规则.md) | 自定义异常使用 `<: Exception`，构造函数先调用 `super(message)`；如需正确的自定义类名，重写 `getClassName()`。 |
| [1.3 `Exception` API](1-3-exception-api.md) | 速查`构造函数`：`init()`；`构造函数`：`init(message: String)`；`属性`：`open prop message: String`；另含更多表项。 |
| [1.4 `Error` API](1-4-error-api.md) | 速查`属性`：`open prop message: String`；`方法`：`open func toString(): String`；`方法`：`func printStackTrace(): Unit`。 |

<!-- cj-doc kind="guide-leaf" level="5" id="language.error_handle.1-异常层次与定义.1-3-exception-api" parent="language.error_handle.1-异常层次与定义" -->
# 1.3 `Exception` API

[← 1. 异常层次与定义](index.md)

速查`构造函数`：`init()`；`构造函数`：`init(message: String)`；`属性`：`open prop message: String`；另含更多表项。

| 类型 | 签名 | 说明 |
|------|------|------|
| 构造函数 | `init()` | 默认构造函数 |
| 构造函数 | `init(message: String)` | 带消息构造函数 |
| 属性 | `open prop message: String` | 详细消息 |
| 方法 | `open func toString(): String` | 类型名 + 消息 |
| 方法 | `open func getClassName(): String` | 供子类重写返回自定义类名；编译器不强制重写，且继承版本不能通过普通 `Exception` 引用直接调用 |
| 方法 | `func printStackTrace(): Unit` | 打印堆栈跟踪到 stderr |

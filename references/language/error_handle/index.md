<!-- cj-doc kind="guide-topic" level="3" id="language.error_handle" parent="language" -->
# 错误处理

[← 语言特性](../index.md)

Error、Exception、throw、try/catch/finally、资源管理与内置异常。

| 规则/任务 | 摘要 |
|---|---|
| [1. 异常层次与定义](1-异常层次与定义/index.md) | 应用异常继承 `Exception` 而非 `Error`；自定义类通过构造函数调用 `super(message)` 初始化消息。 |
| [2. 抛出与处理异常](2-抛出与处理异常/index.md) | 三个块：try、catch（0+）、finally（有 catch 时可选，无 catch 时须有） |
| [3. 使用 Option 处理错误](3-使用-option-处理错误/index.md) | `Option<T>`（简写 `?T`）表示值的存在（`Some(v)`）或缺失（`None`） |
| [4. 内置运行时异常](4-内置运行时异常.md) | 速查`ConcurrentModificationException`：并发修改错误；`IllegalArgumentException`：非法或不正确的参数；`IllegalStateException`：对象状态不合法；另含更多表项。 |

<!-- cj-doc kind="guide-index" level="4" id="language.error_handle.2-抛出与处理异常" parent="language.error_handle" -->
# 2. 抛出与处理异常

[← 错误处理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 `throw` 关键字](2-1-throw-关键字.md) | `throw <expr>` 其中 `<expr>` 须为 `Exception` 子类型（不能抛出 `Error`） |
| [2.2 普通 `try` 表达式](2-2-普通-try-表达式.md) | 三个块：try、catch（0+）、finally（有 catch 时可选，无 catch 时须有） |
| [2.3 `try-with-resources` 表达式](2-3-try-with-resources-表达式.md) | `try(resource)` 自动关闭实现 `Resource` 的对象，异常路径也会释放；整个表达式的类型始终是 `Unit`，需要返回数据时在块外保存结果。 |
| [2.4 CatchPattern](2-4-catchpattern.md) | 单类型：`Identifier: ExceptionClass` — 捕获该类及子类，绑定到 `Identifier` |

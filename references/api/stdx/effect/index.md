<!-- cj-doc kind="api-package" level="4" id="stdx.effect" parent="api.stdx" -->
# stdx.effect

[← stdx 包索引](../index.md)

为实验性 Effect Handlers 提供效应基类与运行时异常。使用本包必须同时启用 `--experimental` 和 `--enable-eh`；未显式处理的效应会执行 `Command.defaultImpl()`。

包路径：`stdx.effect`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Command<Res>`](classes/command/index.md) | 可由 `perform` 触发、由 `handle` 捕获并通过 `resume` 恢复的效应基类。 |
| [`DoubleResumeException`](classes/doubleresumeexception/index.md) | 同一个恢复点被重复恢复时抛出的异常。 |
| [`UnhandledCommandException`](classes/unhandledcommandexception/index.md) | 效应既没有匹配的 handler、也没有可用默认实现时抛出的异常。 |


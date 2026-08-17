<!-- cj-doc kind="guide-topic" level="3" id="language.effect-handler" parent="language" -->
# 效应处理器

[← 语言特性索引](../index.md)

仓颉 1.1.3 的 Effect Handlers 是实验性、可恢复的非局部控制流：以 `Command<Res>` 描述效应，`perform` 触发，`handle` 处理，`resume` 把结果注入原调用点。

| 子主题 | 摘要 |
|---|---|
| [1. 定义、触发与恢复](1-定义-触发与恢复.md) | 同时启用 `--experimental --enable-eh`，用 `stdx.effect.Command` 建模并以 `resume with` 恢复。 |
| [2. 默认处理与运行边界](2-默认处理与运行边界.md) | 没有匹配 handler 时执行 `defaultImpl`；未重写时抛出 `UnhandledCommandException`，恢复点只能消费一次。 |


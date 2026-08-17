<!-- cj-doc kind="api-type" level="5" id="stdx.effect.class.command" parent="stdx.effect" -->
# Command<Res>

[← stdx.effect](../../index.md)

`abstract class Command<Res>`

表示返回 `Res` 的效应命令。子类实例可由 `perform` 触发；匹配的 `handle` 可读取命令状态，并用 `resume with <value>` 向触发点注入结果。

## 方法

| 签名 | 功能 |
|---|---|
| [`open func defaultImpl(): Res`](defaultimpl.md) | 没有匹配 handler 时执行的默认实现；基类实现抛出 `UnhandledCommandException`。 |


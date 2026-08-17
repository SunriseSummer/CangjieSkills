<!-- cj-doc kind="api-type" level="5" id="std.core.enum.threadstate" parent="std.core" -->
# ThreadState

[← std.core](../../index.md)

`enum ThreadState <: ToString`

表示线程的状态。

## 方法

| 签名 | 功能 |
|---|---|
| [`func toString(): String`](tostring.md) | 将 ThreadState 转换为可输出的字符串。 |

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Pending`](value-pending.md) | 表示线程正被挂起。 |
| [`Ready`](value-ready.md) | 表示线程刚创建或结束挂起，正在等待被调度执行。 |
| [`Running`](value-running.md) | 表示线程正在执行。 |
| [`Terminated`](value-terminated.md) | 表示线程已结束执行。 |


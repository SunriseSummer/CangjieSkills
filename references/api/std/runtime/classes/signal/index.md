<!-- cj-doc kind="api-type" level="5" id="std.runtime.class.signal" parent="std.runtime" -->
# Signal

[← std.runtime](../../index.md)

`class Signal`

信号类，用于向操作系统、其他进程或进程自身传递事件的通知。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`static const SIGALRM = Signal(0xe, "alarm clock")`](field-sigalrm.md) | SIGALRM 信号，定时器超时。 |
| [`static const SIGHUP = Signal(0x1, "hangup")`](field-sighup.md) | SIGHUP 信号，终端挂起或进程父进程退出。 |
| [`static const SIGINT = Signal(0x2, "interrupt")`](field-sigint.md) | SIGINT 信号，表示用户中断。 |
| [`static const SIGQUIT = Signal(0x3, "quit")`](field-sigquit.md) | SIGQUIT 信号，表示用户退出。 |
| [`static const SIGTERM = Signal(0xf, "terminated")`](field-sigterm.md) | SIGTERM 信号，终止请求。 |
| [`static const SIGTRAP = Signal(0x5, "trace/breakpoint trap")`](field-sigtrap.md) | SIGTRAP 信号，调试断点触发。 |
| [`prop value: Int32`](prop-value.md) | 获取信号的值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`const init(value: Int32, comment: String)`](init.md) | 创建信号。 |


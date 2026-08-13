<!-- cj-doc kind="api-type" level="5" id="std.process.class.process" parent="std.process" -->
# Process

[← std.process](../../index.md)

`open Process`

此类为进程类，提供进程操作相关功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`command: String`](prop-command.md) | 获取进程命令。 |
| [`name: String`](prop-name.md) | 获取进程名。 |
| [`pid: Int64`](prop-pid.md) | 获取进程 `id`。 |
| [`startTime: DateTime`](prop-starttime.md) | 获取进程启动时间，获取失败时返回 DateTime.UnixEpoch。 |
| [`systemTime: Duration`](prop-systemtime.md) | 获取进程启动时间，获取失败时返回 -1ms。 |
| [`userTime: Duration`](prop-usertime.md) | 获取进程启动时间，获取失败时返回 -1ms。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isAlive(): Bool`](isalive.md) | 返回进程是否存活。 |
| [`terminate(force!: Bool = false): Unit`](terminate.md) | 终止进程，子进程执行返回结果，包含子进程退出状态（若子进程正常退出，返回子进程退出码，若子进程被信号杀死，返回导致子进程终止的信号编号），进程标准输出结果和进程错误结果。 |

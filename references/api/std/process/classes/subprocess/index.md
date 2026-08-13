<!-- cj-doc kind="api-type" level="5" id="std.process.class.subprocess" parent="std.process" -->
# SubProcess

[← std.process](../../index.md)

`SubProcess <: Process`

此类为子进程类，继承 Process 类，提供对子进程操作相关功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`stdErrPipe: InputStream`](prop-stderrpipe.md) | 获取输入流，连接到子进程标准错误流。 |
| [`stdInPipe: OutputStream`](prop-stdinpipe.md) | 获取输出流，连接到子进程标准输入流。 |
| [`stdOutPipe: InputStream`](prop-stdoutpipe.md) | 获取输入流，连接到子进程标准输出流。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`wait(timeout!: ?Duration = None): Int64`](wait.md) | 阻塞当前进程等待子进程任务执行完成并返回子进程退出状态码，允许指定等待超时时间。 |
| [`waitOutput(): (Int64, Array<Byte>, Array<Byte>)`](waitoutput.md) | 阻塞当前进程等待子进程任务执行完成，并返回子进程退出状态码、返回结果（包含输出流和错误流返回结果）。 |

<!-- cj-doc kind="api-type" level="5" id="std.process.enum.processredirect" parent="std.process" -->
# ProcessRedirect

[← std.process](../../index.md)

`ProcessRedirect`

该枚举类型用于在创建进程时设置子进程标准流的重定向模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Discard`](value-discard.md) | 构造一个标准流重定向枚举实例，表示子进程标准流将被丢弃。 |
| [`FromFile(File)`](value-fromfile-file.md) | 构造一个标准流重定向枚举实例，表示子进程标准流将被重定向至指定的文件。 |
| [`Inherit`](value-inherit.md) | 构造一个标准流重定向枚举实例，表示子进程标准流将继承当前进程的标准流。 |
| [`Pipe`](value-pipe.md) | 构造一个标准流重定向枚举实例，表示子进程标准流将被重定向至管道，并通过管道与当前进程连接。 |

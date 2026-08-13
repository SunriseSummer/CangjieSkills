<!-- cj-doc kind="api-member" level="6" id="std.process.class.subprocess.wait" parent="std.process.class.subprocess" -->
# SubProcess.wait

[← SubProcess](index.md)

## 签名

```cangjie role=signature
public func wait(timeout!: ?Duration = None): Int64
```

阻塞当前进程等待子进程任务执行完成并返回子进程退出状态码，允许指定等待超时时间。

## 契约

功能：阻塞当前进程等待子进程任务执行完成并返回子进程退出状态码，允许指定等待超时时间。对于需要操作标准流的场景（Pipe 模式），使用者需要优先处理标准流，避免子进程标准流缓冲区满后调用本函数产生死锁。

> **说明：**
>
> 超时时间处理机制：
>
> - 未传参、 `timeout` 值为 `None` 或值小于等于 Duration.Zero 时，阻塞等待直至子进程执行返回。
> - `timeout` 值大于 Duration.Zero 时，阻塞等待子进程执行返回或等待超时后抛出超时异常。

参数：

- timeout!: ?Duration - 命名可选参数，设置等待子进程超时时间，默认为 `None`。

返回值：

- Int64 - 返回子进程退出状态。若子进程正常退出，返回子进程退出码，若子进程被信号杀死，返回导致子进程终止的信号编号。

异常：

- TimeoutException - 当等待超时，子进程未退出时，抛出异常。

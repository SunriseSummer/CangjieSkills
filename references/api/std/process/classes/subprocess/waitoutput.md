<!-- cj-doc kind="api-member" level="6" id="std.process.class.subprocess.waitoutput" parent="std.process.class.subprocess" -->
# SubProcess.waitOutput

[← SubProcess](index.md)

## 签名

```cangjie role=signature
public func waitOutput(): (Int64, Array<Byte>, Array<Byte>)
```

阻塞当前进程等待子进程任务执行完成，并返回子进程退出状态码、返回结果（包含输出流和错误流返回结果）。

## 契约

功能：阻塞当前进程等待子进程任务执行完成，并返回子进程退出状态码、返回结果（包含输出流和错误流返回结果）。输出流、错误流中包含大量输出的场景不适用于本函数，建议通过 SubProcess 中提供的标准流属性结合 wait 函数自行处理。

返回值：

- (Int64, Array\<Byte>, Array\<Byte>) - 子进程执行返回结果，包含子进程退出状态（若子进程正常退出，返回子进程退出码，若子进程被信号杀死，返回导致子进程终止的信号编号），进程标准输出结果和进程错误结果。

异常：

- ProcessException - 当子进程不存在，或者标准流读取异常时，抛出异常。

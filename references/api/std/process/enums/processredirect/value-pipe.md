<!-- cj-doc kind="api-member" level="6" id="std.process.enum.processredirect.value-pipe" parent="std.process.enum.processredirect" -->
# ProcessRedirect.Pipe

[← ProcessRedirect](index.md)

## 签名

```cangjie role=signature
Pipe
```

构造一个标准流重定向枚举实例，表示子进程标准流将被重定向至管道，并通过管道与当前进程连接。

## 契约

功能：构造一个标准流重定向枚举实例，表示子进程标准流将被重定向至管道，并通过管道与当前进程连接。重定向标准输入流可通过管道向子进程写入数据，重定向标准输出流或标准错误流可通过管道读取子进程输出结果。此模式下可通过标准流属性读取或写入数据。

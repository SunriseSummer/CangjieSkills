<!-- cj-doc kind="api-member" level="6" id="std.process.class.process.terminate" parent="std.process.class.process" -->
# Process.terminate

[← Process](index.md)

## 签名

```cangjie role=signature
public func terminate(force!: Bool = false): Unit
```

终止进程，子进程执行返回结果，包含子进程退出状态（若子进程正常退出，返回子进程退出码，若子进程被信号杀死，返回导致子进程终止的信号编号），进程标准输出结果和进程错误结果。

## 契约

参数：

- force!: Bool - 命名可选参数，指定是否强制关闭进程，默认为 `false`，若设置为 `false`，对应进程可以在释放资源后结束；若设置为 `true`，对应进程将被直接杀死。`Windows` 平台实现为强制关闭进程。

异常：

- ProcessException - 如果进程不存在，不允许终止，则抛出异常。

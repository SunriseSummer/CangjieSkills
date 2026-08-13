<!-- cj-doc kind="api-member" level="5" id="std.process.func.execute-string-array-string-path-map-string-string-processredir-d51f810c" parent="std.process" -->
# execute(String, Array<String>, ?Path, ?Map<String, String>, ProcessRedirect, ProcessRedirect,ProcessRedirect, ?Duration)

[← std.process](../index.md)

## 签名

```cangjie role=signature
public func execute(command: String,
                      arguments: Array<String>,
                      workingDirectory!: ?Path = None,
                      environment!: ?Map<String, String> = None,
                      stdIn!: ProcessRedirect = Inherit,
                      stdOut!: ProcessRedirect = Inherit,
                      stdErr!: ProcessRedirect = Inherit,
                      timeout!: ?Duration = None): Int64
```

根据输入参数创建并运行一个子进程，等待该子进程运行完毕并返回子进程退出状态。

## 契约

> **注意：**
>
> 在 `Windows` 平台上，在子进程执行完成后立即删除子进程的可执行文件可能删除失败并抛出异常，异常信息为 `Access is denied`，如果遇到该问题，可以在一小段延迟后重新尝试删除该文件，详细实现可参考示例。

参数：

- command: String - 指定子进程命令，`command` 不允许包含空字符。
- arguments: Array\<String> - 指定子进程参数，`arguments` 不允许数组中字符串中包含空字符。
- workingDirectory!: ?Path - 命名可选参数，指定子进程的工作路径，默认继承当前进程工作路径，路径必须为存在的目录且不允许为空路径或包含空字符。
- environment!: ?Map\<String, String> - 命名可选参数，指定子进程环境变量，默认继承当前进程环境变量，`key` 不允许字符串中包含空字符或 `'='`，value 不允许字符串中包含空字符。
- stdIn!: ProcessRedirect - 命名可选参数，指定子进程重定向标准输入，默认继承当前进程标准输入。
- stdOut!: ProcessRedirect - 命名可选参数，指定子进程重定向标准输出，默认继承当前进程标准输出。
- stdErr!: ProcessRedirect - 命名可选参数，指定子进程重定向标准错误，默认继承当前进程标准错误。
- timeout!: ?Duration - 命名可选参数，指定等待子进程超时时间，默认为不超时, `timeout` 指定为 `0` 或负值时表示不超时。

返回值：

- Int64 - 返回子进程退出状态，若子进程正常退出，返回子进程退出码，若子进程被信号杀死，返回导致子进程终止的信号编号。

异常：

- IllegalArgumentException

    - 当入参 `command` 包含空字符
    - 或者 `arguments` 数组中字符串中包含空字符
    - 或者 `workingDirectory` 不是存在的目录或为空路径或包含空字符
    - 或者 `environment` 表中 `key` 字符串中包含空字符或 `'='`
    - 或者 `value` 字符串中包含空字符
    - 或者 `stdIn`、`stdOut`、`stdErr` 输入为文件模式，输入的文件已被关闭或删除时，抛出异常。

- ProcessException - 当内存分配失败或 `command` 对应的命令不存在或等待超时，抛出异常。

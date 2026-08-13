<!-- cj-doc kind="api-member" level="5" id="std.process.func.launch-string-array-string-path-map-string-string-processredire-85d2763c" parent="std.process" -->
# launch(String, Array<String>, ?Path, ?Map<String, String>, ProcessRedirect, ProcessRedirect, ProcessRedirect)

[← std.process](../index.md)

## 签名

```cangjie role=signature
public func launch(command: String,
                        arguments: Array<String>,
                        workingDirectory!: ?Path = None,
                        environment!: ?Map<String, String> = None,
                        stdIn!: ProcessRedirect = Inherit,
                        stdOut!: ProcessRedirect = Inherit,
                        stdErr!: ProcessRedirect = Inherit): SubProcess
```

根据输入参数创建并运行一个子进程，并返回一个子进程实例。

## 契约

功能：根据输入参数创建并运行一个子进程，并返回一个子进程实例。调用该函数创建子进程后，需要调用 `wait` 或 `waitOutput` 函数，否则该子进程结束后成为的僵尸进程的资源不会被回收。

参数：

- command: String - 指定子进程命令，`command` 不允许包含空字符。
- arguments: Array\<String> - 指定子进程参数，`arguments` 不允许数组中字符串中包含空字符。
- workingDirectory!: ?Path - 命名可选参数，指定子进程的工作路径，默认继承当前进程工作路径，路径必须为存在的目录且不允许为空路径或包含空字符。
- environment!: ?Map\<String, String> - 命名可选参数，指定子进程环境变量，默认继承当前进程环境变量，`key` 不允许字符串中包含空字符或 `'='`，value 不允许字符串中包含空字符。
- stdIn!: ProcessRedirect - 命名可选参数，指定子进程重定向标准输入，默认继承当前进程标准输入。
- stdOut!: ProcessRedirect - 命名可选参数，指定子进程重定向标准输出，默认继承当前进程标准输出。
- stdErr!: ProcessRedirect - 命名可选参数，指定子进程重定向标准错误，默认继承当前进程标准错误。

返回值：

- SubProcess - 返回一个子进程实例。

异常：

- IllegalArgumentException
    - 当入参 `command` 包含空字符
    - 或者 `arguments` 数组中字符串中包含空字符
    - 或者 `workingDirectory` 不是存在的目录或为空路径或包含空字符
    - 或者 `environment` 表中 `key` 字符串中包含空字符或 `'='`
    - 或者 `value` 字符串中包含空字符
    - 或者 `stdIn`、`stdOut`、`stdErr` 输入为文件模式，输入的文件已被关闭或删除时，抛出异常。
- ProcessException - 当内存分配失败或 `command` 对应的命令不存在时，抛出异常。

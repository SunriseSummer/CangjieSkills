<!-- cj-doc kind="api-package" level="4" id="std.process" parent="api.std" -->
# std.process

[← std 包索引](../index.md)

创建和管理子进程，并处理标准流、等待与状态查询。

包路径：`std.process`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`open Process`](classes/process/index.md) | 此类为进程类，提供进程操作相关功能。 |
| [`SubProcess <: Process`](classes/subprocess/index.md) | 此类为子进程类，继承 Process 类，提供对子进程操作相关功能。 |
| [`ProcessException <: IOException`](classes/processexception/index.md) | `process` 包的异常类。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`ProcessRedirect`](enums/processredirect/index.md) | 该枚举类型用于在创建进程时设置子进程标准流的重定向模式。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`execute(command: String, arguments: Array<String>, workingDirectory!: ?Path = None, environment!: ?Map<String, String> = None, stdIn!: ProcessRedirect = Inherit, stdOut!: ProcessRedirect = Inherit, stdErr!: ProcessRedirect = Inherit, timeout!: ?Duration = None): Int64`](functions/execute-string-array-string-path-map-string-string-processredir-d51f810c.md) | 根据输入参数创建并运行一个子进程，等待该子进程运行完毕并返回子进程退出状态。 |
| [`executeWithOutput(command: String, arguments: Array<String>, workingDirectory!: ?Path = None, environment!: ?Map<String, String> = None, stdIn!: ProcessRedirect = Inherit, stdOut!: ProcessRedirect = Pipe, stdErr!: ProcessRedirect = Pipe): (Int64, Array<Byte>, Array<Byte>)`](functions/executewithoutput-string-array-string-path-map-string-string-pr-9be6e6c3.md) | 根据输入参数创建并运行一个子进程，等待该子进程运行完毕并返回子进程退出状态、标准输出和标准错误。 |
| [`findProcess(pid: Int64): Process`](functions/findprocess-int64.md) | 根据输入进程 `id` 绑定一个进程实例。 |
| [`launch(command: String, arguments: Array<String>, workingDirectory!: ?Path = None, environment!: ?Map<String, String> = None, stdIn!: ProcessRedirect = Inherit, stdOut!: ProcessRedirect = Inherit, stdErr!: ProcessRedirect = Inherit): SubProcess`](functions/launch-string-array-string-path-map-string-string-processredire-85d2763c.md) | 根据输入参数创建并运行一个子进程，并返回一个子进程实例。 |

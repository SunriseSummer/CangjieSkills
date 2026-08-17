<!-- cj-doc kind="api-member" level="5" id="std.process.func.executewithoutput-string-array-string-path-map-string-string-pr-9be6e6c3" parent="std.process" -->
# executeWithOutput(String, Array<String>, ?Path, ?Map<String, String>, ProcessRedirect, ProcessRedirect, ProcessRedirect)

[← std.process](../index.md)

## 签名

```cangjie role=signature
public func executeWithOutput(command: String,
                            arguments: Array<String>,
                            workingDirectory!: ?Path = None,
                            environment!: ?Map<String, String> = None,
                            stdIn!: ProcessRedirect = Inherit,
                            stdOut!: ProcessRedirect = Pipe,
                            stdErr!: ProcessRedirect = Pipe): (Int64, Array<Byte>, Array<Byte>)
```

根据输入参数创建并运行一个子进程，等待该子进程运行完毕并返回子进程退出状态、标准输出和标准错误。

## 契约

功能：根据输入参数创建并运行一个子进程，等待该子进程运行完毕并返回子进程退出状态、标准输出和标准错误。输出流、错误流中包含大量输出的场景不适用于本函数，建议通过 SubProcess 中提供的标准流属性结合 `wait` 函数自行处理。

参数：

- command: String - 指定子进程命令，`command` 不允许包含空字符。
- arguments: Array\<String> - 指定子进程参数，`arguments` 不允许数组中字符串中包含空字符。
- workingDirectory!: ?Path - 命名可选参数，指定子进程的工作路径，默认继承当前进程工作路径，路径必须为存在的目录且不允许为空路径或包含空字符。
- environment!: ?Map\<String, String> - 命名可选参数，指定子进程环境变量，默认继承当前进程环境变量，`key` 不允许字符串中包含空字符或 `'='`，value 不允许字符串中包含空字符。
- stdIn!: ProcessRedirect - 命名可选参数，指定子进程重定向标准输入，默认继承当前进程标准输入。
- stdOut!: ProcessRedirect - 命名可选参数，指定子进程重定向标准输出，默认继承当前进程标准输出。
- stdErr!: ProcessRedirect - 命名可选参数，指定子进程重定向标准错误，默认继承当前进程标准错误。

返回值：

- (Int64, Array\<Byte>, Array\<Byte>) - 子进程执行返回结果，包含子进程退出状态（若子进程正常退出，返回子进程退出码，若子进程被信号杀死，返回导致子进程终止的信号编号），进程标准输出结果和进程错误结果。

异常：

- IllegalArgumentException
    - 当入参 `command` 包含空字符
    - 或者 `arguments` 数组中字符串中包含空字符
    - 或者 `workingDirectory` 不是存在的目录或为空路径或包含空字符
    - 或者 `environment` 表中 `key` 字符串中包含空字符或 `'='`
    - 或者 `value` 字符串中包含空字符
    - 或者 `stdIn`、`stdOut`、`stdErr` 输入为文件模式，输入的文件已被关闭或删除时，抛出异常。
- ProcessException
    - 当内存分配失败
    - 或者 `command` 对应的命令不存在
    - 或者子进程不存在
    - 或者标准流读取异常时，抛出异常。

## 典型示例

`executeWithOutput` 会等待子进程结束，并返回退出码、标准输出和标准错误的字节数组。下面调用当前工具链中的编译器并安全解码输出；大量输出应改用 `SubProcess` 的流式接口，避免一次性缓冲。

```cangjie cjtest=run id=api.process.execute-with-output.run form=unit timeout=30s
package execute_with_output_example

import std.process.*

main(): Unit {
    let (exitCode, stdout, stderr) = executeWithOutput("cjc", ["-v"])
    let output = String.fromUtf8(stdout) + String.fromUtf8(stderr)
    println(exitCode)
    println(output.contains("Cangjie Compiler: 1.1.3"))
}
```

```text cjtest=expect for=api.process.execute-with-output.run stream=stdout match=exact
0
true
```

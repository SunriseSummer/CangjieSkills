<!-- cj-doc kind="api-package" level="4" id="std.env" parent="api.std" -->
# std.env

[← std 包索引](../index.md)

访问环境变量、命令行、标准流、进程信息与退出回调。

包路径：`std.env`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ConsoleReader <: InputStream`](classes/consolereader/index.md) | 提供从控制台读出数据并转换成字符或字符串的功能。 |
| [`ConsoleWriter <: OutputStream`](classes/consolewriter/index.md) | 此类提供保证线程安全的标准输出功能。 |
| [`EnvException <: Exception`](classes/envexception/index.md) | `env` 包的异常类。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`atExit(callback: () -> Unit): Unit`](functions/atexit-unit.md) | 注册回调函数，当前进程退出时执行注册函数。 |
| [`exit(code: Int64): Nothing`](functions/exit-int64.md) | 立即终止当前进程，并返回指定的退出状态码。 |
| [`getCommand(): String`](functions/getcommand.md) | 获取进程命令。 |
| [`getCommandLine(): Array<String>`](functions/getcommandline.md) | 获取当前进程命令行。 |
| [`getHomeDirectory(): Path`](functions/gethomedirectory.md) | 获取当前进程 home 目录的路径。 |
| [`getProcessId(): Int64`](functions/getprocessid.md) | 获取当前进程 id。 |
| [`getStdErr(): ConsoleWriter`](functions/getstderr.md) | 获取当前进程标准错误流。 |
| [`getStdIn(): ConsoleReader`](functions/getstdin.md) | 获取当前进程标准输入流。 |
| [`getStdOut(): ConsoleWriter`](functions/getstdout.md) | 获取当前进程标准输出流。 |
| [`getTempDirectory(): Path`](functions/gettempdirectory.md) | 获取当前进程临时目录的路径。 |
| [`getVariable(key: String): ?String`](functions/getvariable-string.md) | 获取当前进程指定名称的环境变量值。 |
| [`getVariables(): Array<(String, String)>`](functions/getvariables.md) | 获取当前进程环境变量。 |
| [`getWorkingDirectory(): Path`](functions/getworkingdirectory.md) | 获取当前进程工作路径。 |
| [`removeVariable(key: String): Unit`](functions/removevariable-string.md) | 通过指定环境变量名称移除环境变量。 |
| [`setVariable(key: String, value: String): Unit`](functions/setvariable-string-string.md) | 用于设置一对环境变量。 |

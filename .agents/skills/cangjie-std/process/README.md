# 仓颉语言进程管理 Skill

## 1. 创建子进程

- 来自 `std.process.*`

| 函数 | 说明 |
|------|------|
| `launch(command: String, ...args: String): SubProcess` | 启动子进程，返回 `SubProcess` |
| `launch(command: String, ...args: String, workingDirectory!: Path)` | 指定工作目录启动 |
| `launch(command: String, ...args: String, stdOut!: ProcessRedirect)` | 重定向标准输出 |

---

## 2. 执行并等待

| 函数 | 说明 |
|------|------|
| `execute(command: String, ...args: String): Int64` | 执行命令并等待，返回退出码 |
| `executeWithOutput(command: String, ...args: String): (Int64, Array<Byte>, Array<Byte>)` | 执行并返回（退出码, stdout, stderr） |

```cangjie
package test_proj
import std.process.*

main(): Int64 {
    // execute: 同步执行命令并获取退出码
    let exitCode = execute("echo", "hello")
    println("exit code: ${exitCode}")

    // executeWithOutput: 同步执行并捕获输出（返回字节数组）
    let (code, stdoutBytes, _) = executeWithOutput("echo", "hello cangjie")
    let output = String.fromUtf8(stdoutBytes).trimEnd()
    println("code=${code}, output=${output}")
    return 0
}
```

---

## 3. 重定向标准流

| ProcessRedirect | 说明 |
|-----------------|------|
| `Pipe` | 通过管道读写子进程流 |
| `Inherit` | 继承父进程流 |
| `Null` | 丢弃输出 |

- **SubProcess** 继承 `Process`：

| 属性/方法 | 说明 |
|-----------|------|
| `wait(): Int64` | 等待子进程结束，返回退出码 |
| `waitOutput(): (Int64, Array<Byte>, Array<Byte>)` | 等待并获取输出 |
| `stdInPipe: OutputStream` | 子进程标准输入管道 |
| `stdOutPipe: InputStream` | 子进程标准输出管道 |
| `stdErrPipe: InputStream` | 子进程标准错误管道 |

```cangjie
package test_proj
import std.process.*
import std.io.*

main(): Int64 {
    // 启动子进程并读取输出
    let echoProcess: SubProcess = launch("echo", "hello cangjie!", stdOut: ProcessRedirect.Pipe)
    let strReader: StringReader<InputStream> = StringReader(echoProcess.stdOutPipe)
    println(strReader.readToEnd())
    return 0
}
```

---

## 4. 查找进程

| 函数 | 说明 |
|------|------|
| `findProcess(pid: Int64): Process` | 按 PID 查找进程，返回 `Process` |

- **Process** 属性与方法：

| 属性/方法 | 说明 |
|-----------|------|
| `pid: Int64` | 进程 ID |
| `name: String` | 进程名称 |
| `command: String` | 进程命令 |
| `terminate(force!: Bool): Unit` | 终止进程，`force: true` 强制终止 |

---

## 5. 异常类型

| 异常 | 说明 |
|------|------|
| `ProcessException` | 进程操作相关错误 |

---

## 6. 关键规则速查

1. `launch` 返回 `SubProcess`，需调用 `wait()` 等待结束并获取退出码
2. `execute` 是同步阻塞调用，直接返回退出码
3. `executeWithOutput` 返回三元组 `(exitCode, stdout, stderr)`
4. 使用 `ProcessRedirect.Pipe` 重定向后，通过 `stdOutPipe` 等管道读写
5. `findProcess(pid)` 查找已运行进程，可调用 `terminate()` 终止
6. 读取管道输出可配合 `std.io.StringReader` 使用

# 仓颉语言进程环境 Skill

## 1. 进程信息

- 来自 `std.env.*`

| 函数 | 说明 |
|------|------|
| `getProcessId(): Int64` | 获取当前进程 ID |
| `getCommand(): String` | 获取当前命令 |
| `getCommandLine(): Array<String>` | 获取命令行参数 |
| `getWorkingDirectory(): Path` | 获取工作目录（返回 `std.fs.Path`） |
| `getHomeDirectory(): Path` | 获取用户主目录 |
| `getTempDirectory(): Path` | 获取临时目录 |

```cangjie
package test_proj
import std.env.*

main(): Int64 {
    println(getProcessId())
    println(getWorkingDirectory().toString())
    return 0
}
```

---

## 2. 环境变量

| 函数 | 说明 |
|------|------|
| `getVariable(name): ?String` | 获取环境变量，不存在返回 `None` |
| `getVariables(): HashMap<String, String>` | 获取所有环境变量 |
| `setVariable(name, value)` | 设置环境变量 |
| `removeVariable(name)` | 移除环境变量 |

```cangjie
package test_proj
import std.env.*

main(): Int64 {
    // 读取环境变量
    let path = getVariable("PATH")
    match (path) {
        case Some(v) => println("PATH = ${v}")
        case None => println("PATH not set")
    }
    // 设置与移除
    setVariable("MY_KEY", "hello")
    println(getVariable("MY_KEY"))
    removeVariable("MY_KEY")
    return 0
}
```

---

## 3. 标准流

| 函数 | 返回类型 | 说明 |
|------|----------|------|
| `getStdIn()` | `ConsoleReader` | 标准输入流 |
| `getStdOut()` | `ConsoleWriter` | 标准输出流 |
| `getStdErr()` | `ConsoleWriter` | 标准错误流 |

- **ConsoleReader**：`read()` 读取字节、`readln(): ?String` 读取一行
- **ConsoleWriter**：`write(str)`、`writeln(str)`、`flush()`

```cangjie
package test_proj
import std.env.*

main(): Int64 {
    let out = getStdOut()
    out.writeln("写入标准输出")
    out.flush()
    let err = getStdErr()
    err.writeln("写入标准错误")
    err.flush()
    return 0
}
```

---

## 4. 退出与回调

| 函数 | 说明 |
|------|------|
| `exit(code)` | 立即退出进程，code 为退出码 |
| `atExit(callback)` | 注册进程退出回调函数 |

- `atExit` 注册的回调在正常退出或调用 `exit()` 时执行
- 多个回调按注册逆序执行

---

## 5. 异常类型

| 异常 | 说明 |
|------|------|
| `EnvException` | 环境操作相关错误 |

---

## 6. 关键规则速查

1. `getVariable` 返回 `?String`，需用 `match` 或 `if-let` 解包
2. `getWorkingDirectory()` 等返回 `std.fs.Path`，可调用 `.toString()` 转换
3. `getStdIn().readln()` 返回 `?String`，输入结束返回 `None`
4. `atExit` 回调按注册逆序执行
5. `exit(code)` 立即终止进程，已注册的 `atExit` 回调仍会执行
6. `setVariable` / `removeVariable` 仅影响当前进程环境

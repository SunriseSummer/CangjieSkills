# 本机工具与源码探测

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `tool_probe`。实现环境变量的作用域恢复、子进程输出捕获，以及对仓颉源码文件的轻量统计。仅使用标准库，不得调用 shell 拼接命令。

## 公开 API

```cangjie
public struct CapturedProcess {
    public let exitCode: Int64
    public let stdout: String
    public let stderr: String
    public init(exitCode: Int64, stdout: String, stderr: String)
    public func combined(): String
}

public struct SourceFacts {
    public let packages: Int64
    public let imports: Int64
    public let functions: Int64
    public init(packages: Int64, imports: Int64, functions: Int64)
}

public class ToolProbe {
    public static func withVariable<T>(key: String, value: String, action: () -> T): T
    public static func capture(command: String, arguments: Array<String>): CapturedProcess
    public static func compilerVersion(): CapturedProcess
    public static func analyze(text: String): SourceFacts
    public static func analyzeFile(path: Path): SourceFacts
}
```

`withVariable` 在调用 `action` 期间设置环境变量；无论闭包正常返回还是抛异常，之后都必须恢复原值，原来不存在则删除。`capture` 使用 `std.process.executeWithOutput`，分别按 UTF-8 解码 stdout/stderr；`combined` 按 stdout、stderr 顺序拼接。`compilerVersion` 执行 `cjc -v`。

`analyze` 使用 `std.regex.Regex` 按行统计以可选空白开头的 `package`、`import`、`func` 声明；注释中出现的单词不能计数。`analyzeFile` 必须通过 `std.fs.File.readFrom` 和 `Path` 读取后复用 `analyze`。

`main()` 使用唯一的临时环境变量键验证作用域值和恢复状态，探测编译器，并分析一段固定源码，精确输出：

```text
env=scoped
restored=true
compiler=ok
facts=1:2:2
```

把随题测试原样放入 `src/`。验收：`cjpm clean/build/test/run` 全部成功，编译 warning 为 0。

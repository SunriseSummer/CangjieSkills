# 确定性 CLI 日志分析与报告工具

## 目标

在仓颉 `1.1.3 (cjnative)` 中实现包 `cli_log_report`。工具解析固定格式日志，按级别、组件正则与时间窗口筛选，生成稳定文本报告，并提供命令行、环境变量、文件系统和本地子进程集成。

实现必须直接使用 `std.argopt`、`std.env`、`std.fs`、`std.regex`、`std.time`、`std.process`；不得用网络、随机数、当前时间或外部服务。目标平台为当前评测环境 `x86_64-w64-mingw32`。

将随题提供的 `cli_log_report_test.cj` 原样复制到项目 `src/`；测试不可修改。

## 日志格式

每个非空行必须完全符合：

```text
yyyy-MM-dd HH:mm:ss [LEVEL] component: message
```

- `LEVEL` 只能是 `TRACE`、`DEBUG`、`INFO`、`WARN`、`ERROR`。
- `component` 只能包含 ASCII 字母、数字、点、下划线和连字符，且不能为空。
- `message` 可以为空，保留原始内容。
- 空行忽略，不计入有效或无效行。
- 时间用 `DateTime.parse(text, "yyyy-MM-dd HH:mm:ss")` 解析；不存在的日期或时间是无效行。

## 公开 API

```cangjie
public class LogToolException <: Exception {
    public init(message: String)
}

public class LogEntry {
    public let timestamp: DateTime
    public let level: String
    public let component: String
    public let message: String
    public init(timestamp: DateTime, level: String, component: String, message: String)
}

public class LogReport {
    public let valid: Int64
    public let matched: Int64
    public let invalid: Int64
    public let first: ?DateTime
    public let last: ?DateTime
    public func levelCount(level: String): Int64
    public func componentCount(component: String): Int64
    public func componentNames(): Array<String>
    public func render(): String
}

public class CliConfig {
    public let inputPath: String
    public let outputPath: String
    public let minLevel: String
    public let componentPattern: String
    public let strict: Bool
    public let probeCommand: String
}

public class ProbeResult {
    public let code: Int64
    public let stdout: String
    public let stderr: String
}

public func parseLogLine(line: String): LogEntry

public func analyzeText(
    text: String,
    minLevel!: String = "TRACE",
    componentPattern!: String = ".*",
    since!: ?DateTime = None,
    until!: ?DateTime = None,
    strict!: Bool = true
): LogReport

public func analyzeFile(
    path: String,
    minLevel!: String = "TRACE",
    componentPattern!: String = ".*",
    since!: ?DateTime = None,
    until!: ?DateTime = None,
    strict!: Bool = true
): LogReport

public func writeReport(path: String, report: LogReport): Unit

public func parseCli(args: Array<String>, envKey!: String = "CJ_LOG_REPORT_LEVEL"): CliConfig

public func runProbe(command: String, arguments: Array<String>): ProbeResult
```

## API 契约

### 解析与筛选

- `parseLogLine` 对格式、级别或时间非法的行抛 `LogToolException`。
- 级别顺序固定为 `TRACE < DEBUG < INFO < WARN < ERROR`；非法 `minLevel` 抛 `LogToolException`。
- `componentPattern` 必须完整匹配组件名；非法正则抛 `LogToolException`。
- `since`、`until` 都是闭区间边界。
- `valid` 是全部有效非空行数（筛选前），`invalid` 是无效非空行数，`matched` 是筛选后行数。
- `strict: true` 遇到首个无效非空行立即抛异常；`strict: false` 跳过并计数。
- `first` / `last` 是匹配记录中的最早/最晚时间；无匹配记录时均为 `None`。
- `levelCount` 与 `componentCount` 只统计匹配记录；未知键返回 `0`。
- `componentNames()` 返回出现过的匹配组件名，按升序排列。

### 报告格式

`render()` 不带末尾换行，固定为：

```text
valid=<n>
matched=<n>
invalid=<n>
first=<yyyy-MM-dd HH:mm:ss 或 ->
last=<yyyy-MM-dd HH:mm:ss 或 ->
level\tTRACE\t<n>
level\tDEBUG\t<n>
level\tINFO\t<n>
level\tWARN\t<n>
level\tERROR\t<n>
component\t<升序名称>\t<n>
...
```

`writeReport` 写入 `render() + "\n"`，覆盖目标文件。文件读写失败统一包装为 `LogToolException`。

### CLI 与环境

`parseCli` 使用 `std.argopt.parseArguments` 解析：

- `--output <path>`，默认 `-`；
- `--level <LEVEL>`，默认读取 `getVariable(envKey)`，环境变量不存在时为 `INFO`；显式选项优先；
- `--component <regex>`，默认 `.*`；
- `--lenient`，设置 `strict = false`；
- `--probe <command>`，默认空字符串；
- 恰好一个非选项参数作为 `inputPath`，`--` 的标准终止扫描语义必须保留。

未知选项、缺值、非选项数量不为 1、非法级别或非法组件正则均包装为 `LogToolException`。

`runProbe` 用 `executeWithOutput` 同步执行并原样返回退出码、UTF-8 stdout 和 stderr；启动失败包装为 `LogToolException`。测试只运行 Windows 自带 `cmd.exe`，不访问网络。

## 工程与入口

`cjpm.toml`：包名 `cli_log_report`，输出类型 `executable`。`main()` 无参数时运行内置固定示例并输出：

```text
probe=probe-ok
valid=3
matched=2
invalid=0
first=2026-01-02 03:04:06
last=2026-01-02 03:04:07
level	TRACE	0
level	DEBUG	0
level	INFO	0
level	WARN	1
level	ERROR	1
component	api	1
component	worker	1
```

## 验收

```text
cjpm clean
cjpm build
cjpm test
cjpm run
```

四条命令均成功，编译器 warning 为 0，且不可修改测试文件。

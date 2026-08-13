# 事件汇总器

在仓颉 `1.0.5 (cjnative)` 中创建可执行包 `event_rollup`，仅使用标准库，实现按服务和严重级别汇总事件的工具。

## 公开 API

```cangjie
public enum Severity {
    Info | Warn | Error
}

public class EventException <: Exception {
    public init(message: String)
}

public struct EventCount {
    public let service: String
    public let severity: Severity
    public let count: Int64
    public init(service: String, severity: Severity, count: Int64)
}

public class EventRollup {
    public init()
    public func total(): Int64
    public func ingest(line: String): Unit
    public func ingestAll(text: String): Unit
    public func count(service: String, severity: Severity): Int64
    public func snapshot(): Array<EventCount>
    public func render(): String
}
```

## 行格式与行为

- 有效行格式为 `service|severity|count`。
- service 和字段两侧的 ASCII 空白应去除；service 不能为空。
- severity 忽略 ASCII 大小写，允许 `info`、`warn`、`error`。
- count 为严格正十进制 `Int64`。
- `ingest` 遇到字段数错误、空 service、未知 severity、非法或非正 count 时抛 `EventException`，且不得改变已有状态。
- `ingestAll` 按行处理文本，忽略空行和去除首尾 ASCII 空白后以 `#` 开头的注释行；任一有效数据行错误时抛异常，之前已成功处理的行保留。
- 相同 service 和 severity 的 count 累加；`total()` 返回全部 count 的总和。
- `snapshot()` 按 service 升序排列，同一 service 内按 Info、Warn、Error 排列，只包含 count 大于 0 的项；返回独立数组。
- `render()` 每项一行：`service|INFO|count`、`service|WARN|count` 或 `service|ERROR|count`；无数据时返回空串。

`main()` 使用内置数据：

```text
api|info|2
worker|error|1
api|warn|3
api|info|1
```

并输出：

```text
api|INFO|3
api|WARN|3
worker|ERROR|1
total=7
```

把随题 `event_rollup_test.cj` 原样放入 `src/`。验收要求 `cjpm clean/build/test/run` 全部成功且编译 warning 为 0。

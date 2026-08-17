# 多项目质量排行榜

使用仓颉 `1.1.3 (cjnative)` 创建可执行 cjpm 项目 `scoreboard`，仅使用标准库，实现一套可复用的项目质量统计与稳定排序组件。不得修改给定测试。

## 公开 API

```cangjie
public enum BuildState <: Equatable<BuildState> {
    Passed | Failed | Skipped
}

public class ScoreException <: Exception {
    public init(message: String)
}

public struct Submission {
    public let project: String
    public let owner: String
    public let state: BuildState
    public let durationMs: Int64
    public let warnings: Int64
    public init(project: String, owner: String, state: BuildState, durationMs: Int64, warnings: Int64)
}

public struct ProjectScore {
    public let project: String
    public let passed: Int64
    public let failed: Int64
    public let skipped: Int64
    public let totalDurationMs: Int64
    public let warnings: Int64
    public let owners: Array<String>
}

public class Scoreboard {
    public init()
    public func add(submission: Submission): Unit
    public func ingest(text: String): Unit
    public func project(name: String): ?ProjectScore
    public func ranking(): Array<ProjectScore>
    public func render(): String
}
```

## 语义

- `add` 拒绝空白项目名、空白 owner、负 duration 或负 warnings，抛 `ScoreException`，失败时状态不变。
- `ingest` 每个有效行格式为 `project|owner|state|durationMs|warnings`；忽略空行与首尾裁剪后以 `#` 开头的行。字段裁剪 ASCII 空白；state 忽略 ASCII 大小写，取 `passed/failed/skipped`；整数必须是非负十进制。任一行错误时，之前成功的行保留，错误行不产生局部更新。
- 同一项目聚合所有提交。`owners` 去重并按字典序升序排列；返回数组必须与内部状态独立。
- `ranking()` 只返回存在提交的项目，按以下键排序：failed 升序、passed 降序、warnings 升序、totalDurationMs 升序、project 升序。
- `project` 不存在时返回 `None`。
- `render()` 使用 ranking 顺序，每行格式：`project|passed|failed|skipped|durationMs|warnings|owner1,owner2`；无数据时返回空串。
- `main()` 加入若干内置数据并逐行输出 `render()`，最后输出 `projects=<数量>`。

## 工程与验收

- 将给定 `scoreboard_test.cj` 原样复制到 `src/`，不得修改。
- 生产代码应合理拆分；实现一般化语义，禁止针对测试常量硬编码。
- 最终执行 `cjpm build`、`cjpm test --no-color`、`cjpm run`，全部成功且没有编译器 warning。

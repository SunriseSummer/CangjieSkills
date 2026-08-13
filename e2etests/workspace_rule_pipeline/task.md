# 多模块规则流水线工作区

使用仓颉 1.0.5 创建一个 `workspace_rule_pipeline` 工作区，包含 `core`、`builtins`、`facade`、`app` 四个成员模块。不得修改给定测试。

## 工程约束

- 工作区根 `cjpm.toml` 只含 `[workspace]`，成员为上述四个目录。
- `builtins` 以本地路径依赖 `core`；`facade` 依赖 `core` 与 `builtins`；`app` 只直接依赖 `facade`。
- `facade` 必须用 `public import` 重新导出 core 与 builtins 的公开 API；`app` 及其测试只允许 `import rule_facade.*`。
- `core`、`builtins`、`facade` 输出静态库，`app` 输出可执行程序。
- 把给定 `workspace_rule_pipeline_test.cj` 原样放入 `app/src/`。

## 公开 API

`rule_core`：

```cangjie
public enum RuleResult<T> { | Accept(T) | Reject(String) }
public interface Rule<I, O> {
    prop name: String
    func apply(input: I): RuleResult<O>
}
public type TextResult = RuleResult<String>
public type TextRule = Rule<String, String>
public func accepted<T>(result: RuleResult<T>): Bool
public func rejectedReason<T>(result: RuleResult<T>): ?String
```

`rule_builtins`：

```cangjie
public class TrimRule <: Rule<String, String>
public class PrefixRule <: Rule<String, String> {
    public init(prefix: String)
}
public class RejectEmptyRule <: Rule<String, String>
public class ReplaceRule <: Rule<String, String> {
    public init(from: String, to: String)
}
```

所有规则的 `name` 分别为 `trim`、`prefix`、`reject-empty`、`replace`。`TrimRule` 使用 ASCII trim；`ReplaceRule` 替换全部匹配子串。

`rule_facade`：

```cangjie
public class TextPipeline {
    public init()
    public func add(rule: TextRule): TextPipeline
    public prop size: Int64
    public func names(): Array<String>
    public func run(input: String): TextResult
}
```

流水线按加入顺序执行；任一步 Reject 后立即停止并原样返回原因；空流水线接受原输入。`add` 返回当前流水线以支持链式调用。

## 验收

在工作区根执行 `cjpm clean`、`cjpm build`、`cjpm test`；在 `app` 执行 `cjpm run`。全部通过且编译 warning 为 0。

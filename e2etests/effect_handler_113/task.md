# 1.1.3 Effect Handler 配置解析

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `effect_handler_113`。将随题提供的 `effect_handler_113_test.cj` 原样复制到项目 `src/`，测试不可修改。项目使用 stdx `1.1.3.1`，并在 `cjpm.toml` 中同时配置 `--experimental --enable-eh`。

实现以下公开 API：

```cangjie
public class SettingRequest <: Command<String> {
    public let key: String
    public init(key: String)
    public override func defaultImpl(): String
}

public func requestPair(
    first: String,
    second: String,
    resolver: (String) -> String
): String

public func requestPairWithDefaults(first: String, second: String): String
```

要求：

- `SettingRequest.defaultImpl()` 返回 `missing:<key>`。
- `requestPair` 在同一个 `try` 主流程中依次 `perform SettingRequest(first)` 与 `perform SettingRequest(second)`；匹配的 `handle` 调用 `resolver(command.key)`，再用 `resume with` 恢复，每次请求恰好调用 resolver 一次，最终返回 `<first-result>|<second-result>`。
- `requestPairWithDefaults` 不声明 handler，直接依赖 `defaultImpl` 完成两个 `perform`。
- 不得以普通函数调用、异常、映射表或条件分支替代 `perform`/`handle`/`resume`；不得吞掉 `UnhandledCommandException` 或 `DoubleResumeException`。
- 需要统计可变状态时使用引用对象或原子量，不直接在 handler 中捕获并修改局部 `var`。

先按 Skill 流程配置 stdx，再执行 `cjpm clean && cjpm test`（PowerShell 可分两条命令）；全部测试通过且生产源码零 warning。


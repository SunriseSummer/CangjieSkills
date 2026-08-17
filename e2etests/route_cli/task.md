# 多规则文本路由 CLI

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `route_cli`。使用 `std.argopt.parseArguments` 解析选项，使用 `std.regex.Regex` 判断规则；不得手写扫描 `--option`/`-o` 字符串替代 argopt，也不得用普通字符串包含判断替代正则。

## 公开 API

```cangjie
public class CliConfigException <: Exception {
    public init(message: String)
}

public class RouteRule {
    public let name: String
    public let pattern: String
    public init(name: String, pattern: String)
}

public class RoutePlan {
    public let rules: Array<RouteRule>
    public let ignoreCase: Bool
    public let defaultTag: ?String
    public let inputs: Array<String>
    public init(rules: Array<RouteRule>, ignoreCase: Bool, defaultTag: ?String, inputs: Array<String>)
    public func classify(lines: Array<String>): Array<String>
}

public class RouteCli {
    public static func parse(args: Array<String>): RoutePlan
}
```

## 命令行与行为

- `--route` / `-r`：必需值，格式为 `NAME=REGEX`；可重复，保持出现顺序，至少出现一次。名称和表达式均不得为空，正则必须合法。
- `--ignore-case` / `-i`：无值开关，使全部规则使用 `RegexFlag.IgnoreCase`。
- `--default` / `-d`：可选值。未出现时 `defaultTag=None`；仅写 `--default`、`-d` 或显式空值时标签为 `other`；`--default=NAME` 或 `-dNAME` 使用给定名称；重复时最后一次为准。
- 非选项参数按原顺序写入 `inputs`；`--` 终止选项扫描。
- argopt 语法错误、规则格式错误、非法正则和规则缺失全部转换为 `CliConfigException`。

`classify` 按输入行顺序处理，每行采用第一条匹配规则，输出 `NAME:原行`；没有规则匹配且存在默认标签时输出 `DEFAULT:原行`，否则丢弃。返回数组、`rules` 和 `inputs` 都不得与调用方数组共享可变数组存储。

`main()` 解析以下参数：

```text
--route=error=^E[0-9]+ -r warn=warn -i --default logs.txt
```

对 `E42 disk`、`WARN cpu`、`ok` 分类并输出：

```text
inputs=logs.txt
routes=error,warn
classified=error:E42 disk|warn:WARN cpu|other:ok
```

把随题测试原样复制到 `src/`。验收：`cjpm clean/build/test/run` 全部成功，warning 为 0。

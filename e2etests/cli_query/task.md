# 类型化命令行查询计划

在仓颉 `1.0.5 (cjnative)` 中创建可执行包 `cli_query`。使用 `std.argopt.parseArguments` 与 `ArgumentSpec` 把参数解析为可复用查询计划，再对内存文本行执行过滤。不得手写扫描 `--option`/`-o` 字符串替代 argopt。

## 公开 API

```cangjie
public class QueryException <: Exception {
    public init(message: String)
}

public class QueryPlan {
    public let pattern: String
    public let ignoreCase: Bool
    public let limit: ?Int64
    public let inputs: Array<String>
    public init(pattern: String, ignoreCase: Bool, limit: ?Int64, inputs: Array<String>)
    public func apply(lines: Array<String>): Array<String>
}

public class QueryPlanner {
    public static func parse(args: Array<String>): QueryPlan
}
```

支持下列规格：

- `--pattern` / `-p`：必需值；整个命令只要求最终解析结果中存在一个非空 pattern；重复出现时以最后一次为准。
- `--ignore-case` / `-i`：无值开关。
- `--limit` / `-n`：必需十进制正整数；缺失表示无限制。
- 非选项参数按原顺序写入 `inputs`；`--` 后内容都视为非选项。

argopt 语法错误、缺少/空 pattern、非法或非正 limit 均转为 `QueryException`。`apply` 按输入顺序返回包含 pattern 的行；ignoreCase 为 true 时使用 `std.unicode` 的字符串大小写转换进行比较；达到 limit 后立即停止。结果与 inputs 都必须是独立数组。

`main()` 解析 `--pattern=api -i --limit 2 app.log archive.log`，对 `API ready`、`web`、`api done`、`Api extra` 执行并输出：

```text
pattern=api
inputs=app.log,archive.log
matches=API ready|api done
```

把随题测试原样放入 `src/`。验收：`cjpm clean/build/test/run` 全部成功，warning 为 0。

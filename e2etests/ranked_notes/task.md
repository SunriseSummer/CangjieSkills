# 排序便签 CLI

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `ranked_notes`。使用 `std.argopt.parseArguments` 解析选项，使用 `std.sort.sort` 生成稳定快照；不得手写扫描 `--option`/`-o` 字符串替代 argopt。

## 公开 API

```cangjie
public class NoteConfigException <: Exception {
    public init(message: String)
}

public class RankedNote {
    public let title: String
    public let priority: Int64
    public init(title: String, priority: Int64)
}

public class NotePlan {
    public let notes: Array<RankedNote>
    public let defaultPriority: Int64
    public let inputs: Array<String>
    public init(notes: Array<RankedNote>, defaultPriority: Int64, inputs: Array<String>)
    public func snapshot(): Array<(String, Int64)>
}

public class NoteCli {
    public static func parse(args: Array<String>): NotePlan
}
```

## 命令行与行为

- `--note` / `-n`：必需值，可重复，保持出现顺序；值为 `TITLE` 或 `TITLE:PRIORITY`。标题不得为空；显式优先级必须是合法 `Int64`。
- `--default` / `-d`：可选值，未出现时为 0；仅写 `--default`、`-d` 或显式空值时为 10；附着值 `--default=N` 或 `-dN` 使用解析后的 `Int64`；重复时最后一次为准。
- 没有显式优先级的所有便签统一使用最终默认值，即默认选项可以出现在便签之后。
- 非选项参数按原顺序写入 `inputs`；`--` 终止选项扫描。
- argopt 错误、非法默认值、非法便签、非法显式优先级和便签缺失全部转换为 `NoteConfigException`。

`snapshot()` 返回 `(标题, 优先级)` 数组：优先级降序，相同优先级按标题升序；不得依赖元组实现 `Comparable`，应选择显式比较重载。构造函数必须克隆传入数组，快照也不得与内部数组共享可变数组存储。

`main()` 解析：

```text
--note=alpha:2 -n beta --default=5 notes.txt
```

并输出：

```text
default=5
inputs=notes.txt
snapshot=beta:5,alpha:2
```

把随题测试原样复制到 `src/`。验收：`cjpm clean/build/test/run` 全部成功，warning 为 0。

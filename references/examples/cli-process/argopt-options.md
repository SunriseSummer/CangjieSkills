<!-- cj-doc kind="example-leaf" level="4" id="examples.cli-process.argopt-options" parent="examples.cli-process" -->
# 解析长短选项、重复值与位置参数

[← 命令行与子进程](index.md)

用 ArgumentSpec.Full 统一长短别名；RequiredValue 接收独立值，OptionalValue 只接收附着值且缺省时回调得到空字符串，nonOptions 保留位置参数。

## 典型示例

同一个 `Full` 规格同时接收长、短选项；回调按参数出现顺序执行，因此长短别名混用或重复赋值时，状态对象的最后一次写入就是最终值。`OptionalValue` 的值必须附着在选项上：省略值或写 `--label=` 时回调都收到空字符串，后续独立参数仍是位置参数。不要让回调捕获局部 `var`：把可变字段放进由 `let` 绑定的引用对象。位置参数直接读取 `ParsedArguments.nonOptions`；`--` 会停止选项扫描。

```cangjie cjtest=run id=examples.cli-process.argopt-options.api.argopt.state-holder.run form=unit timeout=20s
package argopt_state

import std.argopt.*
import std.collection.ArrayList

class CliState {
    var output = ""
    var verbose = false
    let labels = ArrayList<String>()
}

main(): Unit {
    let state = CliState()
    let parsed = parseArguments(
        ["--output", "draft.txt", "-o", "final.txt", "--label", "source.cj",
            "--label=chosen", "-v", "--", "--literal"],
        [
            ArgumentSpec.Full("output", r'o', ArgumentMode.RequiredValue,
                {value => state.output = value}),
            ArgumentSpec.Full("verbose", r'v', ArgumentMode.NoValue,
                {_ => state.verbose = true}),
            ArgumentSpec.Full("label", r'l', ArgumentMode.OptionalValue,
                {value => state.labels.add(if (value.isEmpty()) { "fallback" } else { value })})
        ]
    )
    println("output=${state.output}")
    println("verbose=${state.verbose}")
    println("labels=${String.join(state.labels.toArray(), delimiter: ",")}")
    println("inputs=${String.join(parsed.nonOptions, delimiter: ",")}")
}
```

预期标准输出：

```text cjtest=expect for=examples.cli-process.argopt-options.api.argopt.state-holder.run stream=stdout match=exact
output=final.txt
verbose=true
labels=fallback,chosen
inputs=source.cj,--literal
```

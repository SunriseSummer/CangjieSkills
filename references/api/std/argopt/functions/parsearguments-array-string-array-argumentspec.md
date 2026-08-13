<!-- cj-doc kind="api-member" level="5" id="std.argopt.func.parsearguments-array-string-array-argumentspec" parent="std.argopt" -->
# parseArguments(Array<String>, Array<ArgumentSpec>)

[← std.argopt](../index.md)

## 签名

```cangjie role=signature
public func parseArguments(args: Array<String>, specs: Array<ArgumentSpec>): ParsedArguments
```

根据提供的参数规范 `specs` 解析命令行参数 `args`，返回一个结构化的对象，包含解析后的选项和非选项参数。

## 契约

该函数将 `args` 中的每个参数与 `specs` 中定义的选项进行匹配。对于匹配成功的选项，它会将选项名称和对应的值加入到 options 中，未匹配的参数会被当作非选项参数处理，并添加到 nonOptions 中。此外，当解析到 `--` 时，将提前终止选项扫描，其后的所有参数都将被视作`非选项`。

该函数支持 `短选项`、`长选项`、`短前缀长选项`、`短选项组合`、`非选项`、`非法选项` 的解析处理。

`specs` 的每个 ArgumentSpec 持有的 ArgumentMode 决定了参数的处理方式。

- 对于长选项，根据不同的 ArgumentMode 仅可以处理以下格式：
    - RequiredValue: `--option=value` or `--option value`
    - OptionalValue: `--option=value` or `--option`
    - NoValue: `--option`

- 对于短选项，根据不同的 ArgumentMode 仅可以处理以下格式：
    - RequiredValue: `-ov` or `-o v`
    - OptionalValue: `-ov` or `-o`
    - NoValue: `-o`

对于短选项组合的场景：

- 当解析到第一个非 NoValue 的选项时:
    - 如果该选项为 OptionalValue，紧随选项后的内容若存在，则会被作为该选项的值来解析。
    - 如果该选项为 RequiredValue，紧随选项后的内容会被作为该选项的值来解析。
- 如果一组短选项可以组合成长选项的字面值，那么视为长选项而非短选项组合，如 -abc 同时已定义了 `abc` 的长选项和 `a` `b` `c` 三个短选项，会被视作长选项解析。

如果 ArgumentSpec 提供了 `lambda` 回调函数，该回调会在解析成功后被调用，处理解析到的参数值。

如果传入的 `args` 存在对同一选项多次赋值的情况，则以最后一次的值作为该选项的值。

参数：

- args: Array\<String> - 被解析的参数。

- specs: Array\<ArgumentSpec> - 参数的规范。

返回值：

- ParsedArguments - 参数解析的结果。

异常：

- ArgumentParseException - 当参数解析失败或解析到`非法选项`时，抛出异常。

- IllegalArgumentException - 当定义了相同 `name` 的 ArgumentSpec 时，抛出异常。

## 典型示例

同一个 `Full` 规格同时接收长、短选项；回调按参数出现顺序执行，因此长短别名混用或重复赋值时，状态对象的最后一次写入就是最终值。`OptionalValue` 的值必须附着在选项上：省略值或写 `--label=` 时回调都收到空字符串，后续独立参数仍是位置参数。不要让回调捕获局部 `var`：把可变字段放进由 `let` 绑定的引用对象。位置参数直接读取 `ParsedArguments.nonOptions`；`--` 会停止选项扫描。

```cangjie cjtest=run id=api.argopt.state-holder.run form=unit timeout=20s
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

```text cjtest=expect for=api.argopt.state-holder.run stream=stdout match=exact
output=final.txt
verbose=true
labels=fallback,chosen
inputs=source.cj,--literal
```

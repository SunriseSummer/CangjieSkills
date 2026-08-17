<!-- cj-doc kind="example-leaf" level="4" id="examples.cli-process.command-line-arguments" parent="examples.cli-process" -->
# 接收并遍历命令行参数

[← 命令行与子进程](index.md)

命令行参数由 `main(args: Array<String>)` 直接接收；1.1.3 使用 `cjpm run -- <args...>` 保持实参边界，需验证程序退出码时直接运行构建产物。

## 完整工程

命令行参数由 `main(args: Array<String>)` 直接接收，数组中不包含程序名；仓颉 1.1.3 没有 `getCommandLineArgs()` 全局函数。通过 cjpm 传递普通参数时使用 `cjpm run -- --mode fast input.txt`。

仓颉 1.1.3 实测 `cjpm run -- --mode=fast` 会向程序传递完整的 `--mode=fast`。旧 `--run-args` 会把等号拆成参数边界，对只接受附着值的 `OptionalValue` 会改变语义；兼容旧脚本时可暂用短附着形式 `-d5`，新脚本应迁移到 `--` 分隔形式。

需要报告失败时可把入口返回类型改为 `Int64`，正常路径返回 0、错误路径返回非零值并用 `eprintln` 写诊断。Windows x64 cjnative 1.1.3 实测中 `cjpm run` 不透传程序的非零状态；自动测试退出码时应直接运行构建产物，完整模式见“报告并验证命令行退出状态”。

```toml cjtest=project id=app.command-line-arguments file=cjpm.toml command=run timeout=60s
[package]
cjc-version = "1.1.3"
name = "command_line_arguments"
version = "0.1.0"
output-type = "executable"
```

仓颉源码 `src/main.cj`：

```cangjie cjtest=file project=app.command-line-arguments file=src/main.cj
package command_line_arguments

main(args: Array<String>): Unit {
    println("count=${args.size}")
    for ((index, value) in args.iterator().enumerate()) {
        println("${index}:${value}")
    }
}
```

预期标准输出：

```text cjtest=expect for=app.command-line-arguments stream=stdout match=exact
count=0
```

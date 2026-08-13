<!-- cj-doc kind="example-category" level="3" id="examples.cli-process" parent="examples" -->
# 命令行与子进程

[← 应用示例](../index.md)

接收程序参数、返回退出状态，并启动子进程和处理其输出。

| 示例 | 教学目标 |
|---|---|
| [接收并遍历命令行参数](command-line-arguments.md) | 命令行参数由 `main(args: Array<String>)` 直接接收；`cjpm run --run-args` 会拆分单个实参里的 `=`，需保持精确边界或验证退出码时直接运行构建产物。 |
| [解析长短选项、重复值与位置参数](argopt-options.md) | 用 ArgumentSpec.Full 统一长短别名；RequiredValue 接收独立值，OptionalValue 只接收附着值且缺省时回调得到空字符串，nonOptions 保留位置参数。 |
| [报告并验证命令行退出状态](cli-exit-status.md) | `main(args): Int64` 用非零值报告失败；测试退出码时直接运行构建产物，因为 Windows 上 cjpm 1.0.5 不透传该状态。 |
| [执行子进程并捕获输出](process-output.md) | 调用真实可执行程序，合并 stdout/stderr，并以 trimAscii 处理跨平台换行。 |
